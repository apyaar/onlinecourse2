<?php
session_start();
include('includes/config.php');
error_reporting(0);
if(strlen($_SESSION['alogin'])==0)
    {   
header('location:index.php');
}
else{

if(isset($_POST['submit']))
{
    // var_dump($_POST);
    $stream_name=$_POST['stream_name'];
    $selected_courses = $_POST['courses'];
    if (isset($_POST['courses'])) {
        $selected_courses = $_POST['courses'];
    } else {
        $selected_courses = array();
    }
    $sql = mysqli_query($con, "select  * from stream where stream_name='".$stream_name."'");
    $row=mysqli_fetch_array($sql);
    // Insert selected courses into database
    foreach ($selected_courses as $course_name) {
        $sql = "INSERT INTO eligible_optional_core (stream_id,stream_name,courseName)  VALUES ('".$row['stream_id']."','".$stream_name."', '".$course_name."')";
        mysqli_query($con, $sql);
    }
    // to remove duplicate values 
    $sql = "    DELETE FROM eligible_optional_core 
    WHERE id NOT IN (
        SELECT MIN(id)
        FROM eligible_optional_core
        GROUP BY stream_name, courseName
    )";
        mysqli_query($con, $sql);

        echo '<script>alert("Selected courses have been saved.")</script>';

}
?>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Student Profile</title>
    <link href="../assets/css/bootstrap.css" rel="stylesheet" />
    <link href="../assets/css/font-awesome.css" rel="stylesheet" />
    <link href="../assets/css/style.css" rel="stylesheet" />
</head>

<body>
<?php include('includes/header.php');?>
    <!-- LOGO HEADER END-->
<?php if($_SESSION['alogin']!="")
{
 include('includes/menubar.php');
}
 ?>
    <!-- MENU SECTION END-->
    <div class="content-wrapper">
        <div class="container">
              <div class="row">
                    <div class="col-md-12">
                        <h1 class="page-head-line">Student Registration  </h1>
                    </div>
                </div>
                <div class="row" >
                  <div class="col-md-3"></div>
                    <div class="col-md-6">
                        <div class="panel panel-default">
                        <div class="panel-heading">
                          Student Registration
                        </div>
<font color="green" align="center"><?php echo htmlentities($_SESSION['msg']);?><?php echo htmlentities($_SESSION['msg']="");?></font>





                        <div class="panel-body">
                       <form method="post" >
   
                       <div class="form-group">
    <label for="stream_name">Select Stream</label>
    <select class="form-control" name="stream_name" required="required">
   <option value="">Select Stream</option>   
   <?php 
$sql=mysqli_query($con,"select * from stream");
while($row=mysqli_fetch_array($sql))
{
?>
<option value="<?php echo htmlentities($row['stream_name']);?>"><?php echo htmlentities($row['stream_name']);?></option>
<?php } ?>
    </select> 
   </div> 

<div class="form-group">
    <label for="courses">Select Courses</label>
  <?php 
$sql = mysqli_query($con, "SELECT * FROM course");
while ($row = mysqli_fetch_array($sql)) {
    ?>
    <div class="form-group">
        <input type="checkbox" id="course_<?php echo htmlentities($row['courseName']);?>" name="courses[]" value="<?php echo htmlentities($row['courseName']);?>" />
        <label for="course_<?php echo htmlentities($row['courseName']);?>"><?php echo htmlentities($row['courseName']);?></label>
    </div>
    <?php
}
?>
 </div> 









 <button type="submit" name="submit" id="submit" class="btn btn-default">Update</button>
</form>
                            </div>
                            </div>
                    </div>
                  
                </div>

            </div>





        </div>
    </div>
  <?php include('includes/footer.php');?>
    <script src="../assets/js/jquery-1.11.1.js"></script>
    <script src="../assets/js/bootstrap.js"></script>


</body>
</html>
<?php } ?>
