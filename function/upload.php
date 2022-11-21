<?php

$bookname = $_POST['bookname'];
$description = $_POST['description'];
$year = $_POST['year'];
$authorname = $_POST['authorname'];
$genre = $_POST['genre'];

$ex = pathinfo($_FILES['image']['name'], PATHINFO_EXTENSION);
$filename = uniqid().'.'.$ex;
$location = "../img/covers/".$filename;
move_uploaded_file($_FILES['image']['tmp_name'], $location);

$connect = mysqli_connect('localhost', 'root', '', 'bookshop');
if(!$connect){
    die ("Не удалось подключиться к базе данных");
}

mysqli_query($connect, "INSERT INTO `books` (`bookId`, `bookName`, `cover`, `description`, `year`) VALUES (NULL, '$bookname', '$filename', '$description', '$year')");
mysqli_query($connect, "INSERT INTO `genre` (`genreID`, `NameGenre`) VALUES (NULL, '$genre')");
mysqli_query($connect,"INSERT INTO `author` (`AuthorID`, `AuthorName`) VALUES (NULL, '$authorname')");
header("Location: /function/index.php");




