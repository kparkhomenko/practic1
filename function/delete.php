<?php 
     $connect = mysqli_connect("localhost", "root", "", "bookshop");

     $id = $_GET['id'];
	 $resA = mysqli_query($connect, "SELECT * FROM `books`" );
	while($row = mysqli_fetch_assoc($resA)){
	    $deleteBookData = $row['bookId'];
	}
	 $resB = mysqli_query($connect,"SELECT * FROM `author`" );
	while($row = mysqli_fetch_assoc($resB)){
	    $deleteAuthorData = $row['AuthorID'];
	}
     $resID = mysqli_query($connect, "SELECT * FROM `bookid`");
    while($heisenberg = mysqli_fetch_assoc($resID)){
        $deleteBookID = $heisenberg['id'];
    }
	 mysqli_query($connect, "DELETE FROM `bookid` WHERE `bookid`.`id` = '$deleteBookID'");
     mysqli_query($connect, "DELETE FROM `books` WHERE `books`.`bookId` = '$deleteBookData'");
     mysqli_query($connect, "DELETE FROM `author` WHERE `author`.`AuthorID` = '$deleteAuthorData'");

     header("Location: ../function/index.php");