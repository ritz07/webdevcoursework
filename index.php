<?php
    session_start();
    
    include "./db_operations.php";
    include "./config/db_connection.php";

    //When the logout button is pressed it will check for it in this php file and delete the session
    if(isset($_GET['logout'])){
        unset($_SESSION['User']);
        unset($_SESSION['bg-image']);
        header('Location: index.php');
    }

    // //
    if(isset($_GET['profile'])){
        header('Location: ./profile/index.php');
    }

    global $error;
    if(isset($_SESSION['errmessage'])){
        $error = $_SESSION['errmessage'];
        unset($_SESSION['errmessage']);
    }

    //User session stores the email of the user
    if(isset($_SESSION['User'])){
        if(checkIfPremiumUser($conn, $_SESSION['User']) && !isset($_SESSION['bg-image'])){
            setBackgroundURL($conn, $_SESSION['User']);
        }
        $username = getUsernameFromUsersTable($conn, $_SESSION['User']);
    }

?>

<?php include './templates/header.php'; ?>

    <?php if(isset($_SESSION['User'])){ ?>
        <h1 class="error"><?php echo $error ?></h1>
        <div class="container">
            <h1> Welcome <span class="User"><?php echo $username ?></span> to the Books list </h1>
            <h1> A place to store reviews for books and manage the books you are reading!</h1>
        </div>
    <?php }else{ ?>
        <h1> Welcome to the Books list </h1>
        <h1> A place to store reviews for books and manage the books you are reading!</h1>
        <h1> In order to start using the site please register or login above! </h1>
    <?php } ?>

<?php include './templates/footer.php'; ?>
