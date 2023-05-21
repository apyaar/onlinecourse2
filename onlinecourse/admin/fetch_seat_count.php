<?php
// fetch_seat_count.php

include('includes/config.php');
// Perform necessary database connection and configuration

if (isset($_POST['course']) && isset($_POST['stream_idx'])) {
    $selectedCourse = $_POST['course'];
    $selectedStreamId = $_POST['stream_idx'];

    $escapedCourse = mysqli_real_escape_string($con, $selectedCourse);

    // Use prepared statements to prevent SQL injection
    $stmt = mysqli_prepare($con, "SELECT TotalnoofSeats FROM course WHERE courseName = ?");
    mysqli_stmt_bind_param($stmt, "s", $escapedCourse);
    mysqli_stmt_execute($stmt);
    $result = mysqli_stmt_get_result($stmt);

    $stmt1 = mysqli_prepare($con, "SELECT count(*) AS cc FROM courses_allocated WHERE course_type='Elective' AND course_name = ? GROUP BY course_name");
    mysqli_stmt_bind_param($stmt1, "s", $escapedCourse);
    mysqli_stmt_execute($stmt1);
    $result1 = mysqli_stmt_get_result($stmt1);



    if ($row = mysqli_fetch_array($result) ) {
        $row1=mysqli_fetch_array($result1);
        $seatCount = $row['TotalnoofSeats']-($row1['cc'] ?? 0);
        echo $seatCount;
    
    } else {
        echo "0"; // Default value if seat count is not found
    }
}
?>
