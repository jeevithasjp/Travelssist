<!DOCTYPE html>
<html>
<head>
    <title>Blog Submission Form</title>
    <!-- Include any necessary CSS or JS files -->
    <style>
        /* styles.css */

        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
        }

        h1 {
            text-align: center;
            margin-top: 20px;
        }

        form {
            max-width: 500px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
        }

        form label {
            display: block;
            font-weight: bold;
            margin-top: 10px;
        }

        form input[type="text"],
        form textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        form textarea {
            height: 150px;
        }

        form button {
            width: 100%;
            padding: 10px;
            background-color: #4CAF50;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        form button:hover {
            background-color: #45a049;
        }

    </style>
</head>
<body>
<h1>Submit your Blog</h1>
<form action="submit_blog.php" method="POST" enctype="multipart/form-data">
    <label for="title">Title</label>
    <input type="text" id="title" name="title" required>

    <label for="content">Content</label>
    <textarea id="content" name="content" required></textarea>

    <label for="video_file">Video</label>
    <input type="file" id="video_file" name="video_file" accept="video/*" required>

    <button type="submit">Submit</button>
</form>
</body>
</html>
