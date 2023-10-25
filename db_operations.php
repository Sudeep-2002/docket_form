<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "dockets";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $name = $_POST["name"];
    $startTime = $_POST["startTime"];
    $endTime = $_POST["endTime"];
    $hoursWorked = $_POST["hoursWorked"];
    $ratePerHour = $_POST["ratePerHour"];
    $supplier = $_POST["supplier"];
    $poData = explode(',', $_POST["purchaseOrder"]);
    $poNumber = $poData[0];
    $description = $poData[1];

    $sql = "INSERT INTO dockets (name, start_time, end_time, hours_worked, rate_per_hour, supplier, po_number, description)
            VALUES ('$name', '$startTime', '$endTime', $hoursWorked, $ratePerHour, '$supplier', '$poNumber', '$description')";

    if ($conn->query($sql) === TRUE) {
        echo "Docket created successfully";
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
}

$conn->close();
?>