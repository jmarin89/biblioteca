<?php

require_once('classes/MyController.php');

class BookController extends MyController
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
        $object = new Book();
        $books = $object->getBooks();

        $this->params = array('books'=>$books);

        $this->template = 'book/books.tpl';
    }

    private function view($id)
    {
        $book = new Book($id);

        $this->params = array('book'=>$book);

        $this->template = 'book/book.tpl';
    }

    private function edit($id = 0)
    {
        $book = new Book($id);

        if($_POST['save'] == 1) {

            $book->title = $_POST['title'];
            $book->description = $_POST['description'];
            $book->ISBN = $_POST['ISBN'];
            $book->id_category = $_POST['id_category'];
            $book->id_author = $_POST['id_author'];

            $book->save();

            $this->uploadImage($book);
            $this->view($book->id_book);

        } else {

            $object = new Category();
            $categories = $object->getCategories();

            $object = new Author();
            $authors = $object->getAuthors();

            $this->params = array('book' => $book, 'categories'=>$categories, 'authors'=>$authors);

            $this->template = 'book/book-form.tpl';
        }
    }

    private function delete($id)
    {
        $book = new Book($id);

        $book->delete();

        $this->getList();
    }

    private function uploadImage($book) {
        $target_dir = dirname(__DIR__)."/img/";
        $target_file = $target_dir . "b_".$book->id_book.".jpg";

        // Si no se envía imagen nos salimos dando un ok
        $check = isset($_FILES["fileToUpload"]["tmp_name"]) && $_FILES["fileToUpload"]["tmp_name"] != '' && getimagesize($_FILES["fileToUpload"]["tmp_name"]);
        if ($check === false) {
            return true;
        }

        // Borramos la imagen si ya existiese
        if (file_exists($target_file)) {
            unlink($target_file);
        }
        if (move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $target_file)) {
            return true;
        } else {
            return false;
        }
    }

}