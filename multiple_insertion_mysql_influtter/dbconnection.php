
<?php 

function dbconnection(){

	$con=mysqli_connect("localhost","root","","multiple_insertion_flutter");
	return $con;
}

?>