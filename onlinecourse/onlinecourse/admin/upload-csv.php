<?php
session_start();
include('includes/config.php');
if(strlen($_SESSION['alogin'])==0)
    {   
header('location:index.php');
}
else{

if(isset($_POST['submit']))
{

echo 'clicked';
    $fileName = $_FILES['csvFile']['name'];
	$fileTmpName = $_FILES['csvFile']['tmp_name'];
	$fileType = $_FILES['csvFile']['type'];
	$fileSize = $_FILES['csvFile']['size'];
	$fileError = $_FILES['csvFile']['error'];

	if ($fileError === 0) {
		$file = fopen($fileTmpName, "r");
		$data = fgetcsv($file);
		while (($data = fgetcsv($file)) !== FALSE) {
            $ret=mysqli_query($con,"insert into students (studentRegno,stream_id,password,studentName,semester,cgpa,password_status) values('$data[0]','$data[1]','$data[2]','$data[3]','$data[4]','$data[5]','$data[6]')");
            // foreach ($data as $value) {
            //     echo $value;
            //   }
           
		}
		fclose($file);
		echo "File imported successfully!";
	}
    
    else {
		echo "Error importing file.";
	}



// $studentname=$_POST['studentname'];
// $studentRegno=$_POST['studentRegno'];
// $password=$_POST['password'];
// $pincode = rand(100000,999999);

// $ret=mysqli_query($con,"insert into students(studentName,studentRegno,password,pincode,stream_id) values('$studentname','$studentRegno','$password','$pincode',1)");
// if($ret)
// {
// // echo '<script>alert("Student Registered Successfully. Pincode is "+"'.$pincode.'")</script>';
// echo '<script>alert("Student Registered Successfully.")</script>';
// echo '<script>window.location.href=manage-students.php</script>';
// }else{
// echo '<script>alert("Something went wrong. Please try again.")</script>';
// echo '<script>window.location.href=manage-students.php</script>';
// }
}
?>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Admin | Student Registration</title>
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
                       <form name="dept" method="post" enctype="multipart/form-data">
   

        <label for="csvFile">Choose CSV file:</label>
		<input type="file" name="csvFile" id="csvFile"><br><br>



 <button type="submit" name="submit" id="submit" class="btn btn-default">Submit</button>
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
<script>
function userAvailability() {
$("#loaderIcon").show();
jQuery.ajax({
url: "check_availability.php",
data:'regno='+$("#studentRegno").val(),
type: "POST",
success:function(data){
$("#user-availability-status1").html(data);
$("#loaderIcon").hide();
},
error:function (){}
});
}
</script>


</body>
</html>
<?php } ?>
