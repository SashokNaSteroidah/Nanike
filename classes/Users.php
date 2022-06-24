<?php

require_once "require.php";
class Users {
    public function __construct()
    {
        $this->DB = new Database();
    }
    // ------------------------------------------------------------------------------------------------------------------------------
    public function register()
    {
        // Фильтрование данных массива $_POST
        print_r($_POST);
        $_POST = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING);
        $errors = array(
            'usernameError' => '',
            'passwordError' => '',
            'emailError' => '',
            'phoneError' => '',
            'criticalError' => ''
        );
        // Ассоциативный массив с введенными данными и ошибками
        $data = [
            'name' => trim($_POST['name']),
            'surname' => trim($_POST['user_surname']),
            'email' => trim($_POST['email']),
            'phone' => trim($_POST['phone']),
            'patronymic' => trim($_POST['patronymic']),
            'birthday' => trim($_POST['birthday']),
            'password' => trim($_POST['password']),
            'license' => trim($_POST['license']),
            'series' => trim($_POST['passport_series']),
            'number' => trim($_POST['passport_number'])
        ];

        // Регулярные выражения для валидации
        $letterRegexp = "/([a-zA-Z])/";
        $oneDigitRegexp = "/(?=.*\d)/";
        // Проверка логина на недопустимые символы
        if (empty($data['name'])) {
            $errors['usernameError'] = 'Пожалуйста, введите логин.';
        }

        //Проверка email
        if ($this->userEmailExists(['user_email' => $data['email']])) {
            $errors['emailError'] = 'Аккаунт с таким email уже существует.';
        }

        //Проверка номера телефона
        if ($this->userPhoneExists(['user_phone' => $data['phone']])) {
            $errors['phoneError'] = 'Аккаунт с таким номером телефона уже существует.';
        }

       // Проверка пароля на соответствие безопасности
        if (empty($data['password'])) {
            $errors['passwordError'] = 'Пожалуйста, введите пароль';
        } elseif (strlen($data['password']) < 8) {
            $errors['passwordError'] = 'Пароль должен содержать хотя бы 8 символов.';
        } elseif (!preg_match($letterRegexp, $data['password'])) {
            $errors['passwordError'] = 'Пароль должен содержать хотя бы одну букву латинского алфавита';
        } elseif (!preg_match($oneDigitRegexp, $data['password'])) {
            $errors['passwordError'] = 'Пароль должен содержать хотя бы одну цифру';
        }

        // Проверка на наличие ошибок
        if (empty($errors['usernameError']) && empty($errors['emailError']) && empty($errors['passwordError']) && empty($errors['confirmPasswordError'])) {
            //Хэширование
            $data['password'] = password_hash($data['password'], PASSWORD_DEFAULT);
            //Внос данных пользователя в БД
            if ($this->registration($data)) {
                header('location:' . URLROOT . 'php/index.php');
            }
        } else {
            $_SESSION['reg_errors'] = $errors;
            header('location:' . URLROOT . 'php/reg.php');
        }
    }

    public function registration($data): bool
    {
        $qry = "INSERT INTO client (client_email, name_of_the_user, surname_of_the_user, patronymic_of_the_user, phone_number, passport_series, number_passport, user_password, user_date_of_birth, user_rights_numbe) VALUES (:email, :name, :surname, :patronymic, :phone, :series, :number, :password, :birthday, :license)";
        $this->DB->insert($qry,$data);
        $id = $this->getUserId(array('email' => $data['email']));
        $user = $this->getUser($id);
        $this->createUserSession($user);
        return true;
    }
    public function getUserId($email)
    {
        $qry = 'SELECT ID_client FROM client where Client_Email = :email';
        $id = $this->DB->getRow($qry, $email);
        return $id->ID_client;
    }
    // ------------------------------------------------------------------------------------------------------------------------------

    public function logIn()
    {
        $_POST = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING);

        $data = [
            'user_password' => trim($_POST['password']),
            'user_phone' => trim($_POST['phone'])
        ];
        $errors = [
            'phoneError' => '',
            'passwordError' => '',
            'criticalError' => ''
        ];

        if (!empty($data['user_email']) || !empty($data['user_phone'])) {
            //Validate phone number
            if (!$this->userPhoneExists(['user_phone' => $data['user_phone']]) && empty($data['user_email'])) {
                $errors['phoneError'] = 'Не найдено аккаунта с таким номером телефона';
            }
        } else {
            $errors['criticalError'] = 'Пожалуйста, введите ваш номер телефона и пароль';
        }

        //Check if all errors are empty
        if (empty($errors['passwordError']) && empty($errors['phoneError']) && empty($errors['criticalError'])) {

            $loggedInUser = $this->logInUser(['user_phone' => $data['user_phone']], $data['user_password']);

            if ($loggedInUser) {
                $this->createUserSession($loggedInUser);

            } else {
                $errors['passwordError'] = 'Неправильный пароль. Пожалуйста, попробуйте снова.';
                $_SESSION['log_in_errors'] = $errors;
                header('location:' . URLROOT . 'php/index.php');
            }

        } else {
            $_SESSION['log_in_errors'] = $errors;
            header('location:' . URLROOT . 'php/index.php');
        }
    }

    public function getUser($id)
    {
        $data = ['id' => $id];
        return $this->DB->getRow('SELECT * FROM client WHERE ID_client = :id', $data);
    }

    public function logInUser($data, $password) {
        $sql = 'SELECT * FROM client WHERE Phone_number = :user_phone';
        $row = $this->DB->getRow($sql, $data);

        print_r($row);
        echo '<br>';
        echo '<br>';

        $hashedPassword = $row->User_password;

        if (password_verify($password, $hashedPassword)) {
            return $row;
        } else {
            return false;
        }
    }

    public function makeAGuest()
    {
        $_SESSION = [];
        $_SESSION['logged_in'] = 0;
        $_SESSION['user_id'] = 0;
        $_SESSION['user_email'] = 'guest@gmail.com';
    }


    public function userEmailExists($data): bool
    {
        $sql = 'SELECT * FROM client WHERE Client_Email = :user_email';
        $row = $this->DB->getRow($sql, $data);
        return !empty($row);
    }

    public function userPhoneExists($data): bool
    {
        $sql = 'SELECT * FROM client WHERE Phone_number = :user_phone';
        $row = $this->DB->getRow($sql, $data);
        return !empty($row);
    }


    public function createUserSession($user) {
        $_SESSION = [];
        $_SESSION['logged_in'] = 1;
        $_SESSION['user_id'] = $user->ID_client;
        $_SESSION['user_email'] = $user->Client_Email;
        $_SESSION['user_name'] = $user->Name_of_the_user;
        $_SESSION['user_surname'] = $user->Surname_of_the_user;
        $_SESSION['user_patronymic'] = $user->Patronymic_of_the_user;
        $_SESSION['user_phone'] = $user->Phone_number;
        header('location:' . URLROOT . 'php/index.php');
    }


    public function getAllUsers()
    {
        return $this->DB->getAllAssoc('SELECT ID_client FROM client');
    }

    public function getEmployees()
    {
        return $this->DB->getAllAssoc('SELECT ID_employees, Surname_Employees, Name_Employees, Patronymic_Employees FROM employees');
    }

    public function deleteUser($id)
    {
        $data = ['id' => $id];
        $this->DB->executeSQL('DELETE FROM client WHERE ID_client = :id', $data);
    }
}
