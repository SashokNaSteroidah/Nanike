-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Июн 24 2022 г., 11:55
-- Версия сервера: 10.4.21-MariaDB
-- Версия PHP: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `gibdd_otdel`
--

-- --------------------------------------------------------

--
-- Структура таблицы `branch`
--

CREATE TABLE `branch` (
  `ID_branch` int(11) NOT NULL,
  `Name_branch` varchar(300) DEFAULT NULL,
  `Description_branch` varchar(300) DEFAULT NULL,
  `Area_branch` varchar(300) DEFAULT NULL,
  `Rating_branch` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `branch`
--

INSERT INTO `branch` (`ID_branch`, `Name_branch`, `Description_branch`, `Area_branch`, `Rating_branch`) VALUES
(1, 'Автомобилист', 'Надоело изо дня в день спускаться в метро, надеясь занять свободное место? Значит, пришло время сесть за руль собственной машины! А если у вас до сих пор нет прав, Автошкола Автомобилист поможет освоить тонкости езды по Москве и подготовиться к сдаче экзамена', 'Химки', '4.1 111 отзыва'),
(2, 'Эталон', 'Пришло время научиться управлять автомобилем и получить права категории A или B? Тогда вам имеет смысл обратить внимание на Автошколу Эталон', 'Московская область, Балашиха, улица Ситникова, 2', '3.1 16636 отзыва');

-- --------------------------------------------------------

--
-- Структура таблицы `client`
--

CREATE TABLE `client` (
  `ID_client` int(11) NOT NULL,
  `Client_Email` varchar(100) NOT NULL,
  `Name_of_the_user` varchar(100) NOT NULL,
  `Surname_of_the_user` varchar(100) NOT NULL,
  `Patronymic_of_the_user` varchar(100) NOT NULL,
  `Phone_number` varchar(50) NOT NULL,
  `Passport_Series` varchar(4) NOT NULL,
  `Number_Passport` varchar(6) NOT NULL,
  `User_password` varchar(100) NOT NULL,
  `User_date_of_birth` varchar(50) NOT NULL,
  `User_rights_numbe` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `client`
--

INSERT INTO `client` (`ID_client`, `Client_Email`, `Name_of_the_user`, `Surname_of_the_user`, `Patronymic_of_the_user`, `Phone_number`, `Passport_Series`, `Number_Passport`, `User_password`, `User_date_of_birth`, `User_rights_numbe`) VALUES
(1, 'Sasooossa@mail.ru', 'Александр', 'Залупник', 'Петрович', '+79102322503', '5412', '189876', '$2y$10$AUXZhM4xDEBWwnXAJkkEMOCHff3l.10eNCkqNO3MFXPp1qvOX1pXG', '09.12.12', '21123'),
(2, 'KashelotIgor@yahoo.com', 'Игорь', 'Кашелотов', 'Пабло Диего Хозе Франциско де Паула Хуан Непомукено Криспин Криспиано де ла Сантисима Тринидад Руизо', '+3112344215', '9823', '125751', 'daumeyaDlinoeOtchestvoIchto122', '12.07.54', '1812976'),
(13, 'qweqeqqtfsdf@mail.ru', 'qweqweqwe', 'qweqwe', 'qwtetfwefqq', '+7 (123) 456-7890', '1204', '124124', '$2y$10$weZJaDSLOWV.u/0C5bJyXOjz88wemm1jZcAsnymQUnj/4qI9xxSay', '12.31.2312', '0358235230'),
(14, 'Nikkkitaaa@mail.ru', 'sa', 'niki', 'wpqr', '+7 (010) 203-0405', '3250', '675753', '$2y$10$YIRBpujI9dT5QY.M8Zi6P.L846QIcUTLCe6xndoTqzEtPymD5CV5.', '12.32.3211', '2141243508'),
(16, 'adminadmin@mail.ru', 'admin', 'admin', 'admin', '+7 (010) 101-0102', '0101', '010100', '$2y$10$wvjAt.sD65RR64nwRCivYeDCtX7gpHlEa9K1bhf3wYI6eg/UeWPMK', '01.01.0101', '0101010100'),
(17, 'AndskiyGoshik@mail.ru', 'Никита', 'Никита', 'QQQQ', '+7 (010) 101-0101', '0285', '084203', '$2y$10$S5X8th4HaMkEi3H3R5TWJuTH8m0XcjJOpJ6gklJOUwG5rqo6w/fji', '12.32.3221', '1212049019'),
(18, 'wufpwoeurpwouer@mail.ru', 'ййй', 'ййй', 'ййй', '+7 (000) 000-0001', '3468', '230623', '$2y$10$jI5/2cNh66Z2S3bWM4MdQukNbcYk.I14Ckw1afyQB6Iqv/AlPeAsu', '12.12.1212', '0294802937');

-- --------------------------------------------------------

--
-- Структура таблицы `employees`
--

CREATE TABLE `employees` (
  `ID_employees` int(11) NOT NULL,
  `Surname_Employees` varchar(100) DEFAULT NULL,
  `Name_Employees` varchar(100) DEFAULT NULL,
  `Patronymic_Employees` varchar(100) DEFAULT NULL,
  `Date_of_employment` varchar(100) DEFAULT NULL,
  `Salary` varchar(100) DEFAULT NULL,
  `Age_Employees` varchar(100) DEFAULT NULL,
  `ID_Job_title` int(11) DEFAULT NULL,
  `ID_gender` int(11) DEFAULT NULL,
  `ID_branch` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `employees`
--

INSERT INTO `employees` (`ID_employees`, `Surname_Employees`, `Name_Employees`, `Patronymic_Employees`, `Date_of_employment`, `Salary`, `Age_Employees`, `ID_Job_title`, `ID_gender`, `ID_branch`) VALUES
(1, 'Укупник', 'Герман', 'Укупнич', '01.02.2020', '750000', '22', 1, 1, 1),
(2, 'Чикатило', 'Леопольд', 'Тихонович', '20.10.1990', '10000', '56', 2, 2, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `feedback`
--

CREATE TABLE `feedback` (
  `ID_feedBack` int(11) NOT NULL,
  `Review` varchar(500) DEFAULT NULL,
  `ID_client` int(11) DEFAULT NULL,
  `ID_topics` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `feedback`
--

INSERT INTO `feedback` (`ID_feedBack`, `Review`, `ID_client`, `ID_topics`) VALUES
(1, 'Сайт piese of shit даже под водку не очень', 1, 2),
(2, 'Нормалды сайт, под п', 2, 1),
(3, 'asdf', 5, 1),
(4, 'v ghvh', 10, 2),
(5, 'v ghvvbccb', 10, 2),
(6, '', 10, 1),
(7, 'Дерьмо говно', 12, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `fine`
--

CREATE TABLE `fine` (
  `ID_fine` int(11) NOT NULL,
  `fine_value` varchar(50) NOT NULL,
  `fine_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fine_description` varchar(500) NOT NULL,
  `fine_img` varchar(128) NOT NULL,
  `fine_sts` int(32) NOT NULL,
  `ID_client` int(11) NOT NULL,
  `ID_fine_category` int(11) NOT NULL,
  `ID_employees` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `fine`
--

INSERT INTO `fine` (`ID_fine`, `fine_value`, `fine_date`, `fine_description`, `fine_img`, `fine_sts`, `ID_client`, `ID_fine_category`, `ID_employees`) VALUES
(3, '134512', '2022-06-19 21:07:11', 'dsfgdsgsd', 'b0ccc04f95aba35eb9d7227f65284753.jpeg', 3452345, 1, 1, 1),
(4, '134512', '2022-06-19 21:07:17', 'dsfgdsgsd', 'e23c0340b4879cdaef23537dd89d7a1d.jpeg', 3452345, 1, 1, 1),
(5, '2342q4', '2022-06-20 09:45:15', '2342342', 'aba3860bb403806458cb9ed45000350f.jpeg', 23423, 2, 1, 1),
(7, '5432', '2022-06-22 07:58:55', '0E92URWOPROWIEFO IOWI OWIERUOIWEUROIWUROIWUE ROWEIUROIWUERPW RUPQWRUPWORUIPWEOI WQEPOIQWEPOIQWEOUWRIWEUR PWPROUQPWRU', 'b7a1712e458343d100d603552b48cc66.jpeg', 23423, 17, 2, 2),
(8, '5432', '2022-06-22 08:01:25', '0E92URWOPROWIEFO IOWI OWIERUOIWEUROIWUROIWUE ROWEIUROIWUERPW RUPQWRUPWORUIPWEOI WQEPOIQWEPOIQWEOUWRIWEUR PWPROUQPWRU', '2a0d5d27bc77bfb982193e5800bd00dc.jpeg', 23423, 17, 1, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `fine_category`
--

CREATE TABLE `fine_category` (
  `ID_fine_category` int(11) NOT NULL,
  `fine_category_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `fine_category`
--

INSERT INTO `fine_category` (`ID_fine_category`, `fine_category_name`) VALUES
(1, 'Превышение скорости'),
(2, 'Сбил бабушку ');

-- --------------------------------------------------------

--
-- Структура таблицы `gender`
--

CREATE TABLE `gender` (
  `ID_gender` int(11) NOT NULL,
  `Gender_name` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `gender`
--

INSERT INTO `gender` (`ID_gender`, `Gender_name`) VALUES
(1, 'Мужской '),
(2, 'Женский');

-- --------------------------------------------------------

--
-- Структура таблицы `job_title`
--

CREATE TABLE `job_title` (
  `ID_Job_title` int(11) NOT NULL,
  `Job_title_name` varchar(50) DEFAULT NULL,
  `Responsibilities` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `job_title`
--

INSERT INTO `job_title` (`ID_Job_title`, `Job_title_name`, `Responsibilities`) VALUES
(1, 'Патрульный туалетов', 'защищать туалеты от не санкционированного входа '),
(2, 'Чел который работает за всех', 'Ну просто чел работает за всех');

-- --------------------------------------------------------

--
-- Структура таблицы `news`
--

CREATE TABLE `news` (
  `ID_news` int(11) NOT NULL,
  `Data_of_the_news` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Name_of_the_news` varchar(1152) DEFAULT NULL,
  `News_description` varchar(1152) DEFAULT NULL,
  `ID_employees` int(11) DEFAULT NULL,
  `news_img` varchar(128) NOT NULL,
  `news_link` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `news`
--

INSERT INTO `news` (`ID_news`, `Data_of_the_news`, `Name_of_the_news`, `News_description`, `ID_employees`, `news_img`, `news_link`) VALUES
(4, '2022-06-20 09:37:13', 'sdfgddsfgd', 'dsfhsdfh', 1, '4d8c32eb106af5a3aa04a9ac6bdb2881.jpeg', 'ert2346.ru'),
(5, '2022-06-20 09:41:22', 'sdfgddsfgd', 'dsfhsdfh', 1, '0e1fe800da64c60d71e3e4c1cad688bb.jpeg', 'ert2346.ru'),
(6, '2022-06-20 09:43:04', 'sdfgddsfgd', 'dsfhsdfh', 1, 'db2c79776a1dcaf8358b9b0e96df7b93.jpeg', 'ert2346.ru'),
(8, '2022-06-20 11:45:16', '902374097235-93U1409IU3EOP', '0E92URWOPROWIEFO IOWI OWIERUOIWEUROIWUROIWUE ROWEIUROIWUERPW RUPQWRUPWORUIPWEOI WQEPOIQWEPOIQWEOUWRIWEUR PWPROUQPWRU', 1, 'a4016a148b5bbca2186ff6b017fae90b.jpeg', 'KPOIQWORI[WPRIQ[RT.RU');

-- --------------------------------------------------------

--
-- Структура таблицы `payment_procedure`
--

CREATE TABLE `payment_procedure` (
  `ID_payment_procedure` int(11) NOT NULL,
  `Date_of_payment` varchar(50) DEFAULT NULL,
  `Payment_name` varchar(20) DEFAULT NULL,
  `Payment_State` varchar(20) DEFAULT NULL,
  `Payment_amount` varchar(50) DEFAULT NULL,
  `ID_client` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `payment_procedure`
--

INSERT INTO `payment_procedure` (`ID_payment_procedure`, `Date_of_payment`, `Payment_name`, `Payment_State`, `Payment_amount`, `ID_client`) VALUES
(1, '21.12.12', 'Платеж №12', 'Успешный', '12500', 1),
(2, '10.06.2022', 'Платеж №21562', 'Не успешный', '62500', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `topics`
--

CREATE TABLE `topics` (
  `ID_topics` int(11) NOT NULL,
  `Name_of_the_topic` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `topics`
--

INSERT INTO `topics` (`ID_topics`, `Name_of_the_topic`) VALUES
(1, 'Неправильное отображение изображений'),
(2, 'Политическая обстановка среди славян');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `branch`
--
ALTER TABLE `branch`
  ADD PRIMARY KEY (`ID_branch`);

--
-- Индексы таблицы `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`ID_client`);

--
-- Индексы таблицы `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`ID_employees`),
  ADD KEY `R_26` (`ID_Job_title`),
  ADD KEY `R_27` (`ID_gender`),
  ADD KEY `R_28` (`ID_branch`);

--
-- Индексы таблицы `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`ID_feedBack`),
  ADD KEY `R_21` (`ID_client`),
  ADD KEY `R_31` (`ID_topics`);

--
-- Индексы таблицы `fine`
--
ALTER TABLE `fine`
  ADD PRIMARY KEY (`ID_fine`),
  ADD KEY `R_23` (`ID_client`),
  ADD KEY `R_25` (`ID_fine_category`),
  ADD KEY `R_29` (`ID_employees`);

--
-- Индексы таблицы `fine_category`
--
ALTER TABLE `fine_category`
  ADD PRIMARY KEY (`ID_fine_category`);

--
-- Индексы таблицы `gender`
--
ALTER TABLE `gender`
  ADD PRIMARY KEY (`ID_gender`);

--
-- Индексы таблицы `job_title`
--
ALTER TABLE `job_title`
  ADD PRIMARY KEY (`ID_Job_title`);

--
-- Индексы таблицы `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`ID_news`),
  ADD KEY `R_30` (`ID_employees`);

--
-- Индексы таблицы `payment_procedure`
--
ALTER TABLE `payment_procedure`
  ADD PRIMARY KEY (`ID_payment_procedure`),
  ADD KEY `R_22` (`ID_client`);

--
-- Индексы таблицы `topics`
--
ALTER TABLE `topics`
  ADD PRIMARY KEY (`ID_topics`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `client`
--
ALTER TABLE `client`
  MODIFY `ID_client` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT для таблицы `feedback`
--
ALTER TABLE `feedback`
  MODIFY `ID_feedBack` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `fine`
--
ALTER TABLE `fine`
  MODIFY `ID_fine` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `news`
--
ALTER TABLE `news`
  MODIFY `ID_news` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `R_26` FOREIGN KEY (`ID_Job_title`) REFERENCES `job_title` (`ID_Job_title`),
  ADD CONSTRAINT `R_27` FOREIGN KEY (`ID_gender`) REFERENCES `gender` (`ID_gender`),
  ADD CONSTRAINT `R_28` FOREIGN KEY (`ID_branch`) REFERENCES `branch` (`ID_branch`);

--
-- Ограничения внешнего ключа таблицы `fine`
--
ALTER TABLE `fine`
  ADD CONSTRAINT `R_23` FOREIGN KEY (`ID_client`) REFERENCES `client` (`ID_client`),
  ADD CONSTRAINT `R_25` FOREIGN KEY (`ID_fine_category`) REFERENCES `fine_category` (`ID_fine_category`),
  ADD CONSTRAINT `R_29` FOREIGN KEY (`ID_employees`) REFERENCES `employees` (`ID_employees`);

--
-- Ограничения внешнего ключа таблицы `news`
--
ALTER TABLE `news`
  ADD CONSTRAINT `R_30` FOREIGN KEY (`ID_employees`) REFERENCES `employees` (`ID_employees`);

--
-- Ограничения внешнего ключа таблицы `payment_procedure`
--
ALTER TABLE `payment_procedure`
  ADD CONSTRAINT `R_22` FOREIGN KEY (`ID_client`) REFERENCES `client` (`ID_client`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
