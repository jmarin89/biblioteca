<?php

require_once('MyObject.php');

class Category extends MyObject
{

    public $id_category;
    public $name;
    public $description;
    public $date_add;
    public $date_upd;

    public function __construct($id = 0)
    {
        parent::__construct();

        if ($id > 0) {
            $result = $this->getCategory($id);

            $this->id_category = $result['id_category'];
            $this->name = $result['name'];
            $this->description = $result['description'];
            $this->date_add = $result['date_add'];
            $this->date_upd = $result['date_upd'];
        }

        return $this;
    }

    public function getCategories()
    {
        $sql = " SELECT c.id_category, c.name, c.description
                    FROM jm_category c
                    WHERE 1
                    ORDER BY c.name ASC ";

        $query = $this->dbh->prepare($sql);
        $query->execute();
        $categories = $query->fetchAll(PDO::FETCH_OBJ);

        return $categories;
    }

    public function getCategory($id_category)
    {
        $sql = " SELECT c.id_category, c.name, c.description
                    FROM jm_category c
                    WHERE 1
                    AND c.id_category = ". (int)$id_category;

        $query = $this->dbh->prepare($sql);
        $query->execute();
        $category = $query->fetch();

        return $category;
    }

    public function save()
    {
        if ($this->id_category) {
            $this->edit();
        } else {
            $this->add();
        }
    }

    public function add()
    {
        $sql = 'INSERT INTO jm_category (`name`,`description`,`date_add`,`date_upd`) 
                    VALUES ("'.$this->name.'","'.$this->description.'","'.date("Y/m/d").'","'.date("Y/m/d").'")';

        $query = $this->dbh->prepare($sql);
        $query->execute();

        $stmt = $this->dbh->query("SELECT LAST_INSERT_ID()");
        $id = $stmt->fetchColumn();

        $this->id_category = $id;
    }

    public function edit()
    {
        $sql = 'UPDATE jm_category SET 
                    `name` = "'.$this->name.'",
                    `description` = "'.$this->description.'",
                    `date_upd` = "'.date("Y/m/d").'"
                    WHERE `id_category` = '. (int)$this->id_category;

        $query = $this->dbh->prepare($sql);
        return $query->execute();
    }

    public function delete()
    {
        $sql = 'UPDATE jm_book SET
                    `id_category` = 0
                    WHERE `id_category` = '. (int)$this->id_category;

        $query = $this->dbh->prepare($sql);
        $query->execute();

        $sql = " DELETE FROM jm_category
                    WHERE id_category = ". (int)$this->id_category;

        $query = $this->dbh->prepare($sql);
        return $query->execute();
    }

    public function getBooksByCategory($id)
    {
        $sql = " SELECT b.id_book, b.title, b.description, b.ISBN, b.id_category, c.name as cat_name, b.id_author, a.pseudonym as author_pseudonym
                    FROM jm_book b
                    LEFT JOIN jm_category c ON c.id_category = b.id_category
                    LEFT JOIN jm_author a ON a.id_author = b.id_author
                    WHERE 1
                    AND c.id_category = ". $id ."
                    ORDER BY b.title ASC ";

        $query = $this->dbh->prepare($sql);
        $query->execute();
        $books = $query->fetchAll(PDO::FETCH_OBJ);

        return $books;
    }

}