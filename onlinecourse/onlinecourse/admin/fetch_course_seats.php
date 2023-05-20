<?php
include('includes/config.php');
// fetch_course_seats.php

// ... Your PHP code to establish a database connection ...

// Check if the stream name is provided in the AJAX request
if(isset($_POST['stream_name'])) {
    $streamName = $_POST['stream_name'];
    
    // Prepare and execute the SQL query to fetch the column names and seat values
    $query = "SELECT COLUMN_NAME, noofSeats
              FROM total_no_of_seats
              WHERE stream_name = '$streamName'";
    $result = mysqli_query($con, $query);

    // Prepare the data in the desired format (columnName => seatValue)
    $data = array();
    while ($row = mysqli_fetch_array($result)) {
        $columnName = $row['COLUMN_NAME'];
        $seatValue = $row['noofSeats'];
        $data[$columnName] = $seatValue;
    }

    // Return the data as JSON response
    header('Content-Type: application/json');
    echo json_encode($data);
}
?>

//SELECT courseName , number_of_seats from total_seats_for_course where courseName IN (select `System Security` from total_no_of_seats where stream_id=7 and `System Security`>0 );