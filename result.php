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
            <div class="enter2">
            <a href="index.php">На главную</a>
            <a href="function/login.php" class="entersearch">Войти</a>
            </div>
        </div>
        </header>
    <section>
        <div class="books">
        <?php
        $connect = mysqli_connect('localhost', 'root', '', 'bookshop');
        if (isset($_POST['submit'])) {
        $search = mysqli_real_escape_string($connect, $_POST['search']);
        $sql = "SELECT `bookName`, `cover`, `year`  FROM books WHERE bookName LIKE '%$search%'";
        $result=  mysqli_query($connect, $sql);
        $queryResult = mysqli_num_rows($result);
        if($queryResult >0){
            while($row = mysqli_fetch_assoc($result)){?>
             <div class="book">
                    <img src="img/covers/<?= $row['cover']?>" width="150" height="250">
                    <h2 class="name"><?= $row['bookName'] ?></h2>
                    <p class="other"><?= $row['year']?></p>
            </div>
        <? } }
        else die ("Ошибка поиска");
       }
       else{
        echo "Ничего не найдено";
       } ?>
    </div>
    </section>
</body>
<script src="script/script.js"></script>
</html>