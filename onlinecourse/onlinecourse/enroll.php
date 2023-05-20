
<?php
session_start();
include('includes/config.php');
error_reporting(0);
// if(strlen($_SESSION['login'])==0 or strlen($_SESSION['pcode'])==0)
//     {   
// header('location:index.php');
// }
// else{
$sql=mysqli_query($con,"select * from students where studentRegno='".$_SESSION['login']."'");
$row=mysqli_fetch_array($sql);
$sql1=mysqli_query($con,"select * from stream where stream_id='".$row['stream_id']."'");
while($row1=mysqli_fetch_array($sql1)){
  if($row1['optional_core_count']<=0)
  {
    // echo var_dump($row1);
      header('location:elective-preference.php');
    exit();
  }
}

  
if(isset($_POST['submit1'])){
  header('location:elective-preference.php');
} 
if(isset($_POST['submit']))
{
$selected_val=$_POST['optional_cores'];
$sql = mysqli_query($con, "select  * from students where studentRegno='".$_SESSION['login']."'");
$row=mysqli_fetch_array($sql);

$sql1 = mysqli_query($con,"select * from eligible_optional_core where stream_id='".$row['stream_id']."'");
$row1=mysqli_fetch_array($sql1);

// echo var_dump($selected_val[0]);
// foreach ($selected_val as $id) {
  $sql3 = "UPDATE students SET optional_core_choice_1 = '".($selected_val[0] ? $selected_val[0] : "NULL")."', optional_core_choice_2 ='".($selected_val[1] ? $selected_val[1] : "NULL")."', optional_core_choice_3='".($selected_val[2] ? $selected_val[2] : "NULL")."'
  WHERE studentRegno='".$_SESSION['login']."'";
  mysqli_query($con, $sql3);
  echo '<script>alert("Optional Core Uploaded Successfully Proceed for Elective Preference Upload");</script>';
// }
// echo var_dump($selected_val[0]);
}
?>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Course Enroll</title>
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
    <link href="assets/css/style.css" rel="stylesheet" />
</head>

<body>
  
<?php include('includes/header.php');?>
    <!-- LOGO HEADER END-->
<?php if($_SESSION['login']!="")
{
 include('includes/menubar.php');
}
 ?>
    <!-- MENU SECTION END-->
    <div class="content-wrapper">
        <div class="container">
              <div class="row">
                    <div class="col-md-12">
                        <h1 class="page-head-line">Course Enroll </h1>
                    </div>
                </div>
                <div class="row" >
                  <div class="col-md-3"></div>
                    <div class="col-md-6">
                        <div class="panel panel-default">
                        <div class="panel-heading">
                          Course Enroll
                        </div>
<font color="green" align="center"><?php echo htmlentities($_SESSION['msg']);?><?php echo htmlentities($_SESSION['msg']="");?></font>
<?php $sql=mysqli_query($con,"select * from students where studentRegno='".$_SESSION['login']."'");
$cnt=1;
while($row=mysqli_fetch_array($sql))
{ ?>

                        <div class="panel-body">
                       <form name="dept" method="post" enctype="multipart/form-data">
   <div class="form-group">
    <label for="studentname">Student Name  </label>
    <input type="text" class="form-control" id="studentname" name="studentname" value="<?php echo htmlentities($row['studentName']);?>"  />
  </div>

 <div class="form-group">
    <label for="studentRegno">Student Reg No   </label>
    <input type="text" class="form-control" id="studentRegno" name="studentRegno" value="<?php echo htmlentities($row['studentRegno']);?>"  placeholder="Student Reg no" readonly />
    

  </div>


<div class="form-group">
    <label for="Pincode">Student Photo  </label>
   <?php if($row['studentPhoto']==""){ ?>
   <img src="studentphoto/noimage.png" width="200" height="200"><?php } else {?>
   <img src="studentphoto/<?php echo htmlentities($row['studentPhoto']);?>" width="200" height="200">
   <?php } ?>
  </div>

<div class="form-group">
    <label for="Department">Stream  </label>  
   <?php 
$sql1=mysqli_query($con,"select * from stream where stream_id='".$row['stream_id']."'");
$row1=mysqli_fetch_array($sql1);
//  echo var_dump($row1); 
?>
<input type="text" class="form-control" id="streamName" name="streamName" readonly value="<?php echo htmlentities($row1['stream_name']);?>" required />
  </div> 


  <div class="form-group">
    <label for="Course">Course  </label>
    <?php 
    $sql2=mysqli_query($con,"select * from eligible_optional_core where stream_id='".$row['stream_id']."'");
    $row2=mysqli_fetch_all($sql2,MYSQLI_ASSOC);
    $optional_core_count=$row1['optional_core_count'];
    for($i=0;$i<$optional_core_count;$i++) {
        $selected_values = $_POST['optional_cores'][$i] ?? ''; // get the previously selected value
    ?>
    <select class="form-control" name="optional_cores[]" id="optional_cores_<?php echo $i; ?>" required="required">
        <option value="">Select Optional Core</option>
        <?php foreach($row2 as $rows2) {
            $disabled = ''; // initialize the disabled attribute
            if($selected_values == $rows2['id']) {
                $disabled = 'disabled'; // disable the option if it was previously selected
            }
        ?>
        <option value="<?php echo htmlentities($rows2['courseName']);?>" <?php echo $disabled; ?>><?php echo htmlentities($rows2['courseName']);?></option>
        <?php } ?>
    </select> 
    <br>
    <?php } ?>
    <span id="course-availability-status1" style="font-size:12px;"></span>
</div>

<script>
// bind onchange event to each select element
var selectElements = document.querySelectorAll('[name="optional_cores[]"]');
selectElements.forEach(function(element, index) {
    element.addEventListener('change', function() {
        // get the selected value
        var selectedValue = this.value;
        // disable the option with the same value in the subsequent select elements
        for(var i = index+1; i < selectElements.length; i++) {
            selectElements[i].querySelector('option[value="' + selectedValue + '"]').disabled = true;
        }
    });
});
</script>
 <?php } ?>

 <button type="submit" name="submit" id="submit" class="btn btn-default">Submit Optional Cores</button>
</form> 
<br>

<?php 
$sql = mysqli_query($con,"select * from students where studentRegno='".$_SESSION['login']."'");
$row = mysqli_fetch_array($sql);

$isColumnNull = ($row['optional_core_choice_1'] == null); // check if the column is null

?>
<form method='post'>
 <div>
 <button type="submit" name="submit1" id="submit1" class="btn btn-default" <?php if ($isColumnNull) { echo 'disabled'; } ?>>Proceed for Elective Preference</button>
</div>
</form> 



                            </div>
                            </div>
                    </div>
                  
                </div>

            </div>





        </div>
    </div>
  <?php include('includes/footer.php');?>
    <script src="assets/js/jquery-1.11.1.js"></script>
    <script src="assets/js/bootstrap.js"></script>
<script>
function courseAvailability() {
$("#loaderIcon").show();
jQuery.ajax({
url: "check_availability.php",
data:'cid='+$("#course").val(),
type: "POST",
success:function(data){
$("#course-availability-status1").html(data);
$("#loaderIcon").hide();
},
error:function (){}
});
}
</script>


</body>
</html>
<?php  ?>
