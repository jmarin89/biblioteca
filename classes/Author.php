<?php

require_once('MyObject.php');

class Author extends MyObject
{

    public $id_author;
    public $name;
    public $pseudonym;
    public $date_born;
    public $date_death;
    public $date_add;
    public $date_upd;

    public function __construct($id = 0)
    {
        parent::__construct();

        if ($id > 0) {
            $result = $this->getAuthor($id);

            $this->id_author = $result['id_author'];
            $this->name = $result['name'];
            $this->pseudonym = $result['pseudonym'];
            $this->date_born = $result['date_born'];
            $this->date_death = $result['date_death'];
            $this->date_add = $result['date_add'];
            $this->date_upd = $result['date_upd'];
        }

        return $this;
    }

    public function getAuthors()
    {
        $sql = " SELECT a.id_author, a.pseudonym, a.date_born, a.date_death
                    FROM jm_author a
                    ORDER BY a.pseudonym ASC ";

        $query = $this->dbh->prepare($sql);
        $query->execute();
        $authors = $query->fetchAll(PDO::FETCH_OBJ);

        return $authors;
    }

    public function getAuthor($id_author)
    {
        $sql = " SELECT a.id_author, a.name, a.pseudonym, a.date_born, a.date_death
                    FROM jm_author a
                    WHERE a.id_author = ". (int)$id_author;

        $query = $this->dbh->prepare($sql);
        $query->execute();
        $author = $query->fetch();

        return $author;
    }

    public function save()
    {
        if ($this->id_author) {
            $this->edit();
        } else {
            $this->add();
        }
    }

    public function add()
    {
        $sql = 'INSERT INTO jm_author (`name`,`pseudonym`,`date_born`,`date_death`,`date_add`,`date_upd`)
                    VALUES ("'.$this->name.'","'.$this->pseudonym.'","'.$this->date_born.'","'.$this->date_death.'","'.date("Y/m/d").'","'.date("Y/m/d").'")';

        $query = $this->dbh->prepare($sql);
        $query->execute();

        $stmt = $this->dbh->query("SELECT LAST_INSERT_ID()");
        $id = $stmt->fetchColumn();

        $this->id_author = $id;
    }

    public function edit()
    {
        $sql = 'UPDATE jm_author SET
                    `name` = "'.$this->name.'",
                    `pseudonym` = "'.$this->pseudonym.'",
                    `date_born` = "'.$this->date_born.'",
                    `date_death` = "'.$this->date_death.'",
                    `date_upd` = "'.date("Y/m/d").'"
                    WHERE `id_author` = '. (int)$this->id_author;

        $query = $this->dbh->prepare($sql);
        return $query->execute();
    }

    public function delete()
    {
        $sql = 'UPDATE jm_book SET
                    `id_author` = 0
                    WHERE `id_author` = '. (int)$this->id_author;

        $query = $this->dbh->prepare($sql);
        $query->execute();

        $sql = " DELETE FROM jm_author
                    WHERE id_author = ". (int)$this->id_author;

        $query = $this->dbh->prepare($sql);
        return $query->execute();
    }

    public function getBooksByAuthor($id)
    {
        $sql = " SELECT b.id_book, b.title, b.description, b.ISBN, b.id_category, c.name as cat_name, b.id_author, a.pseudonym as author_pseudonym
                    FROM jm_book b
                    LEFT JOIN jm_category c ON c.id_category = b.id_category
                    LEFT JOIN jm_author a ON a.id_author = b.id_author
                    WHERE 1
                    AND a.id_author = ". $id ."
                    ORDER BY b.title ASC ";

        $query = $this->dbh->prepare($sql);
        $query->execute();
        $books = $query->fetchAll(PDO::FETCH_OBJ);

        return $books;
    }

}