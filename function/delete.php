<?php 
     $connect = mysqli_connect("localhost", "root", "", "bookshop");

     $id = $_GET['id'];
     $query = "SELECT * FROM `bookid` WHERE `id` = $id";
     $sql = mysqli_query($connect, $query);
     $assoc = mysqli_fetch_assoc($sql);
     $bookID = $assoc['bookID'];
     $resA = mysqli_query($connect, "SELECT * FROM `bookid` WHERE `bookID` = '$bookID'");
	 $imgr = mysqli_fetch_assoc(mysqli_query($connect, "SELECT * FROM `books`.`bookId` = `$bookID`"));
	while($row = mysqli_fetch_assoc($resA)){
	    $array[] = $post['AuthorID'];
        mysqli_query($connect, "DELETE FROM `bookid` WHERE `bookid`.`bookID` = '$bookID'");
	}
    mysqli_query($connect, "DELETE FROM `books` WHERE `books`.`bookId` = '$bookID'");


     header("Location: ../function/index.php");