<?php session_start();?>

<style>
@font-face {
    font-family: font;
    src: url(PTSans-Regular.ttf);
}

* {
    margin: 0;
    padding: 0;
    background-color: #EEEEEE;
}

h1 {
    font-family: font;
    font-weight: normal;
    text-align: center;
    margin-bottom: 5%;
}

p {
    font-family: font;
    font-size: 20px;
}

.container {
    width: 1250px;
    margin-top: 3%;
    margin-left: 16%;
}

.inp {
    margin-left: 38%;
    margin-top: 4%;
}

input {
    border-radius: 10px;
    height: 50px; 
    width: 300px;
}

button {
    width: 300px;
    height: 50px;
    border-radius: 10px;
    font-size: 20px;    
}

.error {
    margin-left: 30%;
    width: 450px;
    padding: 2%;
    font-family: font;
    background-color: white;
    text-align: center;
}

</style>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Авторизация</title>
</head>
<body>
<div class="container">
<h1>Вход</h1>
<?php if(isset($_SESSION['error'])):?>
    <div class="error"><?php echo $_SESSION['error'];?></div>
    <?php unset($_SESSION['error']);?>
    <?php endif;?>
<form action="/function/auth.php" method="POST"> 
    <div class="inp">
        <p>Логин</p>
        <input type="text" name="login" />
    </div>
    <div class="inp">
        <p>Пароль</p>
        <input type="password" name="password" />
    </div>
    <div class="inp">
        <button type="submit">Войти</button>
    </div>
</form>
</div>   
</body>
</html>


