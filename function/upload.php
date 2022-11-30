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

$books = mysqli_query($connect, "INSERT INTO `books` (`bookId`, `bookName`, `cover`, `description`, `year`, `NameGenre`) VALUES (NULL, '$bookname', '$filename', '$description', '$year', '$genre')");
$authors = mysqli_query($connect, "SELECT * FROM `author` WHERE `AuthorName` = '$authorname'");
$resA = mysqli_query($connect, "SELECT * FROM `books`");
while($row = mysqli_fetch_assoc($resA)){
    $idBook = $row['bookId'];
}
if(mysqli_num_rows($authors) == 0){
    $authordata = mysqli_query($connect, "INSERT INTO `author` (`AuthorID`, `AuthorName`) VALUES (NULL, '$authorname')");
    $resB = mysqli_query($connect,"SELECT * FROM `author`");
    while($row = mysqli_fetch_assoc($resB)){
    $idAuthor = $row['AuthorID'];
	}
    $bID = mysqli_query($connect, "INSERT INTO `bookid` (`id`, `idAuthor`, `bookID`) VALUES (NULL, '$idAuthor', '$idBook')");
}
else {
    $authorQuery = "SELECT * FROM `author` WHERE `AuthorName` = '$authorname'";
    $authorExamination = mysqli_query($connect, $authorQuery);
    while($AuthorIsExist = mysqli_fetch_assoc($authorExamination)){
        $idAuthHave = $AuthorIsExist['AuthorID'];
    }
    mysqli_query($connect, "INSERT INTO `bookid` (`id`, `idAuthor`, `bookID`) VALUES (NULL, '$idAuthHave', '$idBook')");
}

header("Location: /function/index.php");




