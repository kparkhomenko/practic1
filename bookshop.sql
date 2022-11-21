-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Ноя 21 2022 г., 07:52
-- Версия сервера: 10.1.48-MariaDB
-- Версия PHP: 7.1.33

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
(1, 'Дж. Роулинг'),
(2, 'Ч. Паланик'),
(3, 'Дж. Роулинг'),
(9, 'Дж. Роулинг');

-- --------------------------------------------------------

--
-- Структура таблицы `book`
--

CREATE TABLE `book` (
  `bookID` int(250) NOT NULL,
  `bookName` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `year` int(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `book`
--

INSERT INTO `book` (`bookID`, `bookName`, `image`, `description`, `year`) VALUES
(1, 'Гарри Поттер и Философский камень', '6379eea0a24fd.jpeg', 'Гарри Поттер и философский камень. 2001 2 ч. 26 мин. 12+ «Гарри Поттер и философский камень» – первый из серии фильмов о мальчике-волшебнике Гарри Поттере и его верных друзьях Гермионе Грейнджер и Роне Уизли, о магической вселенной школы Хогвартс, попасть в которую мечтает уже не одно поколение детей по всему миру.', 2001),
(2, 'Бойцовский клуб', '6379f819b53b5.png', 'Роман американского автора Чака Паланика, выпущенный в 1996 году в США издательством «W. W. Norton & Company». В центре сюжета находится герой, страдающий бессонницей, которая вызвана неприятием общества потребления. Также причиной его недуга является недовольство тем, как понимается мужественность в американской культуре. Следуя совету своего доктора, он начинает посещать группы поддержки для больных различными заболеваниями, вследствие чего бессонница отступает. Но через некоторое время такой ', 1996),
(3, 'Гарри Поттер и Кубок Огня', '637a2af451161.png', ' По сюжету Гарри Поттер против своей воли вовлекается в участие в Турнире Трёх Волшебников, и ему предстоит не только сразиться с более опытными участниками, но и разгадать загадку того, как он вообще попал на турнир вопреки правилам', 2001),
(39, 'Гарри Поттер и Орден Феникса', '637a76c72fdc9.png', 'Пятая книга английской писательницы Дж. К. Роулинг о Гарри Поттере. В пятой части Гарри Поттеру предстоит встретиться с Орденом Феникса, отрядом подпольного магического сопротивления, и вместе с ними вступить в прямую оппозицию к правительству магической Британии, которое ради сохранения лица всеми силами пытается сокрыть тот факт, что могущественный колдун Волан-де-Морт воскрес из мёртвых и вновь угрожает миру.', 2003);

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
(2, 2, 2, 3);

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
(2, 'Роман'),
(3, 'Фэнтези'),
(9, 'Фэнтези');

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
(1, 'admin', '01');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`AuthorID`);

--
-- Индексы таблицы `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`bookID`);

--
-- Индексы таблицы `bookid`
--
ALTER TABLE `bookid`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idBook` (`bookID`),
  ADD KEY `idAuthor` (`idAuthor`),
  ADD KEY `idGenre` (`idGenre`);

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
  MODIFY `AuthorID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `book`
--
ALTER TABLE `book`
  MODIFY `bookID` int(250) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT для таблицы `bookid`
--
ALTER TABLE `bookid`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `genre`
--
ALTER TABLE `genre`
  MODIFY `genreID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(250) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `bookid`
--
ALTER TABLE `bookid`
  ADD CONSTRAINT `bookid_ibfk_1` FOREIGN KEY (`idAuthor`) REFERENCES `author` (`AuthorID`),
  ADD CONSTRAINT `bookid_ibfk_3` FOREIGN KEY (`idGenre`) REFERENCES `genre` (`genreID`),
  ADD CONSTRAINT `bookid_ibfk_4` FOREIGN KEY (`bookID`) REFERENCES `book` (`bookID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
