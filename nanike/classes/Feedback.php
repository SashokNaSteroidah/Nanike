<?php
class Feedback {
    public function __construct()
    {
        $this->DB = new Database();
    }

    public function getTopics()
    {
        return $this->DB->getAllAssoc('SELECT * FROM topics');
    }

    public function addFeedback($id)
    {
        $data = [
            'id' => $id,
            'review' => trim($_POST['content']),
            'topic' => $_POST['topic'],
        ];
        print_r($data);
        $this->DB->insert('INSERT INTO feedback (Review, ID_client, ID_topics) VALUES (:review, :id, :topic)', $data);
    }
}