-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Ноя 30 2022 г., 11:17
-- Версия сервера: 5.6.51
-- Версия PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `bookshop`
--

-- --------------------------------------------------------

--
-- Структура таблицы `author`
--

CREATE TABLE `author` (
  `AuthorID` int(11) NOT NULL,
  `AuthorName` varchar(200) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `author`
--

INSERT INTO `author` (`AuthorID`, `AuthorName`) VALUES
(1, 'Джон Р.Р. Толкин'),
(2, 'Роберт Стивенсон'),
(3, 'Иван Тургенев'),
(4, 'Эрих Ремарк'),
(5, 'Александр Дюма'),
(6, 'Фёдор Достоевский'),
(7, 'Джоан Роулинг');

-- --------------------------------------------------------

--
-- Структура таблицы `bookid`
--

CREATE TABLE `bookid` (
  `id` int(11) NOT NULL,
  `idAuthor` int(11) NOT NULL,
  `bookID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `bookid`
--

INSERT INTO `bookid` (`id`, `idAuthor`, `bookID`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 5, 6),
(7, 6, 7),
(8, 7, 8);

-- --------------------------------------------------------

--
-- Структура таблицы `books`
--

CREATE TABLE `books` (
  `bookId` int(250) NOT NULL,
  `bookName` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cover` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `year` int(250) NOT NULL,
  `NameGenre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `books`
--

INSERT INTO `books` (`bookId`, `bookName`, `cover`, `description`, `year`, `NameGenre`) VALUES
(1, 'Властелин колец', '63870c75250a5.png', 'Властелин колец - история о мире Средиземья, чья судьба зависит от маленького хоббита.', 1955, 'Фэнтези'),
(2, 'Остров сокровищ', '63870c9a09f7a.png', 'Невероятное приключение четырёх англичан, связанное с поиском сокровищ, спрятанных капитаном Флинтом на необитаемом острове.', 1883, 'Приключения'),
(3, 'Отцы и дети', '63870cd15727e.png', 'Главный герой романа нигилист Базаров вместе с молодым дворянином Аркадием Кирсановым приезжает в имение Кирсановых, где происходит знакомство главного героя с отцом и дядей товарища.', 1862, 'Русская классика'),
(4, 'Триумфальная арка', '63870cf477628.png', 'Пронзительная история любви всему наперекор, любви, приносящей боль, но и дарующей бесконечную радость.', 1948, 'Роман'),
(5, 'Граф Монте-Кристо', '63870d25d70b9.png', 'История молодого парижанина, которого приятели в шутку засадили в тюрьму, почерпнута автором в архивах парижской полиции. А из-под пера мастера выходит моряк Эдмон Дантес, мученик замка Иф. Не дождавшись правосудия, он решает сам вершить суд и жестоко мстит врагам, разрушившим его счастье.\r\n', 1846, 'Роман'),
(6, 'Три мушкетёра', '63870d48e3bde.png', 'Книга посвящена приключениям молодого дворянина по имени д’Артаньян, отправившегося в Париж, чтобы стать мушкетёром, и трёх его друзей-мушкетёров Атоса, Портоса и Арамиса в период между 1625 и 1628 годами.', 1844, 'Приключения'),
(7, 'Преступление и наказание', '63870d7f69b33.png', 'Главный герой романа Родион Раскольников решается на убийство, чтобы доказать себе и миру, что он не \"тварь дрожащая\", а \"право имеет\". Главным предметом исследования писателя становится процесс превращения добропорядочного, умного и доброго юноши в убийцу, а также то, как совершивший преступление Раскольников может искупить свою вину.', 1886, 'Русская классика'),
(8, 'Гарри Поттер и философский камень', '63870da3449a5.png', 'История о жизни десятилетнего мальчика по имени Гарри Поттер, чья жизнь кардинально меняется.  Он узнаёт, что является чистокровным волшебником и должен учиться в школе магов.', 1997, 'Фэнтези');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(250) NOT NULL,
  `login` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `login`, `password`) VALUES
(2, 'ivan', '123');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`AuthorID`);

--
-- Индексы таблицы `bookid`
--
ALTER TABLE `bookid`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idBook` (`bookID`),
  ADD KEY `idAuthor` (`idAuthor`);

--
-- Индексы таблицы `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`bookId`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `author`
--
ALTER TABLE `author`
  MODIFY `AuthorID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `bookid`
--
ALTER TABLE `bookid`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `books`
--
ALTER TABLE `books`
  MODIFY `bookId` int(250) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(250) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `bookid`
--
ALTER TABLE `bookid`
  ADD CONSTRAINT `bookid_ibfk_1` FOREIGN KEY (`idAuthor`) REFERENCES `author` (`AuthorID`),
  ADD CONSTRAINT `bookid_ibfk_4` FOREIGN KEY (`bookID`) REFERENCES `books` (`bookId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
