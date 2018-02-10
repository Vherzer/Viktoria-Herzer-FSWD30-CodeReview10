<?php

 ob_start();

 session_start();

 require_once 'dbconnect.php';

 

 // if session is not set this will redirect to login page

 if( !isset($_SESSION['user']) ) {

  header("Location: index.php");

  exit;

 }

 // select logged-in users detail

 $res=mysqli_query($conn, "SELECT * FROM users WHERE user_id=".$_SESSION['user']);

 $userRow=mysqli_fetch_array($res, MYSQLI_ASSOC);

?>

<!DOCTYPE html>

<html>

<head>

<title> <?php echo $userRow['email']; ?></title>
<link rel="stylesheet" type="text/css" href="stylesheet.css">
</head>

<body>
	<header class="header">
     	
     

             <h2 >Welcome to the BigLibrary </h2> <img src="imgs/logo.png" alt="logo" height="100px;">
             

             <hr />
	</header><!-- /header -->

<h5 style="text-align: right; padding-right: 20px; text-decoration: underline;"><?php echo $userRow['user_name']; ?> is logged in <br> <a href="logout.php?logout">Sign Out</a></h5>

         <p style="font-size: 30px; padding-left: 25px">  Welcome back  <?php echo $userRow['user_name']; ?></p><br> <p style="font-size: 20px; text-align: center;"> Explore the range of CDS, Books and DVDs we offer </p><br>
         

        <style>
		table, th, td {
		    border: 1px solid black;
			}
		</style>     
<?php


$sql = "SELECT cds_id, fk_artist_id, fk_record_label_id, ISBN_code, title, release_date, type, description FROM CDs";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    echo "<table><tr><th>ID</th><th>Artist</th><th>Record Label</th><th>ISBN Code</th><th>Title</th><th>Release Date</th><th>Type</th><th>Description</th></tr>";
    // output data of each row
    while($row = $result->fetch_assoc()) {
        echo "<tr><td>" . $row["cds_id"]. "</td><td>" . $row["fk_artist_id"]. "</td><td>" . $row["fk_record_label_id"]. "</td><td>" . $row["ISBN_code"]. "</td><td>" . $row["title"]. "</td><td>" . $row["release_date"]. "</td><td>" . $row["type"]. "</td><td>" . $row["description"]. "</td></tr>";
    }
    echo "</table>";
} else {
    echo "0 results";
}

$conn->close();
?> 

<style>
		table, th, td {
		    border: 1px solid black;
			}
		</style>     
<?php


$sql = "SELECT books_id, fk_author_id, fk_publisher_id, ISBN_code, title, publish_date, type, description FROM CDs";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    echo "<table><tr><th>ID</th><th>author</th><th>Publisher</th><th>ISBN Code</th><th>Title</th><th>Publishing Date</th><th>Type</th><th>Description</th></tr>";
    // output data of each row
    while($row = $result->fetch_assoc()) {
        echo "<tr><td>" . $row["books_id"]. "</td><td>" . $row["fk_author_id"]. "</td><td>" . $row["fk_publisher_id"]. "</td><td>" . $row["ISBN_code"]. "</td><td>" . $row["title"]. "</td><td>" . $row["publish_date"]. "</td><td>" . $row["type"]. "</td><td>" . $row["description"]. "</td></tr>";
    }
    echo "</table>";
} else {
    echo "0 results";
}

$conn->close();
?> 
<style>
		table, th, td {
		    border: 1px solid black;
			}
		</style>     
<?php


$sql = "SELECT dvds_id, fk_director_id, fk_production_company_id, ISBN_code, title, release_date, type, description FROM CDs";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    echo "<table><tr><th>ID</th><th>Director</th><th>Production Company</th><th>ISBN Code</th><th>Title</th><th>Release Date</th><th>Type</th><th>Description</th></tr>";
    // output data of each row
    while($row = $result->fetch_assoc()) {
        echo "<tr><td>" . $row["dvds_id"]. "</td><td>" . $row["fk_director_id"]. "</td><td>" . $row["fk_production_company_id"]. "</td><td>" . $row["ISBN_code"]. "</td><td>" . $row["title"]. "</td><td>" . $row["release_date"]. "</td><td>" . $row["type"]. "</td><td>" . $row["description"]. "</td></tr>";
    }
    echo "</table>";
} else {
    echo "0 results";
}

$conn->close();
?> 

         

   

</body>

</html>

<?php ob_end_flush(); ?>

