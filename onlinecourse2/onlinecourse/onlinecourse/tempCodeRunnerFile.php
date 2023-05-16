<?php
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

<form method='post'>
 <div>
 <button type="submit" name="submit1" id="submit1" class="btn btn-default">Proceed for Elective Preference</button>
</div>
</form>