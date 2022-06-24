<?php
require_once "../classes/Database.php";
require_once "../classes/Fines.php";
require_once "../classes/Users.php";
require_once "../classes/News.php";
require_once "../classes/Feedback.php";

session_start([
    'cookie_lifetime' => 777600,
]);
if ($_SESSION['logged_in'] === 0 || empty($_SESSION['logged_in'])) {
    $User = new Users();
    $User->makeAGuest();
}

if (!defined('ROOT')) define('ROOT', "/Applications/XAMPP/xamppfiles/htdocs/nanike/");

//URLROOT (Dynamic links)
define('URLROOT', 'https://pavlushin.mpt.ru/nanike/');
