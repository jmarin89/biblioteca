<?php
session_start();
error_reporting(E_ALL & ~E_NOTICE);
ini_set("display_errors", 1);

// DDBB
include('includes/config.php');

// CONTROLLERS
include('controllers/BookController.php');
include('controllers/CategoryController.php');
include('controllers/AuthorController.php');

// CLASSES
include('classes/Book.php');
include('classes/Category.php');
include('classes/Author.php');

// SMARTY LIBS
require_once('libs/Smarty.class.php');

if ($_SESSION['login'] != '') {
    $_SESSION['login'] = '';
}

// CAPTURAMOS EL VALOR "PAGE" DE LA URL
$_page = $_GET['page'];

// DISPATCHER
switch ($_page) {
    case "view_book":
        $controller = new BookController('view');
        break;
    case "list_book":
        $controller = new BookController('list');
        break;
    case "add_book":
        $controller = new BookController('add');
        break;
    case "edit_book":
        $controller = new BookController('edit');
        break;
    case "delete_book":
        $controller = new BookController('delete');
        break;
    case "view_category":
        $controller = new CategoryController('view');
        break;
    case "list_category":
        $controller = new CategoryController('list');
        break;
    case "add_category":
        $controller = new CategoryController('add');
        break;
    case "edit_category":
        $controller = new CategoryController('edit');
        break;
    case "delete_category":
        $controller = new CategoryController('delete');
        break;
    case "view_author":
        $controller = new AuthorController('view');
        break;
    case "list_author":
        $controller = new AuthorController('list');
        break;
    case "add_author":
        $controller = new AuthorController('add');
        break;
    case "edit_author":
        $controller = new AuthorController('edit');
        break;
    case "delete_author":
        $controller = new AuthorController('delete');
        break;
    default:
        $controller = new BookController('list');
}

// INICIALIZAMOS SMARTY
$smarty = new Smarty;
//$smarty->caching = true;
//$smarty->cache_lifetime = 120;
$smarty->assign('params', $controller->params);
$smarty->assign('id', $controller->id);
$smarty->display($controller->template);