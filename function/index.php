<?php session_start(); ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Админ</title>
    <link rel='stylesheet' href='../style/style.css'>
</head>
<body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<div class="container">
        <header>
        <div class="nav1">
            <div>
            <h1 class="logo">DoLePa</h1>
            </div>
            <div>
            <input class="find">
            </div>
            <div class="enter">
            <h2><?php echo $_SESSION['user']['login']; ?></h2> 
            <a class="out" href="/function/logout.php">Выйти</a>
            </div>
        </div>
        </header>
    <section>
    <div class="nav2">
        <ul>
            <li class="catalogue">НАВИГАЦИЯ</li>
            <li><a href="">Добавить</a></li>
            <li><a href="">Обновить</a></li>
            <li><a href="">Удалить</a></li>
        </ul>
    </div>
    <div class="add">
    <h2>Добавить</h2>
    <form class="form_sign_up" action="upload.php" method="POST" enctype="multipart/form-data">
        <p>Название</p>
        <input type="text" class="bookname" name="bookname">
        <p>Изображение обложки</p>
        <input type="file" name="image" id="image">
        <p>Краткое описание</p>
        <textarea name="description" class="desc"></textarea>
        <p>Год выпуска</p>
        <input type="text" class="year" name="year">
        <p>Автор</p>
        <input type="text" class="authorname" name="authorname">
        <p>Жанр книги</p>
        <input type="text"  class="genre" name="genre">
        <button class="add" id="addBut" type="submit">Отправить</button>        
    </form>
    </div>
    </section>
    <section>
    <div class="books">
    <?php 
        $connect = mysqli_connect('localhost', 'root','', 'bookshop');

        if (isset($_GET['del'])) {
            $data = $_GET['del'];
            $delete1 = "DELETE FROM `books` WHERE `bookId`=$data";
            mysqli_query($connect, $delete1);
        }
        $book = "SELECT `bookId`, `bookName`, `cover`, `year` FROM `books`";
        $author = "SELECT `AuthorID`, `AuthorName` FROM `author`";
        $genre = "SELECT `genreID`, `NameGenre` FROM `genre`";
        $bookdata = mysqli_query($connect,$book);
        $authordata = mysqli_query($connect,$author);
        $genredata = mysqli_query($connect, $genre);
        while($bookoutput = mysqli_fetch_assoc($bookdata) and $authoroutput = mysqli_fetch_assoc($authordata) and $genreoutput = mysqli_fetch_assoc($genredata) ){ ?>
        <div class="book">
        <p class="other1"><?= $genreoutput['NameGenre']?></p>
        <img src="../img/covers/<?= $bookoutput['cover'] ?>" width="150" height="250">
        <h2 class="name"><?= $bookoutput['bookName']?></h2>
        <p class="other"><?= $authoroutput['AuthorName']?></p>
        <p class="other"><?= $bookoutput['year']?></p>
        <a class="delete" href="?del=<?= $bookoutput['bookId']?>">Удалить</a>
        </div>
    <?php } ?>
    </div>
    </section>
</div>
</body>
</html>