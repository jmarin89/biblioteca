<?php

class MyController
{

    public $template;
    public $params;

    protected function error()
    {
        $this->params = array();
        $this->template = 'error.tpl';
    }

}