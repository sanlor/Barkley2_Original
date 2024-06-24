<?php

//ALL B-BALL TACTICS RELATED SCRIPTS SHOULD HAVE THIS LINE AT THE TOP
include($_SERVER['DOCUMENT_ROOT'].'/private/bbt/bbtconfig.php');

//error_reporting(E_ERROR); 

$mysqli = new mysqli($mysql_server,$mysql_username,$mysql_password,$mysql_database);
if($mysqli->connect_errno)
{
	echo "Failed to connect to MySQL";
}

$game_init = $_GET['init'];

if($game_init == "1")
{	/* Non-prepared statement */
	if (!$mysqli->query("DROP TABLE IF EXISTS MPlay") || 
		!$mysqli->query("CREATE TABLE MPlay(ID_GAME INT, moveHistory TEXT, whoseTurn INT, PRIMARY KEY (ID_GAME), FOREIGN KEY (whoseTurn) REFERENCES MPlay_Users(id))")) 
	{
		echo "Table creation failed: (" . $mysqli->errno . ") " . $mysqli->error;
	}

	echo "init";
}

?>



