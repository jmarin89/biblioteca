<?php

require_once('MyObject.php');

class Book extends MyObject
{

    public $id_book;
    public $title;
    public $description;
    public $ISBN;
    public $date_add;
    public $date_upd;
    public $id_category;
    public $id_author;

    public function __construct($id = 0)
    {
        parent::__construct();

        if ($id > 0) {
            $result = $this->getBook($id);

            $this->id_book = $result['id_book'];
            $this->title = $result['title'];
            $this->description = $result['description'];
            $this->ISBN = $result['ISBN'];
            $this->date_add = $result['date_add'];
            $this->date_upd = $result['date_upd'];
            $this->id_category = $result['id_category'];
            $this->id_author = $result['id_author'];
        }

        return $this;
    }

    public function getBooks()
    {
        $sql = " SELECT b.id_book, b.title, b.description, b.ISBN, b.id_category, c.name as cat_name, b.id_author, a.pseudonym as author_pseudonym
                    FROM jm_book b
                    LEFT JOIN jm_category c ON c.id_category = b.id_category
                    LEFT JOIN jm_author a ON a.id_author = b.id_author
                    WHERE 1
                    ORDER BY b.title ASC ";

        $query = $this->dbh->prepare($sql);
        $query->execute();
        $books = $query->fetchAll(PDO::FETCH_OBJ);

        return $books;
    }

    public function getBook($id_book)
    {
        $sql = " SELECT b.id_book, b.title, b.description, b.ISBN, b.id_category, c.name as cat_name, b.id_author, a.pseudonym as author_pseudonym
                    FROM jm_book b
                    LEFT JOIN jm_category c ON c.id_category = b.id_category
                    LEFT JOIN jm_author a ON a.id_author = b.id_author
                    WHERE 1
                    AND b.id_book = ". (int)$id_book;

        $query = $this->dbh->prepare($sql);
        $query->execute();
        $book = $query->fetch();

        return $book;
    }

    public function save()
    {
        if ($this->id_book) {
            $this->edit();
        } else {
            $this->add();
        }
    }

    public function add()
    {
        $sql = 'INSERT INTO jm_book (`title`,`description`,`ISBN`,`date_add`,`date_upd`,`id_category`,`id_author`) 
                    VALUES ("'.$this->title.'","'.$this->description.'","'.$this->ISBN.'","'.date("Y/m/d").'","'.date("Y/m/d").'","'.$this->id_category.'","'.$this->id_author.'")';

        $query = $this->dbh->prepare($sql);
        $query->execute();

        $stmt = $this->dbh->query("SELECT LAST_INSERT_ID()");
        $id = $stmt->fetchColumn();

        $this->id_book = $id;
    }

    public function edit()
    {
        $sql = 'UPDATE jm_book SET 
                    `title` = "'.$this->title.'",
                    `description` = "'.$this->description.'",
                    `ISBN` = "'.$this->ISBN.'",
                    `date_upd` = "'.date("Y/m/d").'",
                    `id_category` = "'.$this->id_category.'",
                    `id_author` = "'.$this->id_author.'"
                    WHERE `id_book` = '. (int)$this->id_book;

        $query = $this->dbh->prepare($sql);
        return $query->execute();
    }

    public function delete()
    {
        // Borramos la imágen si existiese
        $target_dir = dirname(__DIR__)."/img/";
        $target_file = $target_dir . "b_".$this->id_book.".jpg";

        if (file_exists($target_file)) {
            unlink($target_file);
        }

        $sql = " DELETE FROM jm_book
                    WHERE id_book = ". (int)$this->id_book;

        $query = $this->dbh->prepare($sql);
        return $query->execute();
    }

    public function getCategoryName()
    {
        $category = new Category($this->id_category);

        $category_name = $category->name;

        return $category_name;
    }

    public function getPseudonymAuthor()
    {
        $author = new Author($this->id_author);

        $author_pseudonym = $author->pseudonym;

        return $author_pseudonym;
    }

}