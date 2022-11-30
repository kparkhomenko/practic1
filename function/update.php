<?php

$connect = mysqli_connect('localhost', 'root', '', 'bookshop');
$ex = pathinfo($_FILES['image']['name'], PATHINFO_EXTENSION);
$filename = uniqid().'.'.$ex;
$id = $_POST['id'];
$location = "../img/covers/".$filename;
move_uploaded_file($_FILES['image']['tmp_name'], $location);
$name = $_POST['bookName'];
$author = $_POST['author'];
$genre = $_POST['genre'];
$desc = $_POST['description'];
$year = $_POST['year'];

mysqli_query($connect, "UPDATE `author` SET `AuthorName` = '$author' WHERE `author`.`AuthorID` = $id");
mysqli_query($connect, "UPDATE `books` SET `bookName` = '$name', `cover` = '$filename', `description` = '$desc', `year` = '$year', `NameGenre` = 'genre' WHERE `books`.`bookId` = $id");
header("Location: ../function/index.php");