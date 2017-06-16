<?php

namespace Administrativo\Controller;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;

class CursoController extends AbstractActionController
{

    public function indexAction()
    {
        return new ViewModel();
    }


}

