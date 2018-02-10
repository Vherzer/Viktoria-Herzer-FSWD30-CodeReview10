<!--Beginning of PHP-->
<?php

 ob_start();

 session_start();

 require_once 'dbconnect.php'; //Connects database //

  // it will never let you open index(login) page if session is set

 if ( isset($_SESSION['user'])!="" ) {

  header("Location: home.php");

  exit;

 }

 

 $error = false;

 

 if( isset($_POST['btn-login']) ) {

  // prevent sql injections/ clear user invalid inputs

  $email = trim($_POST['email']);

  $email = strip_tags($email);

  $email = htmlspecialchars($email);

 

  $pass = trim($_POST['pass']);

  $pass = strip_tags($pass);

  $pass = htmlspecialchars($pass);

 // prevent sql injections / clear user invalid inputs

 

  if(empty($email)){

   $error = true;

   $emailError = "Please enter your email address.";

  } else if ( !filter_var($email,FILTER_VALIDATE_EMAIL) ) {

   $error = true;

   $emailError = "Please enter valid email address.";

  }

 

  if(empty($pass)){

   $error = true;

   $passError = "Please enter your password.";

  }

 

  // if there's no error, continue to login

  if (!$error) {

   

   $password = hash('sha256', $pass); // password hashing using SHA256

 

   $res=mysqli_query($conn, "SELECT user_id, user_name, password FROM users WHERE email='$email'");

   $row=mysqli_fetch_array($res, MYSQLI_ASSOC);

   $count = mysqli_num_rows($res); // if uname/pass correct it returns must be 1 row

   

   if( $count == 1 && $row['password']==$password ) {

    $_SESSION['user'] = $row['user_id'];

    header("Location: home.php");

   } else {

    $errMSG = "Incorrect Credentials, Try again...";
   }
  }
 }
?>
<!--END OF PHP-->
<!DOCTYPE html>
<html>
<head>
	<title>BIG LIBRARY</title>
	<link rel="stylesheet" type="text/css" href="stylesheet.css">
</head>
<body>
 <form method="post" action="<?php echo htmlspecialchars($_SERVER['PHP_SELF']); ?>" autocomplete="off">

   

     <header class="header">
     	
     

             <h2 >Welcome to the BigLibrary </h2> <img src="imgs/logo.png" alt="logo" height="100px;">
             

             <hr />
	</header><!-- /header -->
	<h4>Join our Library and see our range of Books, CDs and DVDs</h4>
	<h3 >Sign into your account or create a new one!</h3><br />
            <?php

			   if ( isset($errMSG) ) {
					echo $errMSG; ?>

			               

			                <?php

			   }

			   ?>         
	<input type="email" name="email" class="form-control" placeholder="Your Email" value="<?php echo $email; ?>" maxlength="40" />

         

             <span class="text-danger"><?php echo $emailError; ?></span>

   

           


             <input type="password" name="pass" class="form-control" placeholder="Your Password" maxlength="15" />

         

            <span class="text-danger"><?php echo $passError; ?></span>


             <hr />


             <button  style="color: black" type="submit" name="btn-login">Sign In</button>

           

           

             <hr />

   

             <a style="color: black;" href="register.php">Register Here</a>

       

           

    </form>

    </div>


</div>


</body>
</html>

<?php ob_end_flush(); ?>