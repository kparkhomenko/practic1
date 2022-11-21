-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Ноя 21 2022 г., 21:38
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
(8, 'Роберт Стивенсон'),
(9, 'Эрих Ремарк'),
(10, 'Иван Тургенев'),
(11, 'Джон Р.Р. Толкин');

-- --------------------------------------------------------

--
-- Структура таблицы `bookid`
--

CREATE TABLE `bookid` (
  `id` int(11) NOT NULL,
  `idAuthor` int(11) NOT NULL,
  `idBook` int(11) NOT NULL,
  `idGenre` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `books`
--

CREATE TABLE `books` (
  `bookId` int(11) NOT NULL,
  `bookName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cover` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `year` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `books`
--

INSERT INTO `books` (`bookId`, `bookName`, `cover`, `description`, `year`) VALUES
(9, 'Остров сокровищ', '637a9fdbbe9fc.png', 'Остров сокровищ повествует о загадочном острове, где давным-давно были зарыты сокровища.', '1948'),
(10, 'Триумфальная арка', '637aa012723d4.png', 'Пронзительная история любви всему наперекор, любви, приносящей боль, но и дарующей бесконечную радость.', '1948'),
(11, 'Отцы и дети', '637aa0579ac18.png', 'Главный герой романа нигилист Базаров вместе с молодым дворянином Аркадием Кирсановым приезжает в имение Кирсановых, где происходит знакомство главного героя с отцом и дядей товарища.', '1862'),
(12, 'Властелин колец', '637aa07137fe0.png', 'Властелин колец - история о мире Средиземья, чья судьба зависит от маленького хоббита.', '1955');

-- --------------------------------------------------------

--
-- Структура таблицы `genre`
--

CREATE TABLE `genre` (
  `genreID` int(11) NOT NULL,
  `NameGenre` varchar(200) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `genre`
--

INSERT INTO `genre` (`genreID`, `NameGenre`) VALUES
(8, 'Приключения'),
(9, 'Роман'),
(10, 'Русская классика'),
(11, 'Фэнтези');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `login` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `login`, `password`) VALUES
(1, 'ivan', '12345');

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
  ADD UNIQUE KEY `idBook` (`idBook`),
  ADD KEY `idAuthor` (`idAuthor`),
  ADD KEY `idGenre` (`idGenre`);

--
-- Индексы таблицы `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`bookId`),
  ADD KEY `bookId` (`bookId`);

--
-- Индексы таблицы `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`genreID`),
  ADD KEY `genreID` (`genreID`),
  ADD KEY `genreID_2` (`genreID`);

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
  MODIFY `AuthorID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `bookid`
--
ALTER TABLE `bookid`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `books`
--
ALTER TABLE `books`
  MODIFY `bookId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `genre`
--
ALTER TABLE `genre`
  MODIFY `genreID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `bookid`
--
ALTER TABLE `bookid`
  ADD CONSTRAINT `bookid_ibfk_1` FOREIGN KEY (`idAuthor`) REFERENCES `author` (`AuthorID`),
  ADD CONSTRAINT `bookid_ibfk_3` FOREIGN KEY (`idGenre`) REFERENCES `genre` (`genreID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
