<?php

require_once('classes/MyController.php');

class AuthorController extends MyController
{

    public function __construct($type)
    {
        $id = (int)$_GET['id'];

        switch ($type) {
            case "list" :
                $this->getList();
                break;
            case "view" :
                $this->view($id);
                break;
            case "add" :
                $this->edit();
                break;
            case "edit" :
                $this->edit($id);
                break;
            case "delete" :
                $this->delete($id);
                break;
            default:
                $this->error();
        }
    }

    private function getList()
    {
        $object = new Author();
        $authors = $object->getAuthors();

        $this->params = array('authors'=>$authors);

        $this->template = 'author/authors.tpl';
    }

    private function view($id)
    {
        $author = new Author($id);

        $this->params = array('author'=>$author);

        $this->template = 'author/author.tpl';
    }

    private function edit($id = 0)
    {
        $author = new Author($id);

        if($_POST['save'] == 1) {

            $author->name = $_POST['name'];
            $author->pseudonym = $_POST['pseudonym'];
            $author->date_born = $_POST['date_born'];
            $author->date_death = $_POST['date_death'];

            $author->save();

            $this->view($author->id_author);

        } else {

            $this->params = array('author' => $author);

            $this->template = 'author/author-form.tpl';
        }
    }

    private function delete($id)
    {
        $author = new Author($id);

        $author->delete();

        $this->getList();
    }

}