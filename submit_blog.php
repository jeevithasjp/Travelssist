<?php
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Retrieve form data
    if (isset($_POST['title'])) {
        $title = $_POST['title'];
    } else {
        die("Error: Missing 'title' field.");
    }

    if (isset($_POST['content'])) {
        $content = $_POST['content'];
    } else {
        die("Error: Missing 'content' field.");
    }

    // Handle file upload for the video
    if (isset($_FILES['video_file']) && $_FILES['video_file']['error'] === UPLOAD_ERR_OK) {
        $target_dir = "videos/";
        $target_file = $target_dir . basename($_FILES["video_file"]["name"]);

        // Check if the file is a valid video format (optional)
        $videoFileType = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));
        $allowedFormats = array("mp4", "avi", "mov"); // Add more allowed formats if needed
        if (!in_array($videoFileType, $allowedFormats)) {
            die("Error: Invalid video format. Allowed formats: " . implode(", ", $allowedFormats));
        }

        if (move_uploaded_file($_FILES["video_file"]["tmp_name"], $target_file)) {
            $video_url = $target_file;
        } else {
            die("Error uploading video file.");
        }
    } else {
        die("Error: Missing video file.");
    }

    // Assuming you have a database connection established
    $conn = new mysqli('localhost', 'root', '', 'tourism_db');
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    // Insert data into the blog_posts table
    $query_posts = "INSERT INTO blog_posts (title, content) VALUES (?, ?)";
    $stmt_posts = $conn->prepare($query_posts);
    $stmt_posts->bind_param("ss", $title, $content);
    if (!$stmt_posts->execute()) {
        die("Failed to submit blog post.");
    }

    // Get the last inserted blog post ID
    $blog_post_id = $stmt_posts->insert_id;

    // Insert data into the blog_videos table
    $query_videos = "INSERT INTO blog_videos (title, content, video_url, blog_post_id) VALUES (?, ?, ?, ?)";
    $stmt_videos = $conn->prepare($query_videos);
    $stmt_videos->bind_param("sssi", $title, $content, $video_url, $blog_post_id);
    if (!$stmt_videos->execute()) {
        die("Failed to submit blog video.");
    }

    // Close the statements and database connection
    $stmt_posts->close();
    $stmt_videos->close();
    $conn->close();

    // Redirect to my_account.php after successful blog submission
    header("Location: index.php");
    exit;
}
?>
