<?php 

function patients()
{
	require '../includes/connect.php';
			//$typee = $_SESSION['type'];
			$sql = "SELECT * From `medication` WHERE  `status`='pharmacy'";
	$query = mysqli_query($con,$sql);
	while ($row = mysqli_fetch_array($query)) {
		$ido = $row['patient_id'];
		$sql2 = "SELECT * FROM `patient` WHERE `id`='$ido'";
		$query2 = mysqli_query($con,$sql2);
		while ($row2 = mysqli_fetch_array($query2)) {
			echo "<tr height=30px'>";
			echo "<td>P-".$row2['id']."</td>";
			echo "<td>".$row2['fname']."</td>";
			echo "<td>".$row2['sname']."</td>";
			echo "<td>".$row2['sex']."</td>";
			echo "<td><center><a href='medicine.php?id=".$row['id']."'>view</a></center></td>";
			echo "</tr>";
		}
		
	}
}

function addmedicine()
{
	require '../includes/connect.php';
			$price = trim(htmlspecialchars($_POST['price']));
			if (!empty($price)) {
				$id = $_GET['id'];
				@require_once "connect.php";

				$sql = "UPDATE `medication` SET `status`='finish',`medical_price`='$price'  WHERE `id`='$id'";
				$query = mysqli_query($con,$sql);
				if (!empty($query)) {
					echo "<br><b style='color:#008080;font-size:14px;font-family:Arial;'>Finished!</b><br><br>";
				}
			}
}

function addmedicines()
{
	require '../includes/connect.php';
			$name = trim(htmlspecialchars($_POST['name']));
			$price = trim(htmlspecialchars($_POST['price']));
			$expiry = $_POST['expiry'];
			if (!empty($name)&&!empty($price)&&!empty($expiry)) {
				@require_once "connect.php";

				//$sql = "UPDATE `medication` SET `status`='finish',`medical_price`='$price'  WHERE `id`='$id'";
				$sql = "INSERT INTO `new_medicine` VALUES ('','$name','$price','$expiry')";
				$query = mysqli_query($con,$sql);
				if (!empty($query)) {
					echo "<br><b style='color:#008080;font-size:14px;font-family:Arial;'>Medicine Added</b><br><br>";
				}
			}
}

function updatemedicines()
{
	require '../includes/connect.php';
			$name = trim(htmlspecialchars($_POST['name']));
			$price = trim(htmlspecialchars($_POST['price']));
			$expiry = trim(htmlspecialchars($_POST['expiry']));
			if (!empty($name)&&!empty($price)&&!empty($expiry)) {
				@require_once "connect.php";

				$id = $_GET['id'];

				$sql = "UPDATE `new_medicine` SET `medicine_name`='$name',`price`='$price',`expiry_date`='$expiry'  WHERE `id`='$id'";
				//$sql = "INSERT INTO `medicine` VALUES ('','$name','$price')";
				$query = mysqli_query($con,$sql);
				if (!empty($query)) {
					echo "<br><b style='color:#008080;font-size:14px;font-family:Arial;'>Medicine Updated</b><br><br>";
				}
				else{ echo "<p>$sql</p>";}
			}
			else{ echo "<p>expiry</p>";}
}

function searchmedicine()
{
			require 'connect.php';
			$name = $_GET['s'];
				$sql2 = "SELECT * FROM `new_medicine` WHERE `medicine_name` LIKE '%$name%'";
				$query2 = mysqli_query($con,$sql2);
		while ($row2 = mysqli_fetch_array($query2)) {
			echo "<tr height=30px'>";
		echo "<td>".$row2['medicine_name']."</td>";
		echo "<td>".$row2['price']."</td>";
		echo "<td>".$row2['expiry_date']."</td>";
		echo "<td><center><a href='editmedicine.php?id=".$row2['id']."'><img src='../assets/img/glyphicons-151-edit.png' height='16px' width='17px'></a></center></td>";
		echo "<td><center><a href='deletemedicine.php?id=".$row2['id']."'><img src='../assets/img/glyphicons-17-bin.png' height='16px' width='12px'></a></center></td>";
	
		echo "</tr>";
		}
}

function searchpatients()
{
	require '../includes/connect.php';
	$name = $_GET['s'];
	$sql = "SELECT * From `medication` WHERE  `status`='pharmacy'";
	$query = mysqli_query($con,$sql);
	while ($row = mysqli_fetch_array($query)) {
		$ido = $row['patient_id'];
		$sql2 = "SELECT * FROM `patient` WHERE `id`='$ido' AND `id` LIKE '%$name%'";
		$query2 = mysqli_query($con,$sql2);
		while ($row2 = mysqli_fetch_array($query2)) {
			echo "<tr height=30px'>";
			echo "<td>P-".$row2['id']."</td>";
			echo "<td>".$row2['fname']."</td>";
			echo "<td>".$row2['sname']."</td>";
			echo "<td>".$row2['sex']."</td>";
			echo "<td><center><a href='medicine.php?id=".$row['id']."'>view</a></center></td>";
			echo "</tr>";
		}
		
	}
}

function medicine()
{
	@require 'connect.php';
	$sql = "SELECT * FROM `new_medicine`";
	$query = mysqli_query($con,$sql);
	while ($row = mysqli_fetch_array($query)) {
		echo "<tr height=30px'>";
		echo "<td>".$row['medicine_name']."</td>";
		echo "<td>".$row['price']."</td>";
		echo "<td>".$row['expiry_date']."</td>";
		echo "<td><center><a href='editmedicine.php?id=".$row['id']."'><img src='../assets/img/glyphicons-151-edit.png' height='16px' width='17px'></a></center></td>";
		echo "<td><center><a href='deletemedicine.php?id=".$row['id']."'><img src='../assets/img/glyphicons-17-bin.png' height='16px' width='12px'></a></center></td>";
	
		echo "</tr>";
	}
}

function settings()
{
	require '../includes/connect.php';
	//$username = trim(htmlspecialchars($_POST['username']));
	$fname = trim(htmlspecialchars($_POST['fname']));
	$sname = trim(htmlspecialchars($_POST['sname']));
	$password2 = trim(htmlspecialchars($_POST['password2']));
	$password = trim(htmlspecialchars($_POST['password']));
	if ($password != $password) {
		echo "<br><b style='color:red;font-size:14px;font-family:Arial;'>Password Must Match</b>";
	}
	else{
		$pass = sha1($password);
		$name = $_SESSION['pharmacy'];
		$type = $_SESSION['type'];
			
				$sql = "UPDATE `users` SET `fname`='$fname',`sname`='$sname',`password`='$pass' WHERE `username`='$name' AND `type`='$type'";
				$query = mysqli_query($con,$sql);
				if (!empty($query)) {
					echo "<br><b style='color:#008080;font-size:14px;font-family:Arial;'>Succesifully Updated</b>";

				}	
		}
	}
?>