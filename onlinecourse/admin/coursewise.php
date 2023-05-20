<?php
session_start();
include('includes/config.php');
error_reporting(0);
if(strlen($_SESSION['alogin'])==0)
    {   
header('location:index.php');
}
else{

    if(isset($_POST['submit'])) {
        $course_name = $_POST['course_name'];
    
        // Fetch student registration numbers and names from database
        $sql1 = mysqli_query($con, "SELECT student_reg_no FROM courses_allocated WHERE course_name='$course_name'");
    
        $students = array();
    
        while ($row = mysqli_fetch_array($sql1)) {
            $sql2 = mysqli_query($con, "SELECT studentName FROM students WHERE studentRegno='".$row['student_reg_no']."'");
            $row2 = mysqli_fetch_array($sql2);
    
            $students[] = array('reg_no' => $row['student_reg_no'], 'name' => $row2['studentName']);
        }
    
        // Generate CSV file
        header('Content-Type: text/csv; charset=utf-8');
        header('Content-Disposition: attachment; filename='.$course_name.'.csv');
    
        $output = fopen('php://output', 'w');
        fputcsv($output, array('Student Reg No', 'Name'));
    
        foreach ($students as $student) {
            fputcsv($output, $student);
        }
    
        fclose($output);
        exit();
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
    <label for="course_name">Select Course</label>
    <select class="form-control" name="course_name" required="required" onchange="getCourseCode()">
        <option value="">Select Course Name</option>
        <?php 
            $sql=mysqli_query($con,"select * from course");
            while($row=mysqli_fetch_array($sql)) {
        ?>
        <option value="<?php echo htmlentities($row['courseName']);?>"><?php echo htmlentities($row['courseName']);?></option>
        <?php } ?>
    </select> 
</div> 

<div class="form-group">
    <label for="course_code">Course Code</label>

    <input type="text" class="form-control" id="course_code" name="course_code" value="<?php echo str_replace('&ndash;', '-', htmlentities($row['course_code']));?>" placeholder="Course Code" readonly />

</div>

<script>
function getCourseCode() {
    var courseName = document.getElementsByName("course_name")[0].value;
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            document.getElementById("course_code").value = this.responseText;
        }
    };
    xhttp.open("GET", "getcoursecode.php?courseName=" + courseName, true);
    xhttp.send();
}
</script>



 <button type="submit" name="submit" id="submit" class="btn btn-default">Generate Reports</button>
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
