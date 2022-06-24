<?php
class News {
    public function __construct()
    {
        $this->DB = new Database();
    }

    public function addNews()
    {
        $_POST = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING);
        $data = [
            'title' => trim($_POST['title']),
            'description' => trim($_POST['description']),
            'link' => trim($_POST['link']),
            'img' => $this->insertImg(),
            'id' => 1
        ];
        print_r($data);
        if(!in_array('error', $data)) {
            $this->DB->insert('INSERT INTO news (Name_of_the_news, News_description, ID_employees, news_img, news_link) VALUES (:title, :description, :id, :img, :link)', $data);
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
                if ($initialExtension !== '.jpeg') {
                    return false;
                } else {
                    move_uploaded_file($fileTmpName, 'D:\Program Files\XP\htdocs\nanike\img\news\\' . $name . $initialExtension);

                    return $name . $initialExtension;
                }
            }
        } else return false;
    }

    public function getRandomFileName($path) {
        $path = $path ? $path . '/' : '';
        do {
            $name = md5(microtime() . rand(0, 9999));
            $file = $path . $name;
        } while (file_exists($file));

        return $name;
    }

    public function getAllNews()
    {
        return $this->DB->getAllAssoc('SELECT * FROM news');
    }
}
