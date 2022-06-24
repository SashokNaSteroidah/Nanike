<?php
class Fines {
    public function __construct()
    {
        $this->DB = new Database();
    }
    public function getFinesByUser($user_id)
    {
        $data = ['id' => $user_id];
        return $this->DB->getAllAssoc('SELECT * FROM fine INNER JOIN fine_category ON fine.ID_fine_category = fine_category.ID_fine_category where fine.ID_client = :id', $data);
    }

    public function fineSearch($user_id, $sts_number)
    {
        $data = ['id' => $user_id, 'sts' => $sts_number];
        print_r($data);
        return $this->DB->getAllAssoc('SELECT * FROM fine INNER JOIN fine_category ON fine.ID_fine_category = fine_category.ID_fine_category where fine.ID_client = :id AND fine.fine_sts = :sts', $data);
    }

    public function addFine()
    {
        echo '<br>';
        print_r($_POST);
        echo '<br>';
        echo '<br>';
        $_POST = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING);
        $data = [
            'sts' => trim($_POST['sts']),
            'fine_category' => $_POST['fine_category'],
            'description' => trim($_POST['description']),
            'value' => trim($_POST['fine_value']),
            'user_id' => $_POST['user_id'],
            'img' => $this->insertImg(),
            'employee_id' => trim($_POST['employee'])
        ];
        print_r($data);
        if(!in_array('error', $data)) {
            $this->DB->insert('INSERT INTO fine (fine_value, fine_description, fine_img, fine_sts, id_client, id_fine_category, id_employees) VALUES (:value, :description, :img, :sts, :user_id, :fine_category, :employee_id)', $data);
        } else {
            print_r('errior');
        }
    }

    public function insertImg(){
        if (isset($_FILES['img'])) {

            $fileTmpName = $_FILES['img']['tmp_name'];
            $errorCode = $_FILES['img']['error'];

            if ($errorCode !== UPLOAD_ERR_OK || !is_uploaded_file($fileTmpName)) {
                $errorMessages = [
                    UPLOAD_ERR_INI_SIZE   => 'Размер файла превысил значение upload_max_filesize в конфигурации PHP.',
                    UPLOAD_ERR_FORM_SIZE  => 'Размер загружаемого файла превысил значение MAX_FILE_SIZE в HTML-форме.',
                    UPLOAD_ERR_PARTIAL    => 'Загружаемый файл был получен только частично.',
                    UPLOAD_ERR_NO_FILE    => 'Файл не был загружен.',
                    UPLOAD_ERR_NO_TMP_DIR => 'Отсутствует временная папка.',
                    UPLOAD_ERR_CANT_WRITE => 'Не удалось записать файл на диск.',
                    UPLOAD_ERR_EXTENSION  => 'PHP-расширение остановило загрузку файла.',
                ];
                $unknownMessage = 'При загрузке файла произошла неизвестная ошибка.';
                return $errorMessages[$errorCode] ?? $unknownMessage;
            } else {
                $fi = finfo_open( FILEINFO_MIME_TYPE);
                $mime = (string) finfo_file($fi, $fileTmpName);
                if (strpos($mime, 'image') === false) die('Можно загружать только изображения.');

                $imageData = getimagesize($fileTmpName);

                $limitBytes  = 5000000;
                if (filesize($fileTmpName) > $limitBytes) die('Размер изображения не должен превышать 5 Мбайт.');

                $name = $this->getRandomFileName($fileTmpName);
                $initialExtension = image_type_to_extension($imageData[2]);
                if ($initialExtension !== '.jpeg' && $initialExtension !== '.jpg') {
                    return 'lol';
                } else {
                    move_uploaded_file($fileTmpName, 'D:\Program Files\XP\htdocs\nanike\img\fine\\' . $name . $initialExtension);

                    return $name . $initialExtension;
                }
            }
        } else return 'hah';
    }

    public function getRandomFileName($path) {
        $path = $path ? $path . '/' : '';
        do {
            $name = md5(microtime() . rand(0, 9999));
            $file = $path . $name;
        } while (file_exists($file));

        return $name;
    }

    public function getFineCategories()
    {
        return $this->DB->getAllAssoc('SELECT * FROM fine_category');
    }
}