<h1>Hi</h1>
<?php 
// Fetch credentials from environment variables 
$host = getenv('DB_HOST'); 
$dbname = getenv('DB_NAME'); 

$user_file = getenv('DB_USER_FILE');
$pass_file = getenv('DB_PASS_FILE');

$username = trim(file_get_contents($user_file));
$password = trim(file_get_contents($pass_file));


 $hostname = gethostname(); 
 echo "Hello from $hostname"; 
 
 // Create connection 
 $conn = mysqli_connect($host, $username, $password, $dbname); 
 // Check connection 
 if (!$conn) { 
    die(" Database connection failed: " . mysqli_connect_error()); 
    } 
echo " Database connection successful!<br>"; 
// Close connection mysqli_close($conn); 
?>