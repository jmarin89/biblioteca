<?php

require_once('classes/MyController.php');

class CategoryController extends MyController
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
        $object = new Category();
        $categories = $object->getCategories();

        $this->params = array('categories'=>$categories);

        $this->template = 'category/categories.tpl';
    }

    private function view($id)
    {
        $category = new Category($id);

        $this->params = array('category'=>$category);

        $this->template = 'category/category.tpl';
    }

    private function edit($id = 0)
    {
        $category = new Category($id);

        if($_POST['save'] == 1) {

            $category->name = $_POST['name'];
            $category->description = $_POST['description'];

            $category->save();

            $this->view($category->id_category);

        } else {

            $this->params = array('category' => $category);

            $this->template = 'category/category-form.tpl';
        }
    }

    private function delete($id)
    {
        $category = new Category($id);

        $category->delete();

        $this->getList();
    }

}