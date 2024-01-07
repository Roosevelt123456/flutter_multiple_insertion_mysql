
<?php 
include("./dbconnection.php");
$con=dbconnection();

if (isset($_POST['pname'])) {
	$pname=$_POST['pname'];
	// code...
}
else return;
if (isset($_POST['pemail'])) {
	$pemail=$_POST['pemail'];
	// code...
}
else return;
if (isset($_POST['pphone1'])) {
	$pphone1=$_POST['pphone1'];
	// code...
}
else return;
if (isset($_POST['pphone2'])) {
	$pphone2=$_POST['pphone2'];
	// code...
}
else return;

if (isset($_POST['paddress1'])) {
	$paddress1=$_POST['paddress1'];
	// code...
}
else return;
if (isset($_POST['paddress2'])) {
	$paddress2=$_POST['paddress2'];
	// code...
}
else return;


$query="SELECT MAX(user_id) as ui FROM user_address";
$exe=mysqli_query($con, $query);

$row=mysqli_fetch_array($exe);
$user_id=$row["ui"];
$user_id=$user_id+1;
echo $user_id;


$sql1="INSERT INTO `user_address`( `add1`, `add2`, `user_id`) VALUES ('$paddress1','$paddress2','$user_id')";

$el=mysqli_query($con,$sql1);

$sql2="INSERT INTO `user_phone`(`phone1`, `phone2`, `user_id`) VALUES ('$pphone1','$pphpne','$user_id')";
$el1=mysqli_query($con,$sql2);



$sql3="INSERT INTO `user_table`(`name`,`password`,`email`, `user_id`) VALUES ('$pname','$ppassword','$pemail','$user_id')";

$el3=mysqli_query($con,$sql3 );

$arr=[];
if ($exe) 
	{
		$arr["success"]="true";
	}
	else{
		$arr["success"]="false";
	}

print(json_encode($arr));


?>