<?php
include('includes/config.php');
$courseName = $_GET['courseName'];
$sql = "SELECT course_code FROM course WHERE courseName = '".mysqli_real_escape_string($con, $courseName)."'";
$result = mysqli_query($con, $sql);
$row = mysqli_fetch_array($result);
echo $row['course_code'];
?>
