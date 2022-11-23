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
            <div class="enter1">
            <h2><?php echo $_SESSION['user']['login']; ?></h2> 
            <a class="out" href="/function/logout.php">Выйти</a>
            </div>
        </div>
        </header>
    <section>
    <div class="nav2">
        <ul>
            <li class="catalogue">НАВИГАЦИЯ</li>
            <li><a href="#side1">Добавить</a></li>
            <li><a href="#side2">Каталог</a></li>
            <li><a href="#side3">Обновить</a></li>
        </ul>
    </div>
    <div class="add">
    <a name="side1"></a>
    <h2>Добавить</h2>
    <form class="form_sign_up" action="upload.php" method="POST" enctype="multipart/form-data">
        <p class="addheader">Название</p>
        <input type="text" class="addinput" name="bookname">
        <p class="addheader">Изображение обложки</p>
        <input type="file" name="image" class="addimage" id="image">
        <p class="addheader">Краткое описание</p>
        <textarea name="description" class="addinput"></textarea>
        <p class="addheader">Год выпуска</p>
        <input type="text" class="addinput" name="year">
        <p class="addheader">Автор</p>
        <input type="text" class="addinput" name="authorname">
        <p class="addheader">Жанр книги</p>
        <input type="text"  class="addinput" name="genre"><br>
        <button class="addbutton" id="addBut" type="submit">Отправить</button>        
    </form>
    </div>
    </section>
    <section>
    <a name="side2"></a>
    <div class="books">
    <?php 
        $connect = mysqli_connect('localhost', 'root','', 'bookshop');
        $book = "SELECT * FROM `books`";
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
        <a class="delete" href="delete.php?deleteBookData=<?= $bookoutput['bookId']?>&deleteAuthorData=<?= $authoroutput['AuthorID']?>&deleteGenreData=<?= $genreoutput['genreID']?>">Удалить</a>
        <a class="delete" href="?updateBookData=<?= $bookoutput['bookId']?>&updateAuthorData=<?= $authoroutput['AuthorID']?>&updateGenreData=<?= $genreoutput['genreID']?>">Обновить</a>
        </div>
    <?php } ?>
    </div>
    </section>
    <section>
        <div class="update">
        <?php 
            $bookUpdateID = $_GET['updateBookData'];
            $bookUpdate = mysqli_query($connect, "SELECT * FROM `books` WHERE `bookId` = '$bookUpdateID'");
            $bookUpdate = mysqli_fetch_assoc($bookUpdate);
            $authorUpdateID = $_GET['updateAuthorData'];
            $authorUpdate = mysqli_query($connect, "SELECT * FROM `author` WHERE `AuthorID` = '$authorUpdateID'");
            $authorUpdate = mysqli_fetch_assoc($authorUpdate);
            $genreUpdateID = $_GET['updateGenreData'];
            $genreUpdate = mysqli_query($connect, "SELECT * FROM `genre` WHERE `genreID` = '$genreUpdateID'");
            $genreUpdate = mysqli_fetch_assoc($genreUpdate);

        ?>
        <a name="side3"></a>
        <h2>Обновить</h2>
        <form action="update.php" method="POST" enctype="multipart/form-data" class="form">
        <input type="hidden" name="id" value="<?=$bookUpdate['bookId'] ?>">
        <p class="addheader">Название</p>
        <input type="text" class="addinput" name="bookName" value="<?= $bookUpdate['bookName'] ?>">
        <p class="addheader">Изображение обложки</p>
        <input type="file" name="image" class="addimage" id="image" value="<?= $bookUpdate['cover']?>">
        <p class="addheader">Краткое описание</p>
        <textarea name="description" class="addinput"><?= $bookUpdate['description'] ?></textarea>
        <p class="addheader">Год выпуска</p>
        <input type="text"  class="addinput" name="year" value="<?= $bookUpdate['year'] ?>">
        <p class="addheader">Автор</p>
        <input type="text" class="addinput" name="author" value="<?= $authorUpdate['AuthorName']?>">
        <p class="addheader">Жанр книги</p>
        <input type="text"  class="addinput" name="genre" value="<?= $genreUpdate['NameGenre'] ?>"><br>
        <button class="updatebutton" id="addBut" type="submit">Обновить</button>     
        </form>
        </div>
    </section>
</div>
</body>
</html>