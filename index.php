<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel=stylesheet href="../style/style.css">
    <title>DoLePa</title>
</head>
<body>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <div class="container">
        <header>
        <div class="nav1">
            <div>
            <h1 class="logo">DoLePa</h1>
            </div>
            <div class="search">
            <input type="text" class="find" id="search" placeholder="Что вы ищите?">
            </div>
            <div class="enter">
            <a href="function/login.php">Войти</a>
            </div>
        </div>
        </header>
    <section>
        <div class="nav3">
        <nav>
        <ul>
            <li class="catalogue">КАТАЛОГ</li>
            <li data-f="all">Все книги</li>
            <li data-f="fantasy">Фэнтези</li>
            <li data-f="adventure">Приключения</li>
            <li data-f="roman">Романы</li>
            <li data-f="russiaClassic">Русская классика</li>
        </ul>
        </nav>
        </div>
        <div class="books2">
        <?php 
            $connect = mysqli_connect('localhost', 'root', '', 'bookshop');
            $book = "SELECT `bookId`, `bookName`, `cover`, `year` FROM `books`";
            $author = "SELECT `AuthorID`, `AuthorName` FROM `author`";
            $genre = "SELECT `genreID`, `NameGenre` FROM `genre`";
            $bookdata = mysqli_query($connect,$book);
            $authordata = mysqli_query($connect,$author);
            $genredata = mysqli_query($connect, $genre);
            while($bookoutput = mysqli_fetch_assoc($bookdata) and $authoroutput = mysqli_fetch_assoc($authordata) and $genreoutput = mysqli_fetch_assoc($genredata) ){ 
            if($genreoutput['NameGenre'] == "Фэнтези"){
            ?>
            <div class="book fantasy">
            <p class="other3"><?= $genreoutput['NameGenre']?></p>
            <img src="../img/covers/<?= $bookoutput['cover'] ?>" width="150" height="250">
            <h2 class="name"><?= $bookoutput['bookName']?></h2>
            <p class="other"><?= $authoroutput['AuthorName']?></p>
            <p class="other"><?= $bookoutput['year']?></p>
            </div>
            <?php 
            } elseif($genreoutput['NameGenre'] == "Приключения"){
            ?>
            <div class="book adventure">
            <p class="other3"><?= $genreoutput['NameGenre']?></p>
            <img src="../img/covers/<?= $bookoutput['cover'] ?>" width="150" height="250">
            <h2 class="name"><?= $bookoutput['bookName']?></h2>
            <p class="other"><?= $authoroutput['AuthorName']?></p>
            <p class="other"><?= $bookoutput['year']?></p>
            </div>
            <?php 
            } elseif($genreoutput['NameGenre'] == "Роман"){
            ?>
            <div class="book roman">
            <p class="other3"><?= $genreoutput['NameGenre']?></p>
            <img src="../img/covers/<?= $bookoutput['cover'] ?>" width="150" height="250">
            <h2 class="name"><?= $bookoutput['bookName']?></h2>
            <p class="other"><?= $authoroutput['AuthorName']?></p>
            <p class="other"><?= $bookoutput['year']?></p>
            </div>
            <?php 
            } elseif($genreoutput['NameGenre'] == "Русская классика"){
            ?>
            <div class="book russiaClassic">
            <p class="other3"><?= $genreoutput['NameGenre']?></p>
            <img src="../img/covers/<?= $bookoutput['cover'] ?>" width="150" height="250">
            <h2 class="name"><?= $bookoutput['bookName']?></h2>
            <p class="other"><?= $authoroutput['AuthorName']?></p>
            <p class="other"><?= $bookoutput['year']?></p>
            </div>
        <?php } } ?>
        </div>
    </section>
</body>
<script src="script/sort.js"></script>
</html>