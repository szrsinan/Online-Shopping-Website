<?php
	require_once("classes/Db.php");
	require_once("inc/function.php");
	ini_set('display_errors', 0);
	error_reporting(E_ERROR | E_WARNING | E_PARSE);

	$db = new Db();
	$mysqli = Db::$_mysqli;
?>