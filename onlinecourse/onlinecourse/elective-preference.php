<?php
session_start();
include('includes/config.php');
error_reporting(0);
if(strlen($_SESSION['login'])==0)
    {   
header('location:index.php');
}
else{
if(isset($_POST['submit']))
{


    if(isset($_POST['electives'])){
        $selected_val=$_POST['electives'];
        // echo var_dump($selected_val[0]);
    }else{
        $selected_val = array();
    }

    $regno = $_POST['studentRegno'];

// check if registration number already exists in table
$sql = "SELECT * FROM elective_preference WHERE studentRegno = '$regno'";
$result = mysqli_query($con, $sql);

if (mysqli_num_rows($result) == 0) {
    // registration number does not exist, insert new record
    $sql_insert = "INSERT INTO elective_preference (studentRegno, E1, E2, E3, E4, E5, E6, E7, E8, E9, E10, E11, E12, E13, E14, E15, E16, E17, E18, E19) 
    VALUES ('$regno', '".($selected_val[0] ? $selected_val[0] : "NULL")."', '".($selected_val[1] ? $selected_val[1] : "NULL")."', '".($selected_val[2] ? $selected_val[2] : "NULL")."', '".($selected_val[3] ? $selected_val[3] : "NULL")."', '".($selected_val[4] ? $selected_val[4] : "NULL")."', '".($selected_val[5] ? $selected_val[5] : "NULL")."',
            '".($selected_val[6] ? $selected_val[6] : "NULL")."', '".($selected_val[7] ? $selected_val[7] : "NULL")."', '".($selected_val[8] ? $selected_val[8] : "NULL")."', '".($selected_val[9] ? $selected_val[9] : "NULL")."', '".($selected_val[10] ? $selected_val[10] : "NULL")."', '".($selected_val[11] ? $selected_val[11] : "NULL")."', '".($selected_val[12] ? $selected_val[12] : "NULL")."',
            '".($selected_val[13] ? $selected_val[13] : "NULL")."', '".($selected_val[14] ? $selected_val[14] : "NULL")."', '".($selected_val[15] ? $selected_val[15] : "NULL")."', '".($selected_val[16] ? $selected_val[16] : "NULL")."', '".($selected_val[17] ? $selected_val[17] : "NULL")."', '".($selected_val[18] ? $selected_val[18] : "NULL")."')";
    mysqli_query($con, $sql_insert);
    
    echo '<script>alert("Elective Preference Uploaded Successfully");</script>';
} else {
    // registration number already exists, do nothing or update existing record
    
    echo '<script>alert("Data Already Exists");</script>';
}


}
?>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Elective Preference</title>
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
                        <h1 class="page-head-line">Select elective preferences </h1>
                    </div>
                </div>
                <div class="row" >
                  <div class="col-md-3"></div>
                    <div class="col-md-6">
                        <div class="panel panel-default">
                        <div class="panel-heading">
                          Select Optional Core Subjects
                        </div>
<font color="green" align="center"><?php echo htmlentities($_SESSION['msg']);?><?php echo htmlentities($_SESSION['msg']="");?></font>
<?php $sql=mysqli_query($con,"SELECT * FROM students JOIN stream ON stream.stream_id = students.stream_id where studentRegno='".$_SESSION['login']."'");
$cnt=1;
while($row=mysqli_fetch_array($sql))
{ ?>

                        <div class="panel-body">
                       <form name="dept" method="post" enctype="multipart/form-data">
   <div class="form-group">
    <label for="studentname">Student Name  </label>
    <input type="text" class="form-control" id="studentname" name="studentname" value="<?php echo htmlentities($row['studentName']);?>" readonly />
  </div>

 <div class="form-group">
    <label for="studentRegno">Student Reg No   </label>
    <input type="text" class="form-control" id="studentRegno" name="studentRegno" value="<?php echo htmlentities($row['studentRegno']);?>"  placeholder="Student Reg no" readonly />
    
  </div>

  <div class="form-group">
    <label for="Course">Electives</label>
    <?php 
        $sql2 = mysqli_query($con, "SELECT courseName FROM course WHERE courseName NOT IN (SELECT optional_core_choice_1 FROM students WHERE studentRegno = '".$_SESSION['login']."' UNION SELECT optional_core_choice_2 FROM students WHERE studentRegno = '".$_SESSION['login']."' UNION SELECT optional_core_choice_3 FROM students WHERE studentRegno = '".$_SESSION['login']."')");
        $row2 = mysqli_fetch_all($sql2, MYSQLI_ASSOC);
        $count = count($row2);
        $i = 0;
    ?>
    <?php while($count--) { ?>
    <?php $id = 'electives_'.$i; ?>
    <br>
    <label for="Course">Elective preference <?php echo ++$i; ?></label>
    <select class="form-control" name="electives[]" id="<?php echo $id; ?>" required="required">
        <option value="">Select Elective Subject</option>
        <?php foreach($row2 as $rows2){ ?>
            <option value="<?php echo htmlentities($rows2['courseName']);?>"><?php echo htmlentities($rows2['courseName']);?></option>
        <?php } ?>
    </select> 
    <br>
    <?php } ?> 
    <span id="course-availability-status1" style="font-size:12px;"></span>
    <button type="reset" class="btn btn-danger">Reset</button>
</div>

<script>
    // Get all dropdowns with name "electives[]"
    const dropdowns = document.querySelectorAll('select[name="electives[]"]');
    
    // Loop through each dropdown
    dropdowns.forEach((dropdown, index) => {
        // Add event listener to each dropdown
        dropdown.addEventListener('change', () => {
            // Get the selected option value
            const selectedValue = dropdown.value;
            
            // Loop through all subsequent dropdowns
            for(let i = index + 1; i < dropdowns.length; i++) {
                // Disable the selected option in each subsequent dropdown
                const options = dropdowns[i].options;
                for(let j = 0; j < options.length; j++) {
                    if(options[j].value === selectedValue) {
                        options[j].disabled = true;
                    }
                }
            }
        });
    });
</script>

  <?php } ?>

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
    <script src="assets/js/jquery-1.11.1.js"></script>
    <script src="assets/js/bootstrap.js"></script>


</body>
</html>
<?php } ?>
