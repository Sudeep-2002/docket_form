<?php
$servername = "your_database_host";
$username = "your_username";
$password = "your_password";
$dbname = "your_database_name";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql = "SELECT * FROM dockets";
$result = $conn->query($sql);
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>List of Dockets</title>
</head>

<body>
    <h2>List of Created Dockets</h2>
    <ul>
        <?php
        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                echo "<li>" . $row["name"] . " - " . $row["start_time"] . " to " . $row["end_time"] . " (Supplier: " . $row["supplier"] . ", PO: " . $row["po_number"] . ")</li>";
            }
        } else {
            echo "No dockets found";
        }
        ?>
    </ul>
</body>

</html>

<?php
$conn->close();
?>