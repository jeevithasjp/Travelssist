<?php
// Assuming you have a database connection established

// Check if the form is submitted
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Retrieve the submitted form data
    $package_id = $_POST['package_id'];
    $username = $_POST['username'];
    $name = $_POST['name'];
    $cardNumber = $_POST['card_number'];
    $expiry_date = $_POST['expiry_date']; // Assuming the input is in the format 'MM/YYYY'
    $cvv = $_POST['cvv'];

    // Validate the form data if needed

    // Convert the input expiry_date (MM/YYYY) to the database date format (YYYY-MM-DD)
    $expiry_date_parts = explode('/', $expiry_date);
    if (count($expiry_date_parts) == 2) {
        $year = $expiry_date_parts[1];
        $month = $expiry_date_parts[0];
        // Create the database date string in the format 'YYYY-MM-DD'
        $expiryDateStr = $year . '-' . $month . '-01';
    } else {
        // Handle the case when the input format is not as expected
        // You can show an error message or take appropriate action
        echo json_encode(array('status' => 'error', 'message' => 'Invalid expiry date format'));
        exit; // Stop further execution
    }

    // Create a new database connection
    $conn = new mysqli('localhost', 'root', '', 'tourism_db');
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    // Use prepared statements to prevent SQL injection
    $query = "INSERT INTO payment_details (package_id, username, name, card_number, expiry_date, cvv) VALUES (?, ?, ?, ?, ?, ?)";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("isssss", $package_id, $username, $name, $cardNumber, $expiryDateStr, $cvv);

    // Execute the prepared statement
    if ($stmt->execute()) {
        // Payment details inserted successfully
        $response = array('status' => 'success', 'message' => 'Processing');
    } else {
        // Failed to insert payment details
        $response = array('status' => 'error', 'message' => 'Failed to insert payment details');
    }

    // Close the statement and database connection
    $stmt->close();
    $conn->close();

    // Return the response as JSON
    echo json_encode($response);
}
?>
