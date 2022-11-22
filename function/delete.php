<?php 
     $connect = mysqli_connect("localhost", "root", "", "bookshop");

     $deleteBookData = $_GET['deleteBookData'];
     $deleteAuthorData = $_GET['deleteAuthorData'];
     $deleteGenreData = $_GET['deleteGenreData'];

     mysqli_query($connect, "DELETE FROM `books` WHERE `books`.`bookId` = '$deleteBookData'");
     mysqli_query($connect, "DELETE FROM `author` WHERE `author`.`AuthorID` = '$deleteAuthorData'");
     mysqli_query($connect, "DELETE FROM `genre` WHERE `genre`.`genreID` = '$deleteGenreData'");

     header("Location: ../function/index.php");