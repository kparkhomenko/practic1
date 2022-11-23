-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Ноя 23 2022 г., 10:41
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
(3, 'Эрих Ремарк'),
(4, 'Иван Тургенев');

-- --------------------------------------------------------

--
-- Структура таблицы `bookid`
--

CREATE TABLE `bookid` (
  `id` int(11) NOT NULL,
  `idAuthor` int(11) NOT NULL,
  `bookID` int(11) NOT NULL,
  `idGenre` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `bookid`
--

INSERT INTO `bookid` (`id`, `idAuthor`, `bookID`, `idGenre`) VALUES
(1, 1, 1, 1),
(2, 2, 2, 2),
(3, 3, 3, 3),
(4, 4, 4, 4);

-- --------------------------------------------------------

--
-- Структура таблицы `books`
--

CREATE TABLE `books` (
  `bookId` int(250) NOT NULL,
  `bookName` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cover` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `year` int(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `books`
--

INSERT INTO `books` (`bookId`, `bookName`, `cover`, `description`, `year`) VALUES
(1, 'Властелин колец', '637bc80c2baf7.png', 'Властелин колец - история о мире Средиземья, чья судьба зависит от маленького хоббита.', 1955),
(2, 'Остров сокровищ', '637bc8a248e19.png', 'Невероятное приключение четырёх англичан, связанное с поиском сокровищ, спрятанных капитаном Флинтом на необитаемом острове.', 1883),
(3, 'Триумфальная арка', '637bc8f7eceb5.png', 'Пронзительная история любви всему наперекор, любви, приносящей боль, но и дарующей бесконечную радость.', 1948),
(4, 'Отцы и дети', '637bc9236357a.png', 'Главный герой романа нигилист Базаров вместе с молодым дворянином Аркадием Кирсановым приезжает в имение Кирсановых, где происходит знакомство главного героя с отцом и дядей товарища.', 1862);

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
(1, 'Фэнтези'),
(2, 'Приключения'),
(3, 'Роман'),
(4, 'Русская классика');

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
(2, 'ivan', '12345');

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
  ADD KEY `idAuthor` (`idAuthor`),
  ADD KEY `idGenre` (`idGenre`);

--
-- Индексы таблицы `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`bookId`);

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
  MODIFY `AuthorID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `bookid`
--
ALTER TABLE `bookid`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `books`
--
ALTER TABLE `books`
  MODIFY `bookId` int(250) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `genre`
--
ALTER TABLE `genre`
  MODIFY `genreID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
  ADD CONSTRAINT `bookid_ibfk_3` FOREIGN KEY (`idGenre`) REFERENCES `genre` (`genreID`),
  ADD CONSTRAINT `bookid_ibfk_4` FOREIGN KEY (`bookID`) REFERENCES `books` (`bookId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
