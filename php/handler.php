<?php

require_once "require.php";
if (!isset($User)) {$User = new Users();}
if (!isset($News)) {$News = new News();}
if (!isset($Fines)) {$Fines = new Fines();}
if (!isset($Feedback)) {$Feedback = new Feedback();}

if (isset($_POST['fine_search'])) {
    header('location: ' . URLROOT . 'php/index.php');
}

if (isset($_POST['log_in_submit'])) {
    $User->logIn();
}

if (isset($_POST['log_out_submit'])) {
    $User->makeAGuest();
    header('location: ' . URLROOT . 'php/index.php');
}

if($_SESSION['user_id'] == 16) {
    if (isset($_POST['news_submit'])) {
        $News->addNews();
        header('location: ' . URLROOT . 'php/add.php');
    }

    if (isset($_POST['fine_submit'])) {
        $Fines->addFine();
        header('location: ' . URLROOT . 'php/add.php');
    }
}


if (isset($_POST['user_surname'])) {
    $User->register();
}

if (isset($_POST['feedback_submit'])) {
    $Feedback->addFeedback($_SESSION['user_id']);
    header('location: ' . URLROOT . 'php/cabinet.php');
}

if (isset($_POST['delete_submit'])) {
    $User->deleteUser($_SESSION['user_id']);
    $User->makeAGuest();
    header('location: ' . URLROOT . 'php/index.php');
}