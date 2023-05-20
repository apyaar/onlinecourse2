<?php
// fetch_courses.php
include('includes/config.php');
// Perform necessary database connection and configuration

if (isset($_POST['stream_idx']) && !empty($_POST['stream_idx'])) {
    $selectedStreamId = $_POST['stream_idx'];

  // Use $selectedStreamId in your database query to fetch the updated course data
  $sql = mysqli_query($con, "SELECT * FROM course ");
 // Use prepared statements to prevent SQL injection
 $stmt = mysqli_prepare($con, "SELECT * FROM total_no_of_seats WHERE stream_id = ?");
 mysqli_stmt_bind_param($stmt, "s", $selectedStreamId);
 mysqli_stmt_execute($stmt);
 $result = mysqli_stmt_get_result($stmt);
 $row1 = mysqli_fetch_array($result);




  // Generate the HTML for the updated table rows
  ob_start();
  $cnt = 1;
  while ($row = mysqli_fetch_array($sql)) {
    $temprow=$row['courseName'];

    $sqlConstraint = mysqli_query($con, "SELECT ca.course_name, COUNT(*) AS seat_count, s.stream_id
    FROM courses_allocated ca
    JOIN students s ON ca.student_reg_no = s.studentRegno
    WHERE ca.course_type = 'Elective' AND s.stream_id = '$selectedStreamId' AND ca.course_name = '$temprow'
    GROUP BY ca.course_name");

if ($sqlConstraint) {
$rowConstraint = mysqli_fetch_array($sqlConstraint);
$seatCount = $rowConstraint['seat_count'] ?? 0;
} else {
$seatCount = 0; // Set a default value if the query fails
}

$sqlUpdatedConstraints= mysqli_query($con, "SELECT Totalnoofseats from course where courseName='$temprow'");
$rowUpdatedConstraints=mysqli_fetch_array($sqlUpdatedConstraints);
$seatCountUpdatedConstraint=$rowUpdatedConstraints['Totalnoofseats']-$seatCount;
 ?>
    <tr>
      <td><?php echo $cnt;?></td>
      <td><?php echo htmlentities($temprow);?></td>
      <td><?php 
     echo htmlentities($seatCount);?></td>
      <td><?php echo htmlentities($row1[$temprow]);?></td>
      <form method="post" action="submit.php">
    <td><input type="number" class="form-control" id="updatedConstraint1" name="updatedConstraint1" value="<?php echo htmlentities($seatCountUpdatedConstraint);?>" min="0" max="<?php echo htmlentities($seatCountUpdatedConstraint);?>" required /></td>
    <td><button type="submit" >Submit</button></td>
</form>

      <!-- <td> <input type="number" class="form-control" id="updatedConstraint" name="updatedConstraint" value="<?php echo htmlentities($seatCountUpdatedConstraint);?>" min="0" max="<?php echo htmlentities($seatCountUpdatedConstraint);?>" required /></td> -->
    </tr>
    <?php
    $cnt++;
  }
  $tableRows = ob_get_clean();

  // Return the HTML content as the response
  echo $tableRows;
}
?>
