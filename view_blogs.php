<?php
require_once 'inc/header.php';
require_once 'inc/topBarNav.php';

// Include the necessary files and classes
require_once 'classes/SystemSettings.php';
require_once 'classes/DBConnectionb.php';
require_once 'classes/BlogManager.php';

// Create an instance of the SystemSettings class
$_settings = new SystemSettings();
$_settings->load_system_info();

// Create an instance of the DBConnection class
$db = new DBConnectionNew();

// Get the database connection
$conn = $db->getConnection();

// Create an instance of the BlogManager class
$blogManager = new BlogManager($conn);

// Get all the blog posts
$posts = $blogManager->getBlogPosts();

?>

<style>
    /* Custom styles for blog posts */
    .blog-post {
        margin: 20px;
        padding: 20px;
        border: 1px solid #ccc;
        border-radius: 5px;
        background-color: bisque;
        color: black;
    }

    .blog-title {
        font-size: 24px;
        font-weight: bold;
        margin-bottom: 10px;
    }

    .blog-content {
        font-size: 16px;
        line-height: 1.5;

    }

    .blog-video {
        margin-top: 10px;
    }

    .blog-video iframe {
        width: 100%;
        height: 400px;
    }
</style>

<div class="container" style="margin-top: 100px;">
    <h2 class="text-center">View Blogs</h2>
    <div class="d-flex w-100 justify-content-center">
        <hr class="border-warning" style="border:3px solid" width="15%">
    </div>
    <div class="w-100">
        <section class="page-section bg-dark" id="home">

            <?php
            // Check if there are any blog posts
            if (!empty($posts)) {
                // Display each blog post
                foreach ($posts as $post) {
                    echo '<div class="blog-post">';
                    echo '<h2 class="blog-title">' . $post['title'] . '</h2>';
                    echo '<div class="blog-content">' . $post['content'] . '</div>';

                    // Check if there is a video URL
                    if (!empty($post['video_url'])) {
                        echo '<div class="blog-video">';
                        echo '<iframe src="' . $post['video_url'] . '" frameborder="0" allowfullscreen></iframe>';
                        echo '</div>';
                    }

                    echo '</div>';
                }
            } else {
                echo '<p>No blog posts available.</p>';
            }
            ?>

        </section>
    </div>
</div>

<?php require_once 'inc/footer.php'; ?>
