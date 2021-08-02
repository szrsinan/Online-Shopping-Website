<?php
require_once("inc/header.php");

$category_ = $db->FetchAll("`id`,`name`", "category", null, "`id` ASC");


?>
<nav class="navbar navbar-default">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand text-bold" href="index.php" style="font-size: 2em; padding-top: 20px">SIN' <span style="color:#ffb4b1;">ER </span>/SHOPPING</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav" style="font-size: 1.2em; padding-top: 7px">
                <?php foreach ($category_ as $cat): ?>
                    <li><a href="category.php?id=<?php echo $cat['id']; ?>"><?= $cat['name'] ?></a> </li>
                <?php endforeach; ?>
            </ul>
            <ul class="nav navbar-nav pull-right">
                <?php

                session_start();

                if (isset($_SESSION['id'])) {

                    $user_id = escape($_SESSION['id']);
                    $user = $db->Fetch("*", "user", "id='$user_id'");

                    $cart_count = $db->GetNum("cart", "user_id='$user_id' AND active='y'");
                    ?>
                    <li title="Home"><a href='cart.php'><i class="fa fa-shopping-cart icon-small"> <span class="badge"
                                                                                                         id="cart-count"><?php echo $cart_count; ?></span></i></a></li>
                    <li title="Products"><a href='products.php'><i class="fa fa-black-tie icon-small"></i></a></li>
                    <li><a href="user.php"><i class="fa fa-user icon-small"></i> <span class="text-20"></span></a></li>
                    <li title="logout"><a href="logout.php"><i class="fa fa-sign-out icon-small"></i></a></li>
                    <?php
                } else {
                    ?>
                    <li title="Home"><a href='index.php'><i class="fa fa-home icon-small"></i></a></li>
                    <li title="Products"><a href='products.php'><i class="fa fa-black-tie icon-small"></i></a></li>
                    <li title="Login / Register"><a href='login.php'><i class="fa fa-sign-in icon-small"></i></a></li>
                    <?php
                }
                ?>
            </ul>

        </div>
    </div>
</nav>
<div style="height:10px;"></div>
