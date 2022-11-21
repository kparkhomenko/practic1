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
            <div>
            <input type="search" class="find" id="live_search" autocomplete="off">
            </div>
            <div class="enter">
            <a href="function/login.php">Войти</a>
            </div>
        </div>
        </header>
    <section>
        <div class="books1">
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
            <p class="other2"><?= $genreoutput['NameGenre']?></p>
            <img src="../img/covers/<?= $bookoutput['cover'] ?>" width="150" height="250">
            <h2 class="name"><?= $bookoutput['bookName']?></h2>
            <p class="other"><?= $authoroutput['AuthorName']?></p>
            <p class="other"><?= $bookoutput['year']?></p>
            </div>
        <?php } ?>
        </div>
    </section>
    <div id="searchresult"></div>
    <script type="text/javascript">
        $(document).ready(function() {

            $("#live_search").keyup(function() {

                var input = $(this).val();
                //alert(input); 

                if (input != "") {
                    $("#searchresult").css("display", "block");
                    $.ajax({

                        url: "function/finder.php",
                        method: "POST",
                        data: {
                            input: input
                        },

                        success: function(data) {
                            $("#searchresult").html(data);
                        }
                    });


                } else {

                    $("#searchresult").css("display", "none");
                }
            });
        });
    </script>
    </div>
</body>
<script src="script/script.js"></script>
</html>