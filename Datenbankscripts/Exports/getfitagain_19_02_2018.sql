-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 19. Feb 2018 um 14:39
-- Server-Version: 10.1.26-MariaDB
-- PHP-Version: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `getfitagain`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `answer`
--

CREATE TABLE `answer` (
  `AnswerID` int(11) NOT NULL,
  `FeedbackID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `QuestionID` int(11) NOT NULL,
  `answerint` int(11) NOT NULL,
  `answerbool` tinyint(4) NOT NULL,
  `answerstring` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `answer`
--

INSERT INTO `answer` (`AnswerID`, `FeedbackID`, `CustomerID`, `QuestionID`, `answerint`, `answerbool`, `answerstring`) VALUES
(34, 17, 1, 12, 2, 0, 'IGNORESTRING'),
(35, 17, 1, 13, 3, 0, 'IGNORESTRING');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `categories`
--

CREATE TABLE `categories` (
  `CategoryID` int(11) NOT NULL,
  `UnderCategoryID` int(11) NOT NULL,
  `TaskID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `category`
--

CREATE TABLE `category` (
  `CategoryID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `customer`
--

CREATE TABLE `customer` (
  `CustomerID` int(11) NOT NULL,
  `Diagnose` varchar(2000) NOT NULL,
  `SocialSecurityNumber` varchar(50) NOT NULL,
  `Insurance` varchar(80) DEFAULT NULL,
  `Password` varchar(45) DEFAULT NULL,
  `PersonID` int(11) NOT NULL,
  `DoctorID` int(11) NOT NULL,
  `TherapistID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `customer`
--

INSERT INTO `customer` (`CustomerID`, `Diagnose`, `SocialSecurityNumber`, `Insurance`, `Password`, `PersonID`, `DoctorID`, `TherapistID`) VALUES
(1, 'Etiam laoreet, libero et', '7911326368', 'Gebietskrankenkasse', NULL, 27, 1, 4),
(2, 'ipsum. Suspendisse non leo.', '9257481770', 'Gebietskrankenkasse', NULL, 28, 1, 4),
(3, 'malesuada fringilla est. Mauris', '6112299620', 'Gebietskrankenkasse', NULL, 29, 1, 4),
(4, 'dolor elit, pellentesque a,', '5020548244', 'Gebietskrankenkasse', NULL, 30, 1, 4),
(5, 'vel lectus. Cum sociis', '7531351807', 'Gebietskrankenkasse', NULL, 31, 1, 4),
(6, 'Aliquam erat volutpat. Nulla', '1811244012', 'Gebietskrankenkasse', NULL, 32, 1, 4),
(7, 'et netus et malesuada', '6737694099', 'Gebietskrankenkasse', NULL, 33, 1, 3),
(8, 'libero. Proin sed turpis', '3277739510', 'Gebietskrankenkasse', NULL, 34, 1, 3),
(9, 'amet ornare lectus justo', '0326109799', 'Gebietskrankenkasse', NULL, 35, 1, 1),
(10, 'habitant morbi tristique senectus', '7957593623', 'Gebietskrankenkasse', NULL, 36, 1, 3),
(11, 'Sed eu nibh vulputate', '1674123706', 'Gebietskrankenkasse', NULL, 37, 1, 3),
(12, 'Nulla eu neque pellentesque', '4077160771', 'Gebietskrankenkasse', NULL, 38, 1, 3),
(13, 'nec ante blandit viverra.', '7646279734', 'Gebietskrankenkasse', NULL, 39, 1, 3),
(14, 'orci tincidunt adipiscing. Mauris', '4766216791', 'Gebietskrankenkasse', NULL, 40, 1, 3),
(15, 'ridiculus mus. Aenean eget', '3087413974', 'Gebietskrankenkasse', NULL, 41, 1, 3),
(16, 'mauris sit amet lorem', '1333060073', 'Gebietskrankenkasse', NULL, 42, 1, 3),
(17, 'ut, pharetra sed, hendrerit', '6070175126', 'Gebietskrankenkasse', NULL, 43, 1, 3),
(18, 'taciti sociosqu ad litora', '1638593204', 'Gebietskrankenkasse', NULL, 44, 1, 2),
(19, 'convallis erat, eget tincidunt', '0616360001', 'Gebietskrankenkasse', NULL, 45, 1, 2),
(20, 'Aliquam rutrum lorem ac', '2160511518', 'Gebietskrankenkasse', NULL, 46, 1, 2),
(21, 'tincidunt, neque vitae semper', '6488184307', 'Gebietskrankenkasse', NULL, 47, 1, 2),
(22, 'lorem, eget mollis lectus', '6880101780', 'Gebietskrankenkasse', NULL, 48, 1, 2),
(23, 'vestibulum massa rutrum magna.', '5238384576', 'Gebietskrankenkasse', NULL, 49, 1, 1),
(24, 'interdum enim non nisi.', '3392800962', 'Gebietskrankenkasse', NULL, 50, 1, 2),
(25, 'egestas lacinia. Sed congue,', '8512828790', 'Gebietskrankenkasse', NULL, 51, 2, 2),
(26, 'feugiat tellus lorem eu', '3102705046', 'Gebietskrankenkasse', NULL, 52, 2, 1),
(27, 'Sed auctor odio a', '8956036337', 'Gebietskrankenkasse', NULL, 53, 2, 1),
(28, 'mauris sagittis placerat. Cras', '7279388707', 'Gebietskrankenkasse', NULL, 54, 2, 1),
(29, 'natoque penatibus et magnis', '7785982806', 'Gebietskrankenkasse', NULL, 55, 2, 1),
(30, 'montes, nascetur ridiculus mus.', '7104271480', 'Gebietskrankenkasse', NULL, 56, 2, 1),
(31, 'gravida sit amet, dapibus', '2138392905', 'Gebietskrankenkasse', NULL, 57, 2, 1),
(32, 'Morbi metus. Vivamus euismod', '4181968466', 'Gebietskrankenkasse', NULL, 58, 2, 1),
(33, 'volutpat nunc sit amet', '9428647341', 'Gebietskrankenkasse', NULL, 59, 2, 1),
(34, 'blandit. Nam nulla magna,', '2928921812', 'Gebietskrankenkasse', NULL, 60, 2, 1),
(35, 'ipsum. Suspendisse non leo.', '7435031189', 'Gebietskrankenkasse', NULL, 61, 2, 1),
(36, 'molestie orci tincidunt adipiscing.', '7183335913', 'Gebietskrankenkasse', NULL, 62, 2, 1),
(37, 'vel quam dignissim pharetra.', '2945842038', 'Gebietskrankenkasse', NULL, 63, 2, 1),
(38, 'Sed et libero. Proin', '8690331909', 'Gebietskrankenkasse', NULL, 64, 2, 1),
(39, 'Cras convallis convallis dolor.', '0844663030', 'Gebietskrankenkasse', NULL, 65, 2, 1),
(40, 'lectus pede et risus.', '2552119576', 'Gebietskrankenkasse', NULL, 66, 3, 5),
(41, 'magna tellus faucibus leo,', '5196295167', 'Gebietskrankenkasse', NULL, 67, 3, 5),
(42, 'Mauris vel turpis. Aliquam', '3875974572', 'Gebietskrankenkasse', NULL, 68, 3, 1),
(43, 'ut, molestie in, tempus', '7666043939', 'Gebietskrankenkasse', NULL, 69, 3, 5),
(44, 'convallis in, cursus et,', '6994165018', 'Gebietskrankenkasse', NULL, 70, 3, 5),
(45, 'eu tellus. Phasellus elit', '0554482724', 'Gebietskrankenkasse', NULL, 71, 3, 1),
(46, 'ipsum nunc id enim.', '0120578241', 'Gebietskrankenkasse', NULL, 72, 3, 1),
(47, 'nunc id enim. Curabitur', '8405614017', 'Gebietskrankenkasse', NULL, 73, 3, 1),
(48, 'quis, tristique ac, eleifend', '1893614073', 'Gebietskrankenkasse', NULL, 74, 3, 1),
(49, 'vestibulum lorem, sit amet', '3101378842', 'Gebietskrankenkasse', NULL, 75, 3, 1),
(50, 'risus odio, auctor vitae,', '7980412818', 'Gebietskrankenkasse', NULL, 76, 4, 1),
(51, 'enim consequat purus. Maecenas', '1267583647', 'Gebietskrankenkasse', NULL, 77, 4, 1),
(52, 'Pellentesque habitant morbi tristique', '2750140565', 'Gebietskrankenkasse', NULL, 78, 4, 5),
(53, 'sit amet diam eu', '7125261169', 'Gebietskrankenkasse', NULL, 79, 4, 1),
(54, 'Fusce aliquam, enim nec', '1993550718', 'Gebietskrankenkasse', NULL, 80, 4, 1),
(55, 'dis parturient montes, nascetur', '6596266250', 'Gebietskrankenkasse', NULL, 81, 4, 1),
(56, 'Phasellus elit pede, malesuada', '5566271024', 'Gebietskrankenkasse', NULL, 82, 4, 5),
(57, 'velit eget laoreet posuere,', '0601730119', 'Gebietskrankenkasse', NULL, 83, 4, 1),
(58, 'rutrum non, hendrerit id,', '8180725591', 'Gebietskrankenkasse', NULL, 84, 4, 1),
(59, 'vitae dolor. Donec fringilla.', '7145795066', 'Gebietskrankenkasse', NULL, 85, 4, 1),
(60, 'vitae odio sagittis semper.', '5078619994', 'Gebietskrankenkasse', NULL, 86, 5, 1),
(61, 'arcu. Sed eu nibh', '8364384269', 'Gebietskrankenkasse', NULL, 87, 5, 1),
(62, 'faucibus id, libero. Donec', '0312414527', 'Gebietskrankenkasse', NULL, 88, 5, 1),
(63, 'posuere cubilia Curae; Donec', '6800715616', 'Gebietskrankenkasse', NULL, 89, 5, 5),
(64, 'nibh. Phasellus nulla. Integer', '5394841679', 'Gebietskrankenkasse', NULL, 90, 5, 1),
(65, 'dignissim. Maecenas ornare egestas', '7663729259', 'Gebietskrankenkasse', NULL, 91, 5, 1),
(66, 'egestas. Fusce aliquet magna', '0814329368', 'Gebietskrankenkasse', NULL, 92, 5, 1),
(67, 'mattis ornare, lectus ante', '5154181269', 'Gebietskrankenkasse', NULL, 93, 5, 1),
(68, 'Maecenas mi felis, adipiscing', '3172525924', 'Gebietskrankenkasse', NULL, 94, 5, 1),
(69, 'velit justo nec ante.', '5184979623', 'Gebietskrankenkasse', NULL, 95, 5, 1),
(70, 'quis arcu vel quam', '0513351077', 'Gebietskrankenkasse', NULL, 96, 5, 1),
(71, 'molestie pharetra nibh. Aliquam', '7023131667', 'Gebietskrankenkasse', NULL, 97, 5, 1),
(72, 'lacus. Cras interdum. Nunc', '2309417304', 'Gebietskrankenkasse', NULL, 98, 5, 1),
(73, 'magna. Nam ligula elit,', '1516101878', 'Gebietskrankenkasse', NULL, 99, 5, 2),
(74, 'semper cursus. Integer mollis.', '9574359256', 'Gebietskrankenkasse', NULL, 100, 5, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `difficulty`
--

CREATE TABLE `difficulty` (
  `DifficultyID` int(11) NOT NULL,
  `Level` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `difficulty`
--

INSERT INTO `difficulty` (`DifficultyID`, `Level`) VALUES
(1, 'schwer');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `doctor`
--

CREATE TABLE `doctor` (
  `DoctorID` int(11) NOT NULL,
  `areaofexpertise` varchar(60) DEFAULT NULL,
  `PersonID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `doctor`
--

INSERT INTO `doctor` (`DoctorID`, `areaofexpertise`, `PersonID`) VALUES
(1, 'Allgemeinmedizin', 11),
(2, 'Allgemeinmedizin', 12),
(3, 'Anästhologie', 13),
(4, 'Anästhologie', 14),
(5, 'Anatomie', 15),
(6, 'Anatomie', 16),
(7, 'Arbeitsmedizin', 18),
(8, 'Arbeitsmedizin', 19),
(9, 'Arbeitsmedizin', 20),
(10, 'Arbeitsmedizin', 21),
(11, 'Allistair J. Moss', 22),
(12, 'Allgemeinmedizin', 23),
(13, 'Allgemeinmedizin', 24),
(14, 'Allgemeinmedizin', 25),
(15, 'Allgemeinmedizin', 26);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `feedback`
--

CREATE TABLE `feedback` (
  `FeedbackID` int(11) NOT NULL,
  `name` varchar(50) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

--
-- Daten für Tabelle `feedback`
--

INSERT INTO `feedback` (`FeedbackID`, `name`) VALUES
(13, 'Neues Feedback'),
(14, 'Weiteres Feedback'),
(16, 'Noch ein anderes Feedback dazu'),
(17, 'errorfeedback');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `feedbackdonebyuser`
--

CREATE TABLE `feedbackdonebyuser` (
  `CustomerID` int(11) NOT NULL,
  `FeedbackID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `feedbackdonebyuser`
--

INSERT INTO `feedbackdonebyuser` (`CustomerID`, `FeedbackID`) VALUES
(1, 17);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `feedbackquestions`
--

CREATE TABLE `feedbackquestions` (
  `FeedbackID` int(11) NOT NULL,
  `QuestionID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `feedbackquestions`
--

INSERT INTO `feedbackquestions` (`FeedbackID`, `QuestionID`) VALUES
(13, 12),
(13, 13),
(14, 12),
(14, 14),
(17, 12),
(17, 13),
(13, 14),
(16, 12);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `person`
--

CREATE TABLE `person` (
  `PersonID` int(11) NOT NULL,
  `prename` varchar(50) NOT NULL,
  `surname` varchar(50) NOT NULL,
  `birthdate` date NOT NULL,
  `street` varchar(100) NOT NULL,
  `postcode` int(11) NOT NULL,
  `Town` varchar(50) NOT NULL,
  `Phonenumber` varchar(30) NOT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `sex` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `person`
--

INSERT INTO `person` (`PersonID`, `prename`, `surname`, `birthdate`, `street`, `postcode`, `Town`, `Phonenumber`, `Email`, `sex`) VALUES
(1, 'Beatrice', 'Alford', '1990-11-14', '4564 Urna. Road', 9261, 'Inverness', '06642974446', 'sollicitudin.adipiscing.ligula@aliquam.ca', 'w'),
(2, 'Isadora', 'Graham', '1992-11-26', 'P.O. Box 723, 9832 Sem Road', 2724, 'Chimbarongo', '06646154567', 'nec.leo.Morbi@ligulaNullamfeugiat.co.uk', 'w'),
(3, 'Michelle', 'Curtis', '1988-06-30', '204 Lectus Road', 2739, 'Hagen', '06649677572', 'accumsan.neque@congue.org', 'w'),
(4, 'Breanna', 'Hahn', '1988-07-18', '5939 Nibh St.', 6790, 'Blois', '06644263663', 'Nam.consequat@semsempererat.com', 'w'),
(5, 'Neve', 'Edwards', '1994-03-22', '509-5702 Ligula. Rd.', 7602, 'Daly', '06641430278', 'fermentum.metus.Aenean@risusatfringilla.net', 'w'),
(6, 'Olivia', 'Sherman', '1989-05-10', '2880 Facilisis Av.', 6794, 'Birmingham', '06643752765', 'dis.parturient@ultricesiaculisodio.ca', 'w'),
(7, 'Gemma', 'Brewer', '1995-11-18', '4027 Vulputate Ave', 6966, 'Germersheim', '06649288286', 'vitae.mauris.sit@purusNullamscelerisque.com', 'w'),
(8, 'Palmer', 'Palmer', '1995-11-14', 'Ap #283-6783 Lacus Ave', 2330, 'Białystok', '06646356315', 'libero@ridiculusmus.net', 'w'),
(9, 'Justina', 'Bray', '1997-09-26', '373-6812 Nunc Street', 6663, 'Olmen', '06642469819', 'magna.et.ipsum@nibhenim.ca', 'w'),
(10, 'Blaine', 'Forbes', '1990-05-17', '1869 Magna. Rd.', 4930, 'Naarden', '06641252227', 'vulputate@Nullasemper.edu', 'w'),
(11, 'Ulric', 'Kelly', '1998-02-28', 'Ap #406-7412 Ultricies Avenue', 8691, 'Marentino', '06642388662', 'laoreet.libero.et@tinciduntorci.net', 'w'),
(12, 'Jena', 'Morris', '1999-03-18', '8979 Diam. Avenue', 4826, 'Goulburn', '06642356047', 'mus@Maurisvestibulum.net', 'w'),
(13, 'Amaya', 'Goodwin', '1997-05-03', '581-7760 Duis Av.', 3761, 'Piegaro', '06649287936', 'Nunc.mauris.Morbi@ultrices.org', 'w'),
(14, 'Anthony', 'Livingston', '1988-12-22', '928-2504 Luctus Ave', 2753, 'Valcourt', '06644798433', 'vulputate.posuere@Donec.co.uk', 'w'),
(15, 'Lacota', 'Diaz', '1990-06-15', '9757 Eget St.', 9165, 'Algeciras', '06642184532', 'sollicitudin@suscipitestac.org', 'w'),
(16, 'Penelope', 'Newman', '1992-06-23', '6093 Neque. Road', 5569, 'Gatineau', '06641555896', 'eget.lacus@tortorIntegeraliquam.ca', 'w'),
(17, 'Galena', 'Mason', '1989-10-16', '363 Interdum. Ave', 6660, 'Montigny-le-Tilleul', '06648815418', 'Morbi@euaugue.com', 'w'),
(18, 'Clarke', 'Velez', '1989-02-25', 'P.O. Box 797, 6440 Phasellus Rd.', 1652, 'Glovertown', '06642906543', 'Cras@nuncsed.edu', 'w'),
(19, 'Melyssa', 'Murray', '1994-02-24', 'P.O. Box 522, 1343 Turpis St.', 9223, 'Henderson', '06640593927', 'aliquet.magna@ullamcorper.com', 'w'),
(20, 'Donovan', 'Ryan', '1997-06-24', 'P.O. Box 124, 4088 Lorem Street', 1818, 'Wardha', '06648802078', 'condimentum@purusMaecenaslibero.net', 'w'),
(21, 'Kamal', 'Graham', '1994-09-17', 'Ap #249-9883 Nibh. St.', 8990, 'Pace del Mela', '06645011536', 'egestas@Suspendissesagittis.com', 'w'),
(22, 'Courtney', 'Mason', '1992-07-04', '9921 Elementum Rd.', 4706, 'Miami', '06646478941', 'euismod.enim@nectempusmauris.edu', 'w'),
(23, 'Xena', 'Bates', '1996-04-02', 'Ap #287-342 Sed Avenue', 9311, 'Virton', '06641816865', 'Nunc.ut@pede.co.uk', 'w'),
(24, 'Genevieve', 'Stanton', '1991-03-18', 'Ap #751-8123 Dolor Rd.', 8725, 'Torquay', '06647653657', 'gravida.Aliquam.tincidunt@id.com', 'w'),
(25, 'Uriel', 'Sandoval', '1988-04-03', '757-6388 Malesuada Street', 8082, 'Coalhurst', '06644962615', 'ligula@id.ca', 'w'),
(26, 'Jasper', 'Salas', '1997-08-25', 'P.O. Box 615, 3860 Elementum, Ave', 4535, 'Siedlce', '06648506777', 'vestibulum@risus.org', 'w'),
(27, 'Ora', 'Cooley', '1988-04-16', 'P.O. Box 535, 1593 Accumsan Street', 2885, 'Mödling', '06648863801', 'ipsum.dolor@nibhvulputatemauris.org', 'w'),
(28, 'James', 'Alexander', '1994-09-03', '3982 Tincidunt St.', 2425, 'Torres del Paine', '06644821310', 'bibendum.Donec.felis@eleifend.net', 'w'),
(29, 'Knox', 'Holland', '1992-09-08', '339-5331 Sed Av.', 3829, 'Doel', '06645110992', 'id.enim.Curabitur@veliteusem.edu', 'w'),
(30, 'Hashim', 'Guzman', '1993-06-26', 'Ap #696-1503 Id, Road', 5954, 'Monte Patria', '06641420695', 'tempor.erat.neque@dolorNullasemper.net', 'w'),
(31, 'Zenaida', 'Lowery', '1996-10-25', '6072 Urna, Rd.', 8356, 'Philadelphia', '06645672733', 'sit.amet@pharetra.org', 'w'),
(32, 'Kalia', 'Lamb', '1995-05-20', 'Ap #203-4784 Vitae Road', 7134, 'Parla', '06645164651', 'mauris.sapien.cursus@temporeratneque.net', 'w'),
(33, 'Hilda', 'Baird', '1991-03-04', 'Ap #797-1174 Dictum Rd.', 7106, 'Whitehorse', '06645702213', 'varius.et.euismod@et.com', 'w'),
(34, 'Len', 'Williamson', '1988-04-12', '3009 Et Ave', 4296, 'Scunthorpe', '06646862831', 'Nullam.ut.nisi@mollisvitaeposuere.ca', 'w'),
(35, 'Pascale', 'Jones', '1999-07-05', '204-6934 Laoreet Av.', 9391, 'Noicattaro', '06647564632', 'auctor@elitpretiumet.net', 'w'),
(36, 'Jerry', 'Henson', '1998-09-07', '700-5765 Eu Ave', 5707, 'Haverhill', '06647288350', 'hendrerit@facilisismagnatellus.co.uk', 'w'),
(37, 'Alea', 'Gay', '1994-05-02', '2566 Ullamcorper, St.', 7627, 'Market Drayton', '06647416686', 'ut@Donecegestas.net', 'w'),
(38, 'Amery', 'Farley', '1988-09-09', 'Ap #195-3341 Mauris Avenue', 8387, 'Palmiano', '06649507509', 'ipsum.leo.elementum@molestie.edu', 'w'),
(39, 'Luke', 'Valencia', '1994-07-02', '234-3581 Sed, Avenue', 9334, 'Tuscaloosa', '06644753504', 'neque.sed@duinectempus.org', 'w'),
(40, 'Christian', 'Rodriquez', '1994-09-06', '3403 Duis Avenue', 7567, 'Gouvy', '06643406549', 'sollicitudin.orci@fringilla.co.uk', 'w'),
(41, 'Charde', 'Pratt', '1996-04-06', '817-7051 Arcu Avenue', 8938, 'Püttlingen', '06648542248', 'blandit.congue@sitametluctus.edu', 'w'),
(42, 'Kirsten', 'Nixon', '1989-01-16', 'Ap #233-3332 Eu St.', 3268, 'Swadlincote', '06647981693', 'in.molestie@intempuseu.ca', 'w'),
(43, 'Brandon', 'Mcdaniel', '1994-06-22', '4242 In Rd.', 8228, 'Meix-le-Tige', '06640629000', 'Suspendisse.eleifend@VivamusrhoncusDonec.edu', 'w'),
(44, 'Chava', 'Dunlap', '1997-01-07', 'P.O. Box 722, 5941 Orci, Rd.', 6428, 'Camponogara', '06642210513', 'egestas.lacinia@ornare.ca', 'w'),
(45, 'Beau', 'Knight', '1996-05-18', 'Ap #832-8831 Aliquam Av.', 1027, 'Murdochville', '06647500588', 'pellentesque.eget@neque.com', 'w'),
(46, 'Drew', 'Osborne', '1991-05-25', 'Ap #674-8501 Cum St.', 9238, 'Edam', '06640416233', 'cursus@Nullafacilisis.com', 'w'),
(47, 'Dalton', 'Powers', '1998-01-30', 'Ap #951-1012 Ullamcorper, St.', 5942, 'Barahanagar', '06649080701', 'Vestibulum.ante@lorem.com', 'w'),
(48, 'Jessamine', 'Mayo', '1993-01-03', '661-8662 Mollis St.', 8608, 'Thalassery', '06640878885', 'sit.amet@infaucibus.net', 'w'),
(49, 'Kasimir', 'Walters', '1996-08-15', '176-6044 Aliquam Av.', 1047, 'Certaldo', '06649234380', 'Vivamus@diam.com', 'w'),
(50, 'Nomlanga', 'Shepherd', '1992-10-08', '1699 Tortor Avenue', 2291, 'Sosnowiec', '06643055575', 'nunc.interdum.feugiat@eros.net', 'm'),
(51, 'Quin', 'Levine', '1993-05-31', 'Ap #493-3490 Eu Road', 5907, 'Sioux City', '06643741428', 'elit.Etiam@aceleifendvitae.co.uk', 'm'),
(52, 'Doris', 'Brewer', '1995-06-04', '7994 Sit Street', 5532, 'Warangal', '06648916114', 'vulputate@Morbi.ca', 'm'),
(53, 'Farrah', 'Sears', '1989-09-03', 'Ap #225-5192 Cursus. St.', 8232, 'Anápolis', '06647253753', 'rhoncus.Proin@ipsum.org', 'm'),
(54, 'Jacob', 'Raymond', '1994-05-22', 'P.O. Box 434, 554 Euismod Road', 4879, '100 Mile House', '06645267287', 'lorem.vitae@adipiscingelitAliquam.co.uk', 'm'),
(55, 'Joshua', 'Manning', '1988-07-26', 'Ap #737-4470 Mi. Rd.', 4584, 'Mollem', '06647946020', 'ipsum@penatibusetmagnis.edu', 'm'),
(56, 'Hilel', 'Heath', '1988-03-27', 'Ap #665-7914 Erat, Ave', 1282, 'Curacautín', '06648692101', 'augue.ac@Cumsociis.org', 'm'),
(57, 'Macy', 'Dalton', '1994-04-16', '172-8145 Tellus Av.', 7766, 'Greenlaw', '06645436696', 'quam.a.felis@necmollis.co.uk', 'm'),
(58, 'Bruno', 'Williamson', '1988-01-24', 'P.O. Box 816, 937 Aenean Rd.', 6970, 'Fraser-Fort George', '06641581559', 'Quisque.varius.Nam@lorem.co.uk', 'm'),
(59, 'Nigel', 'Scott', '1989-08-01', 'P.O. Box 150, 6720 Adipiscing Avenue', 9379, 'Sint-Agatha-Berchem', '06642338674', 'a.purus@disparturient.ca', 'm'),
(60, 'Nigel', 'Snyder', '1998-05-18', '724-1509 Donec Avenue', 3757, 'Rocca d\'Arazzo', '06645046100', 'semper@eratvitaerisus.org', 'm'),
(61, 'Britanni', 'Lucas', '1996-04-17', 'P.O. Box 176, 7390 Curabitur Avenue', 3479, 'Mérignac', '06645402134', 'orci.Phasellus@torquentper.edu', 'm'),
(62, 'Gregory', 'Rhodes', '1997-09-16', 'P.O. Box 470, 9830 Auctor, St.', 1203, 'Fort Providence', '06649560584', 'interdum.Sed@eu.co.uk', 'm'),
(63, 'Charde', 'Barrera', '1996-08-27', 'P.O. Box 457, 9795 Egestas. Ave', 3442, 'Kilmarnock', '06643201488', 'erat.vitae.risus@Curabiturutodio.net', 'm'),
(64, 'Quin', 'Wilkins', '1998-11-13', '197-4186 Duis St.', 2432, 'Plymouth', '06641138983', 'Morbi@risus.edu', 'm'),
(65, 'Damian', 'Wynn', '1988-04-18', '8542 Sed Road', 2167, 'Hampstead', '06641539887', 'risus.at.fringilla@luctuset.com', 'm'),
(66, 'Hollee', 'Conway', '1997-08-23', '3071 Ornare St.', 9705, 'Springfield', '06640313342', 'in.dolor.Fusce@orciluctus.org', 'm'),
(67, 'Roary', 'Alvarado', '1988-10-10', '3183 Donec Street', 3958, 'Ipswich', '06642633737', 'ipsum@senectusetnetus.edu', 'm'),
(68, 'Ivan', 'Franco', '1989-05-27', 'Ap #361-1725 Ullamcorper Ave', 3164, 'Saint-Denis', '06640509382', 'ornare.elit.elit@inaliquetlobortis.org', 'm'),
(69, 'Hedy', 'Avery', '1990-06-23', 'P.O. Box 584, 705 Orci. Street', 4719, 'Shrewsbury', '06642062805', 'hendrerit@est.edu', 'm'),
(70, 'Selma', 'Carr', '1997-03-30', 'P.O. Box 158, 3534 Nunc Ave', 6378, 'Châlons-en-Champagne', '06649185068', 'enim@nonhendrerit.co.uk', 'm'),
(71, 'Jordan', 'Bowers', '1994-06-15', 'P.O. Box 207, 1791 In Avenue', 6802, 'Coihueco', '06643859103', 'eu.dolor.egestas@primisin.net', 'm'),
(72, 'Nero', 'Weber', '1999-03-03', '476-799 Blandit Rd.', 7391, 'Andacollo', '06644662660', 'dui@Nullamnisl.org', 'm'),
(73, 'Rooney', 'Knapp', '1999-07-15', '1307 Amet St.', 9982, 'Buzet', '06647275227', 'semper.erat.in@vulputateveliteu.net', 'm'),
(74, 'Gil', 'Lynn', '1997-11-05', '609-2619 Et, St.', 7734, 'Roma', '06642325117', 'ac.mattis.velit@euismodurna.ca', 'm'),
(75, 'Arsenio', 'Mcguire', '1991-05-30', 'P.O. Box 484, 4520 Vel, Road', 4438, 'Coaldale', '06642452157', 'lacus.Quisque@inconsequatenim.com', 'm'),
(76, 'Drake', 'Moon', '1993-03-24', '567-6408 Vitae St.', 5897, 'Mundare', '06642501612', 'amet@molestiesodalesMauris.co.uk', 'm'),
(77, 'Xenos', 'York', '1988-10-11', '334-2808 Consequat Avenue', 1201, 'Westerlo', '06640215061', 'rutrum.eu.ultrices@vulputateeuodio.com', 'm'),
(78, 'Vivian', 'Daugherty', '1991-04-02', 'Ap #997-4854 Ac Rd.', 2759, 'Huasco', '06648947657', 'metus.facilisis.lorem@risusDonecegestas.org', 'm'),
(79, 'Indira', 'Gordon', '1996-04-11', '980-5689 Fusce St.', 4362, 'Funtua', '06647781606', 'pretium@Aliquam.edu', 'm'),
(80, 'Uta', 'Guerra', '1992-11-15', '483-9607 Vestibulum Ave', 4342, 'Hollogne-sur-Geer', '06647387986', 'cubilia.Curae@risus.net', 'm'),
(81, 'Amethyst', 'Alston', '1992-11-08', 'Ap #953-7975 Nec Rd.', 9246, 'Waren', '06646146717', 'cubilia.Curae.Phasellus@gravidasagittis.ca', 'm'),
(82, 'Travis', 'Flynn', '1997-10-30', 'Ap #244-143 Cras Avenue', 5256, 'Fontaine-Valmont', '06643470423', 'inceptos.hymenaeos.Mauris@nislsemconsequat.co.uk', 'm'),
(83, 'Ishmael', 'Wyatt', '1991-01-04', 'P.O. Box 853, 557 Vitae, Rd.', 7175, 'Valpelline', '06645854248', 'sit.amet.luctus@pharetrased.edu', 'm'),
(84, 'Raja', 'Saunders', '1995-01-16', 'P.O. Box 989, 7422 Pellentesque Rd.', 3722, 'Kitscoty', '06641974069', 'euismod.mauris@ipsumnonarcu.net', 'm'),
(85, 'Nash', 'Woodard', '1992-06-11', '3346 Risus Rd.', 3482, 'Villa Alegre', '06646268574', 'mus.Proin@aliquet.org', 'm'),
(86, 'Xavier', 'Bishop', '1995-08-14', 'Ap #829-9808 Rutrum Road', 8213, 'Lloydminster', '06644218688', 'adipiscing@nonluctus.co.uk', 'm'),
(87, 'Phoebe', 'Barr', '1995-11-19', '2730 Ac Road', 8221, 'Limbach-Oberfrohna', '06645062420', 'luctus.aliquet@sapiencursusin.com', 'm'),
(88, 'Sasha', 'Franklin', '1993-06-14', '2213 Duis Avenue', 9115, 'Ambala', '06641980372', 'Integer.id.magna@odio.net', 'm'),
(89, 'Nerea', 'Wade', '1991-05-04', 'P.O. Box 444, 346 Nisi St.', 3957, 'Maglie', '06648733322', 'eu.placerat@nuncnullavulputate.edu', 'm'),
(90, 'Vaughan', 'Stanton', '1989-12-15', 'Ap #459-4872 Rutrum Av.', 5922, 'HŽlŽcine', '06646123904', 'neque@nonjustoProin.ca', 'm'),
(91, 'Hope', 'Santana', '1992-01-06', '8988 Odio. Rd.', 1357, 'Maria', '06640009629', 'dui.augue.eu@natoquepenatibus.co.uk', 'm'),
(92, 'Gwendolyn', 'Sweeney', '1990-08-15', '4226 Magna. St.', 3497, 'Montague', '06643597143', 'dictum.placerat.augue@rutrumnonhendrerit.net', 'm'),
(93, 'Simone', 'Decker', '1993-01-08', 'P.O. Box 583, 5168 Cras Rd.', 7914, 'Gresham', '06640510327', 'pharetra.ut@blandit.edu', 'm'),
(94, 'Dana', 'Jimenez', '1997-07-09', 'P.O. Box 953, 9763 Ligula. Avenue', 5240, 'Coinco', '06644468049', 'eget.nisi.dictum@Phasellusdapibus.net', 'm'),
(95, 'Jayme', 'Mccarthy', '1996-06-30', '4105 Augue Street', 9401, 'Lanaken', '06645180523', 'neque.Morbi.quis@sociisnatoque.net', 'm'),
(96, 'Idona', 'Ramirez', '1994-08-22', '185-4461 Mauris St.', 8826, 'Wibrin', '06643270816', 'Lorem@odioPhasellusat.org', 'm'),
(97, 'Chaney', 'Barry', '1999-02-23', 'P.O. Box 114, 2857 Molestie. Ave', 8902, 'Huelva', '06644333872', 'elit.Aliquam@Namconsequatdolor.org', 'm'),
(98, 'Fitzgerald', 'Love', '1996-05-05', 'P.O. Box 203, 4133 Eu Rd.', 6402, 'Heist-op-den-Berg', '06643710327', 'dolor.nonummy.ac@dolor.org', 'm'),
(99, 'Hayfa', 'Dale', '1999-03-27', 'Ap #569-6430 Tincidunt. Rd.', 5411, 'Pont-de-Loup', '06646398354', 'placerat@egetmollis.net', 'm'),
(100, 'Cody', 'Travis', '1989-07-11', '345-6481 Dictum. Av.', 5256, 'Bridlington', '06641649172', 'egestas.hendrerit@dignissim.com', 'm');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `picture`
--

CREATE TABLE `picture` (
  `PictureID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `order` int(11) NOT NULL,
  `pic` mediumblob NOT NULL,
  `group` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `picture`
--

INSERT INTO `picture` (`PictureID`, `Name`, `order`, `pic`, `group`) VALUES
(1, 'testpic1', 1, 0x52306c474f446c68576746614166634141414141414141414d7741415a6741416d5141417a4141412f774172414141724d7741725a6741726d5141727a4141722f774256414142564d7742565a6742566d5142567a4142562f774341414143414d7743415a6743416d5143417a4143412f774371414143714d7743715a6743716d5143717a4143712f774456414144564d7744565a6744566d5144567a4144562f77442f4141442f4d77442f5a67442f6d51442f7a41442f2f7a4d4141444d414d7a4d415a6a4d416d544d417a444d412f7a4d7241444d724d7a4d725a6a4d726d544d727a444d722f7a4e5641444e564d7a4e565a6a4e566d544e567a444e562f7a4f4141444f414d7a4f415a6a4f416d544f417a444f412f7a4f7141444f714d7a4f715a6a4f716d544f717a444f712f7a5056414450564d7a50565a6a50566d5450567a4450562f7a502f4144502f4d7a502f5a6a502f6d54502f7a44502f2f325941414759414d3259415a6d59416d5759417a4759412f325972414759724d3259725a6d59726d5759727a4759722f325a5641475a564d325a565a6d5a566d575a567a475a562f326141414761414d3261415a6d61416d5761417a4761412f326171414761714d3261715a6d61716d5761717a4761712f326256414762564d3262565a6d62566d5762567a4762562f32622f4147622f4d32622f5a6d622f6d57622f7a47622f2f356b41414a6b414d356b415a706b416d5a6b417a4a6b412f356b72414a6b724d356b725a706b726d5a6b727a4a6b722f356c56414a6c564d356c565a706c566d5a6c567a4a6c562f356d41414a6d414d356d415a706d416d5a6d417a4a6d412f356d71414a6d714d356d715a706d716d5a6d717a4a6d712f356e56414a6e564d356e565a706e566d5a6e567a4a6e562f356e2f414a6e2f4d356e2f5a706e2f6d5a6e2f7a4a6e2f2f387741414d77414d3877415a7377416d6377417a4d77412f387772414d77724d3877725a7377726d6377727a4d77722f387856414d78564d3878565a7378566d6378567a4d78562f387941414d79414d3879415a7379416d6379417a4d79412f387971414d79714d3879715a7379716d6379717a4d79712f387a56414d7a564d387a565a737a566d637a567a4d7a562f387a2f414d7a2f4d387a2f5a737a2f6d637a2f7a4d7a2f2f2f3841415038414d2f38415a7638416d6638417a5038412f2f3872415038724d2f38725a7638726d6638727a5038722f2f3956415039564d2f39565a7639566d6639567a5039562f2f2b4141502b414d2f2b415a762b416d662b417a502b412f2f2b7141502b714d2f2b715a762b716d662b717a502b712f2f2f5641502f564d2f2f565a762f566d662f567a502f562f2f2f2f41502f2f4d2f2f2f5a762f2f6d662f2f7a502f2f2f7741414141414141414141414141414143483542414541415077414c4141414141426141566f4241416a2f41414549484569776f4d474443424d71584d69776f634f4845434e4b6e4569786f73574c47444e71334d69786f38655049454f4b48456d79704d6d544b464f71584d6d79706375584d47504b6e456d7a707332624f485071334d6d7a70382b6651494d4b48557130714e476a534a4d715863713071644f6e554b4e4b6e55713171745772574a6d71324c683161396176594664324a656731724e6d7a4f565559514d753237633278487375366e5574586f516f5963726e5733637558724971386576734b626e74587931323848662b754863773472416f746876486942577a784c67444b6a544e50784679546b4f472f6f414e6f6649785973326d71577262387651786a42563474462f397177577541382b6e625252392f6a6948774c77777157716a41674c696139657a69754a4d2f745031534e2b4b2f4b3353443857783459646672685a6b7233393451726c6756697a786a2f3463526e424231357468582f7834756d72743768747052626c576b4349774b313364425130364e334b44582f336a465149563937785734334544656f625349496e35387470747556547a5758322b5856586a5a587a48494270754248425a55466d62446f51545a6458674a5238566a77686d3252576b556a6e586668617370456c2b4870736e316f5955556d6b516168595a464e7873684b774b6e32332b67465a6e666b655452614f434d5a4a554567794972774367675a4673415a3569566b486c323457554264495658644638436b4a7153536e6f56596b746830494b676a35425a4b52344d565a696e4343474b46484b636279716f4e74754a416d6c42434a6d41496f6a6a535672513875466a6841436e69433637364b4a4c4c66765249716d6b632b376e703655685870706a68586b78475368576d486d314745706279466a51666f7251736f366b757177714a353254306d6a6932526255655762656966736c434d435a5777336e366164586c6558727271774e4b70494b69676848316d2b3036454a4c70616e4f2b5377687273775a376157326d67635a665a4152464b563376633432476242384854615a6279655278324a71564578726e713372534173724c6255304f363231744378433561566e44726457694b7570414d5a73782f2b5253786541346f59343745692f56626372496368535234556957717741426a6e534b6c49746e65546f5573367a715534624847534679476a6d6677507852706f57594368797073474f2b566359444f4f69484e4a6a76463047735a39775a726d74724d374b4f696b357757424d697a63693779636e7077512b702f427857697a794d737867315959516e6c4f444645436276526b5733723541456949304f665853327977357536676a6153317a627046616d334d477147355a2b4d6e326d7374556e39587031553347395a70417252563636654261374e4c78304c71517736717a7a6849794853472f785344346b666b422f686e4e59464268414d7435737758596a5248394b70434d5932355671476546414566726238436f73777374696a746144754e6d5732757046765370707069584b676a585661354a6468347a52376f32314732334532744d4a36716f65337830304f762f42423074665850616d61577349303632516d31756d7a6c626873454c2f3558564f5936366d55517132446b6b7374614c3754595670546172697a6f6536784b4d4f6d7a54567a59744a622b3978624f30474a475079444d696769786f4d686b5358315a736778345058595a3844696d4d595769426c30705249515a6938314e343572514f637042444865525968396f557353414135733978734c4c57676978565169683536556d52595a454372564b3841386b6c61776f35556539535138463256516b47596f4f5673314946444b495a45526873773930694b4357724f6b554c53483769566e444145497864554777676b476b5a6553777a51367030785879434f676a4b554f61306837526d5a6e5471332f57576d436f51656b7764367842687179693177587770496e2b702b6c71577242655a576752444634734148416c4e42527652645a456f317a4657516b59467341714e2f77732b52524b515a7951566e41324b6a565678624e3339676847395a755676455a44495836796b4741626358637074644e6f464a4452454944484a384a4250325570745a756d66694179484e684873696e446b56544a625361714573317456484f503471462b6d36704f44624a7369614f576e4d4e42706562674c4273525777444b766441755755414564585062474e372b385569472b2b6b307670566979635334436843414d787633557763354741614e5272344d6e4c563633516f71397a5a346a496b51776f43596a583755536d3748636c466f5152443449636770777671485a68684a5a4f5152744a5470336b645879434d48486b70557762627459527a7a5763517734656c53457734776a4a34746d785a49784d3278416d7067304230517878477a4e6b4144647958384d4f71676143715132414a7462623267327249585262574c5048436551384a5532594d416a48762f78674163383141454d4554594b704d416f52314e6278556c493659746c6e716e556b367a49737173533679377469616c5475476d6d72314b6f707746543130345041356531694b5a7965327762496651313146716b54614d6168556454347a472f2b686e756668686478314e31346379336861462f6a336d574652315851474b4a39536a61334b6d465a6e6d7958676d55697741415178684f74717638314761622b61466f716c4a6f7a454b304c716e71694564486d526f5031386d755652364c4b6d446a794e56465049342b6f6c305156386b44426c3535434b615072516e355841536a595131304944517a55796b3539646c6263736d6850557456783271527546315131316b5a62573038546874486373516a475050454c7150514273656d636e49642b53765a394c4b714345676b537a4a704a59686b48716e49344e4a6b6a4a7a6972475136613177453956527161686e2f793532736868674455444e5669584f5734684263432f4a717437587241455a72573365506a733075764978714b687948475978427368476c316a72535a5449304b6931456f6d575153613649375874662b58706f4d5a556a6b71386732464159674347515a35335a377369694347385530336d4c4b4b477a386870686452534e4673466f62586b6239536848555665715249376a67764a494d64784b5a6a6139455a68685572794c4c59386f4d76566c3856764f6d7557316c4457526b7431564a4b5447496e574a79304e697139636436554f706b6d5530745a77304d76316531395134306739326a4a4b6468704f4d563133636362464c4445397242765369346151594e6a4549686e4547316b676369706b6c4e7273686b63776334427a446d47594443634d6c4b46325955745a7349504e4b316e3457744d53357a6d2b6a6343527037444a366a324e4d393865474b364a472f343238446e6e73596847477468534b4a53676f4c774567456f71346a477245654f6d592b425a7742355878515a46626e4f63494a41614c43494e6d776444625274396e506d574c57355730774c6135336c4558534630484a39486d4b43753261714f5a5a4e7a732f6972684f4d4c375757346a385638474a7162714141674143617850733358794f556353464b79797a4574306b4f76624a35577959506b4a6b5349554630417634793573644e3446724555596a4e6e4e446d3230304776724242766f2b516b326a736359356a4673537a433872476a4c415853755a592b45355947502b59737a7a354778516666412f3179754d4a64705a63442b4d76466e385764466561494672656f553546336341783771686d4f3732656b6f516e756a646653724c6c4d3975746431364774467955565675594844587742317154526874546c4d47706e496676574b3534346b6b583367752f3851474d4375546d2f797a52333956444a4a4a526e57726b4d62753275684e6f303374574f424a6b645532546e4d6a51344d4d766a4248615741644b357a2b52657a6170664a32796b3758495379426a41454e686557626471566b476c564e6b6b503442336e71537038484c5738732f737a2f547257326f35314d4d456d6a374336705a77613374494c7478494654595932644e6e4d78795374784b306c697a6f66636656454b597747695547646e6c554938797a374c7656363358556268565259463633647a634b66737a62714b4d5237585045686a53504c494a4f2f5167585164376445462f5368626679584d424c6e4e6b504d4e33664b73707a6958497a4a636b6e354d696c675541566734413049786d367a497739493958726e42317553556735363556473452313536646c647573796a36306e664c3969333574536c3955332b5942694d4752794577316c6e2b6756502f4e4c4e5a6e4f5564627755655641414149664d733961494c333142306979425644575a3739354255534d56553555412f494551764a68647265775a4372524e4352705a5236344137654e51734d5168662f5a55512b7965434f754a692f7a5975566a4e514e704e66705845592b705a6c36784d7939654a7148325134744642456662567271715652674b637151554d4c577a6468626c512f5552644d725156654e5267766e31646d6c4e4576567467635a755572415a4e6c772f4638786359614d6751614674497275674d657678637253335237496853453552424336675a31384341507568642b3145574548305342564c563752765a75496b514c594b4171486451614d345a6d4147426d55774e6367636752345651737233676a48374959572f68494c3951627452456876524d747a314d32684d42343648512f30594f4d554c6468742f647849414e6f496752434a7864625664484468463433534c524647325068584a666e514c506f456d396e475958596334306b55415757597a577a5a6671444c786a444e69473056426f47522f4d45595275326459683364655377434e55434f2b555659522f6a4b4e5746626e7846517170694f435a6a55474d524a6374304932442f394930716753654b6d474f575655734f355264616b43457149446c2b636b6c2b386f6e31456f714846343367395646464a6e5747347a45556430796e5258584f416b63677477744a396a7132643364665a5641414d3365396b544f79364a415930575a38776c2f485957334946575a2b67697558736b51424a455370496b4b487033687742485865705763694e4745666c47426d4d796e73524a496642464a764a412b753153695341674e687148786b784a504f4a6c2b67746c4d4535467974474845346b6964306f6a2f5042454353516734667332364d353045673556476339487272644873376d44693045495337706e676264586a727441735a56564968737768717358434f31553156614a596e63554d563430324d794473384e564f396b59726551445965464375674748364a5130775743465872384870464e44754a453451675a4746777846654d46343069744a55512f375a4361594b4b6e6756337855655a4d3546696e504a576c45557338795575634e4575506b5a78734c4e67345563303633434a36785a3749745252335864554852534e3748512f6949642b665055384c6e6c5572624a58385841504c756b736a716d4e743568323278534376716b533761457542645a38384a556647676b2b766767414b794b4169674e7939424a4365545a4d652b594e55356d6171666d4472594e31305a4f636c7a684d67356c3772594b64494a56754c726b4f6b4c4f626451654337646b534b6c424b6a384570686d45442b37475a795157666e515961706a6544534e4e6a6d45672f6366513873784f50473356553943684864646b786a44632f487652712f45695045485a65575564424d564162776a6b516f6d452b6c704632615a65684a49453542544f69764f553261376c4651526b7756724d43314a4d366e6f6b78734b4b45496451734a316d4a54662b6c69542f49547173704b59615457726f6e68486a6c6c486a466137585a5157597a47647734663175525145724b4567545562584b3648697a4462562f57636b4670567065786b525254434d3243674253315244437065455459585642576f444b365648376d6c422b55626b3556716552706c3269616837456d6d7073466175414362563134702f4a42514a69794b3843684c6d4767434e6f477143314858373653504f5a684c3738585a3744446d676c6d5a456f346e716d56564d4877656e4b6f71556e345a346d545771356a6a473659626f2b794349707a6e70594659775a674878657048706848716961784e5170464868674a634e58454d74706d6172507865436b326e7749525079536b4336354158556a7a6b576d6f4470666f63613279596361675861736c52782f6e4c42385a4e4b394750345151722f5044565062574d594f554d426e70497367794d44766d5974622f53684a7668344c485a574d45457a57505a36716c424b4b5345565a41744864694d3450326370314f5a5966397945342f6d4a71763254486651436b4e39673250346b4671557a5a363255462f524578794a7059572b692f3453526f54496842537337416c555843416b7a6d3870566c42715642764d3366356754766538444e4352413471537a61707456547a35707767745134394b4b6c5564346d50556a614d6b35787049322b364d484a6b77306d4e736b7770687048394a526e433855714877624d6a6f5233696f67576c704b6434417149686569456141793335496c714c3867306b5354384e466f31703837516b79364b7a467a76506f374c5542554c6c734371746958364e556735575246324b5541587a39554446637253504a35383779625961735157395652386a496f34525a3670347355467673374670314379737157377a6446656378436a7761497931643677652f79523443755a647130492f4832633431646842533451324c6a4f695858494146334a6c4637516c794d753544396b6941374f714f486b667a5155723554596e41344d36774a6337717274683836526e482f5652384c424f364653344f466f4f3364644a30636875757275596974416f724e5a386e3164356d686b414e4a576b797673526e314d665951426761566b626338597153506b73657252363674566761554e2b68426d502f6e70555334576d55466d737655716d446c786b5555574e676b556e48384d742b6d59315864493161646c5a5231712f505173696968414a5a6a42334378645264636c366a534a6e71534741394b46626a4a4a4a4c686c43386170557532614d57536d37544b55346c38683452555264475458426362524d763751384345656934756f776d54575a49507752694f67584c594e734565636e7575414e306a67706a6b497653705134533151764466385754422f31546f366944712f5867465333645569596c6258624d614559505968626d756b48774d65306b4a304674465377732b41434270485a784663346b544151427043774343424b5a336645737177704b6446445a394d6c50397637627556464e6f50356c47534d5774715a7732524d7068395552484b595352316a4f496f5a72392f564d564d6d5a77466b45487163454149535a6e784d504255794b70694c62436637544e4c567457626170616f626b45616b446c57725a50423078735a3679566c35564674707957706a657935356b6d4338707138544e575a7161444832477773424735613279687068414b49424a3965425579335456435a6b47425058515670375633624a78726671707359367761475975476a3879307446687776734f72564d75494c33555838487a3074557245713349667556764155787a645138476a6f544e7744774c6368436d496f4a586f722f6b43486e6448763145304a7147457a2f6d705564315548683232416d7034525071346e73744653536d6a67677434626635513333557737497146477477735a4555773769516277747373644e73726e2f4c455a7245555567517a3271736d474841355a56466e69323532636c6d57424f6c5a556a317a716c2b554768754d436f3963367031544657334a4c756d6e736578597863615a656c61552b4d324e497833624e776c696f624934434d736d643035715664686f78706f34522f36566f6e7259516e43554a724c617a6e2f487062743151342b72565562614e59743145306e445a35466b4a564b5376647378616a3070425a7a6241626169754558416733426b2b4d386a615471417455734e6263693533794e6e74465939514a39706d4a4177772b526e586b594d4d353345486d4e3861586546645174306b656331352f354446736b382f2b316f6741514c2b442f5247752f2f7a6158544f4467645973625051733562424d6971426e493466473153552f46365a7546755a4a34397867555532674841305062507961756d756a69664e486252794e50346931417869694b6e41414d4233624556536c3878567850724b2b4d4b6c674a716c342f344f4d7567613264315734544f314773664d4e624a79725a4378434841313478756a523335647248774d4d6235537335486553376473394e38586467574564556f67314e6862467952534549625167525169776a3579563335664654656246795a6d766d30772f644c6a52537658625a31704d4532794454746c556e45682b6a43497030455375424634524e70574336504b5956785a6b794559664c544e6c70564b626d385355624277394f546f70727a4d704e5669445073613363705356473636567171753630634f53396f5a55684e5a6b6745524342504d5832723369357a4e2f646e474c757a6c3859503451794950555036587972376c327876484e772f6f614b2f73444f3742544c2f546a59334c347a6c596272494c4a78767174617873396f4276314f68356a4f367959734659654f734d706d666368484e596a51626844506477794a3544416358542b51634c745045454479622b6b357464314f456174357071616c616e4a4f4f67553333445974636d496966566d30746446517037684f316639357a61456f516278557048684a32366a425657414b6b4747577776536365784577397535437a3557785845594e4a41774b57352b4e4f714b6b70414f4f385a417069375a4c48735a517247484e6f624478684c326c4d50306f7255674e7670696e31577536743378696c6a657a7849694f55414654644f78494f70466b504d6a56654d46666a382b35364c35347a5559696658436d6f75384e6c744a314c42446d38554b613268445574306252393972307656445a33533333662b444c53716849687457346a5974744e6f6d784f785037555a74546a7659425769697955526c474376347170772f7673354e3571347543624167425a766c35634d6864654b506b6a7554515744636a6a353267523847434279545a445a4e357541643143694b4a315737712f477834363655516f5a6f7a6a2b70386f2b4443576757614c575a764a58782b6b48334536386a37394e752b6c706b3831344e31664c456359494838566c62746e5234394d4b4c51745653525636577a546a33764a38584e6931394a796d754d436b683032542f754d67654658754239796a4f505a57746c546a62745a66492b4b446f6c58327741786b4a35494657442b6a514278307163756a5473694230777178334b476a7368712f3675755053303074734c357166534e5847547552465a4d6b4a64706f79617552527a58696c7a627242486e367837706144662b58672f687250784462684d56662f7644766167545a37743276786d7031726b2f497546332b56676a6e47676864376d553231656c6258476b37644d74704272624f4d62737136785753516b45646671552b526c47476b41694967537a646e6e70485963505258354356484e61696367696d485130683938314c353074584a756136474a39314231716d475441627963336a4a6633536d32666c52664d55327a734c666d4c493942722f69414b45437745415957716a416f4b4a4653304646684251705775525158626c7977636a74306c564f6e54707935476a70326b574c6c694b52354854524b71654c6e447061684c513446426c545a433252757a717558456375357a70674f4f4d64493565534a7131614b6f4674584b634f324c70344a395742564a64306e613567363959746f7255493430557457777a4367434677344669795a633265525a7457375671326264322b68527458376c793662515569394b72772f36734b465673634e69515568705a566b796c70395154355565624a6f53716a6c714f6c454b624d6d4c7055366f723646476e48716348756356524a7331626d63727655776173616c616a52714564334a5130476b6154477941764431735764572f6475337231393878624c567947564c587742774143676f7144445168414a76533633626c644b6d7a5a507873534b31544974623771536a6952556942446c7843634c463836734c706853637648696c56614838654e3357757333716f2f2f38654a47373148665a31314e4855575555324546735a4c374c5545464632537751642f75556f364b474f354b4c71775643764b71755959556551305936713472374b47525769494a4e4b744f477538766f6b52537961534c6a46714a6e4b55323071696965504444724a775a415978716e64533257346557703962523055667073674f4a6e455730554d454141417751437a6b48702f2b6b736b6f72635473777253674a444373736778516979626d4a706b6f70735a4341306157574d416b5a447a4c7667687a4a465a4a59724d797979327230634b4d5a63394c4a6f76696b6969656e6c4f4b78727965614c4374714b716d59326f575152525170697079484347787972437976784452545452304d7a7136426c414e6768654e55474336696868593538634d523078784a4556644d465a49576e637854544e61544c4375484d786e35347969703656724c364b696b564672765273797357717171455850436a42794c654c49714a4b7871676b674c53362f644e4674747435314c4f41532f5053764c4135457253446d2f53487255744e65736b31596b6b687943647a356134746c6c7a704d4d7138576b7049354361732b6a796b797975716a3659386f6b2b364a616236524976517657716d6870677251635254516b4e344378626e737758473433357467736754372f546f354a41736e6936394b786f50515951517764656852537769774c696167776133485549546c46796b6c415239326c38316972344645714b5856754c4c4f5749414f4f4368367057754e6f7666564d552f4f6a6c4336537363696d616f476b4b46304941654d68617a746c554677704f795a3734342b35424e57736854522b6b69776e6d79547770546e6e3639456b6a48515273645878584e57504b524a6c7476644e393959546d716358707a49703337742f77692b31704a7a3962686467616c4c4a4a672b5863672b6a6f6b4c536f6a6c486b617355674142414a766c54303938366346795479325a39796f2b684449757632417373797a69307843554c687448424f48527a6e7169544c79524953587256315557615057616479525265546164414e3349324b703273697339756d433969366a37336c4c4b734e56704d7332776c3033544b724b7067726c2b6b613549552f377032374e50704567766c33466476765834465166363453774e42746230732b6255386a71685541416273694d6771547a4e4a713953304e336770596c47536d684e573743556a70515674567a367158706f30534a334478474d70774e6865726b596a6e5974344b456c503063554872524b6f2f59436e5a597059434b6e4b31622f536659742b476e4d665157356f507837574a5834565170756c6476692b537a6d4a4947474b43484e514e5a477431437471773250677642794474304c774446496e68425a536b4257537974324b4a70714c44725359676959374c65556a3862485454686156764b65706f32556a57675370756949792b63464e4c66524c48626751524c6f65396e45332b45764f79457147466f753554593937464d36376c675147516d7a6849616d6953713067786a78435645556c36314354497135446b6f554a4c56413371746664647345756a447871632f383379754a45766d656437547a46525a674a42754d434e537a68515552765875504c68476a344c6444467859366c7936456668656c4449427048647941543153452f68624a657667304744644543566c6a32454a6446425877594552377a335057646759326e4b4a754447564c6351366848595757554a38456d6f6a6a6b6e6172303548655653787972426b4d7339546a4d506343774a4d7a4368433546584b684c615476513235496a30434553524a6d3948475a435566652b5559314e6b502b3833584673474d3154625568757a586d556a3353556b6a4b4e5a466f6649516b3875734d6672536b4756356942787a48633879683359584d7169666b654d4d7a70482b6f4e717a4d7361616d646f68664c6f4d486d6538664c436b516730536f5648495255704f735551703955554e6d78546146504257444b4c6d57632f4e6c4f494d6e554955473038424358364f55686857442f5a4d754d7472547130434953376a714a4e2b7244455a784d7269667054456d50376847624b6734504b7566545a324b4f357950332b41686f477448587266526a6b384d3471362b30524f6336715a6e4a47464c4b694a2f436d4f6c5764796d4d545261716c37316a3763706949436a7437314e6141494e43334563715341337959343645436152456772434b7550496b6d67794a6161676e6f784e314a48775a4f525938364257656f624a304e47383935326753347a426b4957744974394b635372375876537a6d4d3553364f4f747268366549684a41714268637a6e564c66307157554b524f7a437156513650415979436a6c68553351724d497a63566b7934616a674c7a51784356527147682b6852456f2f2f474b4b345a3756452f7a77684636676657484c714f624f316753705137426879707373737033786653523870696e5755715a696e5939674d3079767a6374522f315558544e534e316e2f667657776537634c64766e52564d6939424d5a734d51717269654355476e564f52724c776857304c5645786a7044465a6d2b6f6f5a6a726a7a4b4f534468356f367479487832444a38657a71614c674a5646596374654744667549345a373259664245396c755a4649457a58664f4653584845526b4679756f643555543265364375493967437831625a4c632f68625458532b56696b6f454b63684171434363684656577472474b5a76596c6f526d6a2b555963382b44576b4743304e4a4972774367793945746f77325153777766504f38324a356f2b4e7535313479556f78705650676d2b5a797656633170465455564d53474533475a6b616b5a4c374d793861716e65626e52774d2b6170745651794f644f35494e464d6b59676948512b6c456136767a30764b387a4c6a4c4e7153564649754b63516347366d466f62684c4857704b556c566d4f662b342b4c695373455535627159335172683246755847722f304c6f6c2f696c6269746a6378756f537948575a3151706c6f736461597430413270436f4d56474458654b39424346535444306d6d4e4d336d364252712f414837506f534746526f78784d4b4b37706864486967514d697a344d534e4b5a76667965373656326f744e72616956685031756c77717a614a3166624c44745379526c73617a485a4c70323637724c684473325368644a564161444c633573465a65796c4b736b54777079486a4f62586d6146656f4541344e4e336571436d574b6163746865784947486f4f444a5343534642414d76565a42674d314b4f546f397a7a6173377364705a32776f516f5867666f6f6c6a477053365565633177654f373879733779486a78576f3651723576724159646552616b744c5a4b4556764c63516749513348696d483973373373365a626f68574f4d6242776c6f69582f3153774d6252346463734c417463764537445745516c615a5547695a4f58464950306c61436d5a6541306d51546b7a6b4d4a5264657574634c6f4e364b73774d6458767241426e3367635264686e54575a56384f68465852565767736f7773566551397949537141326951304c56384643386446582b6b694f78506a65565a677769534a336b59686a6e512b3877686e59347855524950706d747457636b7734592f6a6f4a492f5355454d65373472486d78337431704b7370396f7530646a627a374a354e4b625a625230632b4f503957685361485361526a492f34426c384c4e6c54716c317652694b65596959626f476c446a47364a776966447945726c524536785a684f67776e776c4c6f5a6471695a6a514a44764269496e7745462f374e727878446868796959596f4e532f444e355535756254497534577150374b78497a344b7234466f4d356f624a504a434f59785a70627341436f766936417239304167456642796c4d4a61693041343465613249384a7769347875496f414a6d716844516d716152324c50556b427a6738616a4a3049555a733536716b6244667761645747596b35476f37477572754838705361713046684567676f6f634d354642763267734d524f783338345a494c305949794154734843776d6a4d5256596d516d462b5973474767724130414c4f61684a36677748786b4a766a475433314f4a3930556777487645413736614b70364245504b704f59795971646d356a513267497634522f512b52387469546b79652f2b394f4e53576c394f7333376935376a4969343943436d4d43706a3267327a764f4c7249676d414845583866414c58427350643247543277412b684c672b3258676b444749586b31716772544b7036726765795845596b4a676335354d75736f4f58726949355245716248315133324950466a566c4637304b316466776c42444741414c6735417941586878434e513653626c6e6768614a6f62456a6b56456c4578562f416361366c44636e756d7263496f715667776938436d4551474d4545796779716b3261624d544e2b6d38554e756241596d3338484b53504777666c5474487a4a6f37495a70467557684847396f6a7233434a765345676b6441496735693872344b784266494b6c477849682b67634a6b6b493667756b734869784f544b39412f753238346d766b6643636f65436971534f5736546d6e374d4d626b5044476f526f4a4b6c677155794d7637664b2f476e722f78592b55505147534f666d627639596a6c2b75446c32527a6f49336f69673135685739386c7933497958774c6b357478435343537331453544686877694e4143712b65496c6f7a6f4f7041626a3661384476456a495361626e4766727263546771756b437130454b4339674a414b736b47666b705236316b4f54373679744b787773314b446e335469795878432b386f6837396f6d584672434b634c6a7a675a7867486879737061717234775346506371784f354736463472524670444259426e7876726b616d54484f46357255784b6e35306a424e41687a6a334b4b6d775a53637055547261787244324548623234535251446b355534435664514d6238414131435443586a5a4b6a596842505a4b6a6d525341586544456f5659456c7944434a343470314238776a4252474a69786c656d6f6947675a4355515a716e7068794f5634694967594d30724a4c7637355030745a2f3775705773366e366b463043304a314849755845496d756169546d63416a5a4967654953636b355952502b4649677447416b774941376c454d2b5461536a5130677377614a6d6b4b413259346279514f4b2b643251377275527659534337386a436d536749517143446c714f73555959716171517168307a4d6f4372542f4c6242734b775259746b424f6143492b5556464c39534a77474a5951362b7869527963574738444a5a3541732f6e4d6d74326b394671416a4e4561586654457970755a584c6b413645325472424b6f38422b537047576733623642384b46433869417449354e51747969616f4662596750464b322f36303539533851735659674a4751674e5a524b7671494b7a4353516a4167766f564167535854774f345543744f7a51304a496b783555516467527730576f323832675761415a5045464c6d7643616159417967364e56574e6955464447676838712f2b436c47524c4665444d36674954465a4d4d4e696b4f50425549765a676456785241687450532f6679654533305564454936563447596865456f4e43475370626962342b484e4e494545584d72464a554739572b4d616e53515a694671355579335164357a4d516949354f57717a516f5656685569325a447651425a565361466f394179475a41547250346d434934636b4b6872477735514c4275654845464349326a69754b355849577850524f524f755368494342764a676a4472734e37766f77626e56596a345373673069766b6f6c5676594253694e554c55706e417a364973306f4b683044704c6c6f71757a754446386d42496b79714d7045774e764749566964754f5532456b73784f6b314f47392f30794f3630704f687a5856433346584976715338635244664c4f336f6e4a46414a676a4c2b73397458684d4f63497a6672496c6a524c426b2b677461734a4e464f332f56367334305568594a38335a6b4b366c4c6c576a6e3542454b4a5837555a31647a6f4d6444746b5a767049526d515067433344567170794569394e614f464146567171776d316f49687144536d3772536d6c64696d4a3942555a4c774e46467a42664277435546746d387a69433764647176644a554c4e39574c3972533645746a6a756a52347773697772637176476332354268756930744d717a776b64374547356d52506b4934585261786a4a6669435757424757654e6d656e614a7a5a354f7154717273676955755338544d6b464d586e7a6b70796b416c4e3569586735584e74716c61314b72705967684c6e59534f684d6e34636755567579694742597948304344367146696a5143756e5336497279524a69534b444952744c4631697a70736a554e2f6c56723777696f515154794d3958426a5369363669417178436d3572314a546d62315a326870673470453334432f3578774b796e764d496d6c554b6d5155492f54506173775461336859455a646c5455375a453349544c5779566439685567465375794744514e5545755974623279714b79707052387045587961535169357236524b66366f41726967706d706541676e556f5473704e71573641726c794668566b784b43577161504f514376764f4167746d43326542756d33594b754764617a2b6941756b6732573072575047395031774b656857637067694642714b6c3456755632525163554d70696f776f37394f4b53694f444f497978704a5236636d5855422b74344c524a4652485469776d3853696562494a7a516b357259414c39694e4b386c5961384c6b534f632b3551767a734568676c677a4e6d5173695275464532416d53347746446f2b486b424d523854524c773467547351704975544531715a6575677147646b396d434c54575a4c615447684a762f6d634f316f4f424450762f486b4f51554a7945314e5236795234474531316977784f4b71393670556652494a3358516169566d7557566145614e586a6a4258412f526c43677a44666e545374675570567a52706956595a6d79544b3738357a6872526f684839453661754b615237624e53683052514d774d43384d49446e474a59687858676f776241726c594d494d64414c574c7949336d6548614c676767414d4b466852364c6c5331515949674f444939576b682f4169534e4367366e307034646c62725a556268616743446b33624c6f6b68485a77513942586b6e4b566f6562626f744867624156544247523557367047506f55724244566c674c634d34575a4574617870546b70693863574e557234676463724d715652754936324a597434446e693862702b4375496773684f526a4b396c58325265726c6c4c5174546b67674a4c427366626a4d5473354b62396d5647453175494c774d584c38622f33632f4e3661732b69347a477a71317970435752734b586b3271346c75316142684a625249467a70455375376d36426951644653517a4270737771326c4d6d3855367a4736727641776b626c6d6f6b7072716e374870414f74346f3652714d2b4355575a6e723039695743516d4b3368592b696b676a72444e7855544852464c4b767731783875326134732b5a514351332b77454c51334a527151456156453734613674465867696e416d4c723545657a736a57566549676a72564235624a4e78387a473661754b575952566844425949735647556642546b337a63454769543150475269704e416b2b434249524232613062465675504d75636d634c4b7130375974476d6441433251776843634a346d744e39593639355a4f68446c30787a6c694c424a4a446f44766b67436a586d7a7262634f6357464c4946344e5a6c654b444b75376a4c6d762f4d63305331674a7832356878736f326b396154637747577135646542625661466c42314f62642f6a5246384e4f34446a35366179697251703361767539344a706548794e4645517858706d4c6f54446c323571644478694968685853364e326c7565595570336f566f474d6a455a5168414862716f74694f39744261514c6a2b61384b386a7277307449674b5273366c71766b6c384962496a4e305a635461574a4e4770485343366f6b56656a76444a6d767356697753466478696479537250396f48482f596d494e6c723049566e52436c566e6e4a5a474d6b6837677a61564574704a6b4b55396b5a3755426472386c4a563830334b71686e4c356c414a6d466c4e42624a3344464a334e46794958354d5265754b68334f554530464b78624d6f6c33675575526b4a2f4551556e7a6b5646616e557a6c4d785a69794578793671346143435468374f526e524655634559563977685750747a33333064307270574e56614565767277494f2f4f4368337664534c575373616b72364a585345692f76376a685a4379356f6d706652304a595241556b3667596d324f4d4c43792f31417433734a6a6c696858693879647543364d417843576f496845334a4536614672466e67376a753069644653746b375339564942366a4b51697932717945345239706b3543712b7150554c325a6b37323957306f6d3051784748714e6f4b366c5a504e5668576a51474e596b4c447563304e7a2f55756e544a4a636f383177566a37713734514c70565842734c436d5263416835544e374e366d654f392f713775594a596b73646245717977337351593755364f32546b703756427164507043644c5371463552734a4847563072504243797149792f436b76674d7454742b6a6149752f654c634c4467504174394261776131614243626144676b367a324f6b685666596b4f4a425161334a694e6834695a666362666b39723669574737486f57664b3650704c5241702f664a586950714a3133324c665a5555594b673536754967382f366a55785631304179456866724743754d444b706c6946375572314974767074534b6e55493970787233445a33526f337a75375365624776516554777535696c4b41645346573332436d5255533572515775326f3548714a2b6e4c6d38594e596e7547386f2f3454496b52395632555355697733664757584b4c52357649584c4b4f554f2f797047516c4a39442f634b7138384d744c4246723158763144644f696f77386839766d3356784b5362646c73726c744c58303639666d7070414b30687768727573393369534331584a3544632f704f44664253394174794977525056546548387678562f526842525371732f373930726233434c2f34516730477734476d776767674f77733948635a50694864325a67436e594767333566516b6e6474574749502b4241416771576c51414141436a494d4b4541465441594a6a513455494443413034504b6a774973614d476a6479374f6a7849386951496b65534c476c537045534344574773304b4a4945534646363962703271574931694a4635485452556c516f4a7146466847675235556e30357135644e5265424b5252476935592f506d482b704d57514945595641776d71574c4652426467595742654f3561714334734b3043726b57484876794c64793463756653726638626b69764c6c544330374d3235694f59755770463672694d586d46444d6e7a474a4c69493647424b7477456c7042645643434372555169393774735161494f466e684735445a34566f4d47315a74616331757258722b6a5873324c4c6c5369786f59455844474643334b46716b62703353786b703735675336754364795862555537516f576d56784f7a566f4b61646c696d517168585642566944335a5772587173392f5a6967592f2b7a7a36394f70643477554c342f31754d46706f41566575534a6575346a303149315a5561326774524e6d45553251464371584649705952736755684d434357316b6f507a58575765523356567546364757713449596354745555524446547368646c663551525430334c544a5562565544666464784d742b57335733484c384b6349675646556f3068426159483133463459582f64676a616830616553535335366c6b45473477624c482f31314f36304c534f4f72723042744e4c4e385830556c4330424b6955636d48575567357843313557485255762b5a6951526579316c53536363637135336c5572595962674f73454168394e4c6d69315849325662387351544d456d464759784e792f565748565330384557686843623971424670624d35354b61615a5a6f545751574b74394f51575947776835547241434d616c6937586768782b5a6a635649546a6e41374b54554c75755563314e6a6c2b334632554b6854616f70734d454b532b6437444e3235537a794942745a6267493046553255357570684b464c58346b52504d745961707332785076423049566b51465651726272384f61657936484b6f6e48456c3950496b684f59634831744e6c4f6c4e313346452b714b6a657259544d5a6542524d4237577059626e6f476e797762486a78395a35317a4f5770314741423471636f54445842654f394f774d53722f2b3177552b476b7851464c75675875684f556866444c4b36426e776d63426159516147717261474756694157464b3242546b394b566474724f7163574b712f4f5846706c58693273656c565841576e76445454634c46563578594d366459626c625465323664504c6c6b5a593349782b6b774f4f5272504a4c525179785637576c6c614e4c30323235684b644a43786d504657433343375242755a66347368526c6c6b67775a3237572b6b6175786362347370456c467257696b3930754a744f2f3634684e777878484357356551354d324e41355551743137727335446d3273746136446b373936524a31643341587046766a4872554f4f65787257305152694442554164575675327862437a426b62675954564c7748567052684f2b3045474e4132626548716f326742494e46327355732f50626d6f32616d49532f374e744d744f71764a4a6933583446565855746a45715a6473597162706f35702b6a5434624631653179765534392f5366546a707457546f4c766e307761313851597457445375526a565a464330694e57315a674b637a566a4a4f6c6642696750724a38454a6969513137326b4a317167577237354e425561446d74693262714b7657756e4352486c5356633077497a6b413845564546487768444c2b536b6f5a4170546a3549555365796845596f31544c65367743426b2b36354c6b532b7577334f33784a635778484953714142576b78664349554563656f6d44546d4a544d706f464c3056525257475842657a436d68744378484a54347853444d4a616f6857504258464e5534514c6265354533554b46426e676c4f395677376c5741585047703833564246347a6959655668494939344a31704330776b4752762f45306b396c564168616a5645436b2b43456130436b6d38346b2b54577646536c464b437451314745434d4d6e5938496251736848635968554a436f64467744787447744c4d59705a546367554a674a47386e39485359346d536557636e4577486435614243694761754a5655456e4e74496f756156755a476c41424a636f646575733873445955664566706e5a7078453469437459786b47755775467866796d3743596e4542634e727a376351677258546d535941505a4558394736346e4b436371594644584967544851684f504e70502f644d7a6c764c7041573267704d6f426736484a2f50683377355670536653386539476a4b6f4f596762797042584d543538574e5a4a46754249313638526b4f666e5234633563784c6e2f536374773765786a72594c54473233696a70516949675156676e54526d63344a4b385579354877616b78396171434e614e676c4d465873792f78785846416f784868316834426f6a6c49686d426b76557551704e6f777173486c6b4842713479536932555a52515931577856484b7a696c346934702b493852536962413534574b4372567456364b4b775a3471516a7a46614e793950522f6759454554367135773241494d446c4b30564f3969754e514c554655625777394c4a776b456f424f5a63395674414a6f6f5437484e526352516b6f7859756966494c504a55744831526a425a6a414f31774554456b685a4a57504752696d3769446361556736374f6f5a6c494c544e4557626d494a306f7830572f55415a30736861456e31566c53615950624952415a5a45514a576b522b704b53554b73324c5436544d6a7036386b646461534f796468534664546d365874594534543177444579353458644d6a735443456f6b35796958435168384b65364d307950674e4d4a6d76794734327041346b48685770714145434938502f794e7a594e4d636a6b2b484b6c52526847642b71674253516179682b683645354b646533627453785877714d7335796f6863324e42594e4c664464746c49414c37564f45556f5365413069524137425567544d417752766f637549394670496c394842574473374546426b514251305535724f5079684755686565464c69785a4274357051695365512b4d3953325573465a46554a78703462485a5849464b4e48385967674275414e555243543478317a6d537a726b6c7270376d4f7257674679654a3939795373324534783447493863746543654f6e34443330587370556c6463516c37325575614c58635a7647386a7941704170414a636162416d385367796e3379794e31726b62423378654a586e6569653246742f6f50576945675a6132344170466947686b66663430612b72557a774a5a73544272426b3639614c48706d32773174382f423172625741592f364a4f6a2f74356975425759634e613433676272586f75484f63394f4b36614d73596e5253696b6563743856447276474e53735937734f366f644556644e41672b764d547a34557a4761312f33576979376d6249576f464d67735a31365372724e567843374a47336a46564273624e594f62375a77596b5863697476325a7332646e765042774d786b634d6c575941382f71777664306f537542797a6870425552686f485470444877306757663778316568676a45544f45475738786b4170784463362f637a44334b5a526739634f4d4e4231754f316f3655646e495a6a64654350424b2f4e31674f64426d3654617545477039326e504f553669777a61436738355a35742f626a6d585243594a77324463375a662f764c4646704c52762b6c4e41664d6b61352f2b52724942584c6d586868677463727934346570596a71733653513744646c66707664594b597242384e33542b786448622f39724a75526e397a30414e4a65556974355536446e316f516a696e4b43636953712f4d44764d743154325159524c7a6f66333354764d784f334d455a6a655a674a483351362f4459654962486f374c4c7668505778557872715146474951576d584c45343941396c6455517763613551436e43465a357a4d397a2f6d506431494b694232485969704462665a304b34516a3670505641685949596652314d706f4c4e61505756394c6e494878774d6565696f395836304442696f6b3054533637334d4d5969495171457a664a566f416777644e54354f336a793941726d42394954674874742b556e6b72746e2f57426b524d446256392f78324135553356437049576e4d4169467571443873355444546b675a6376444e4b78684f674e5156504c536633736e5a75696b43574e434f544e5766634e324a68326e54357832507446564a366858676965304e6a477a4c62797a6735474d4245727a6f5676663856385252344558354349364946677a4b32387759326e795a57716f464343483852307873476931387738684a336a726377307a4d326735527954635142592b45437774796d487463686e566f45322f3042725649327762714676636378666c3558706334485a764e78443349777a456f45483673566f774554486a2f4c4f4747335561616242396d44424a4f384d527672466c755857474d70642b4a6952773548427258755633376b63354f415a5861344d5a696f6547472b5167594d465631354d316d784d7a732b552f33584632573253483361417774304265796c5a3770315978764f59546d45534a3461555761434e6b68336b516b61416131474a67435765485765416c6c31494933394164504d5a545871414e3936516d59674e3141654d7059664a636e4970594b52493244664344684e4d7351755a2b79775a5948426770526a424837614575552f5a3271514743787745306e39694a706956624d4b56386e7563684e52497563596376644741567949636357776b764f3649546e534676764b4d7079504d6c4b46493031436864586241574b5a51644d524d643931494b634e5a6b636161494f786f5355704f4f724e426c77334570514e516875414d4438725559386c6c5a44724544462f316c635a4b785036426e506f51586b6b79306274666b453851776347486e6a3450424a594478467363446a436a596b464545456e6b45464659534271695247544a415138594852794f584c61676b4663685447684e574c414e6f69635a7a6a56637766634b476b4c79344546667a48646c5257677643477148694f496c796b5434454e485749683335696a6272315348323050726a574c7346585a7268486c57673061554f41476333436153326747697268644834306355656952386e4864774e324e546d30576675415a3647334866366b4f57423657436742465575364345323647487862663173484b784e43434e384149746578685876485041636c684d44524c547544616b7a6a506865796c564a336c6d61684159344342647446567a7079614345366964486e446761555a475472596766334a46334750504a414f4d41794e6f7a674b346d446d59654849495134452f2f3867694e506431717852436252386e6645734a72586f3171327732697539567a774934434c3452564551676c4461356d467445324a517835584d53394756454c4b74572b43493347713532574c537042336c566841326e4d2f70446c4c536e3352656c476864426c445979324452676d62346a506735347576743350674156737759707362494135744a5635574144665a45594f36743530567433337457305757596b5259636d3579686e75666f6f79346334546d657a32574e5839696b6f364d684137535545485349694634614b4533396f6f4a777a6f4b4167572b4e69674c526c3879414464675978567079547543596f364773417a35633056584b422f34387a77534b71434c704835595668575530787664566c71507053624b78574f2b6b32734e4e466e336f34662f4d68482b796d574573796c554d6f6f2f4f6c4c456f337a5046524858775272546c33594e795863372f714d4e714c5653392b4d66362f595a50616377587873507748456865466b6d57366c504d56517634694a5932455a6a557157505665553654585351724e6c656b4f574138344550702f552f577246434231696b345952446e484d685434493663495273714275674a2b6776494b554b617a56585975422b6978674d3769412f324c4d78714e4b716a78744376704d6c6c55462b4b386f555778417839795170774f7076625864317846416835786f4e2f79734e7230514c2f58555531707171716e684b5034555a69584b44776a63342b6b73356c6457664f384a3464626847704d4b415176744a7577414246654557494569734d72556c472b496944354d5357756b544d35456d797753695a6a6b39516e4e2b726c436b6e6e52706633636f764361753372744837684775675563454b74496757364d5a786151475356673230416964526c454d574b6d593562614143775a68312f39415a5331434557393372747870725739544a4f486b4a2f75464f7263525a596535516e443162543278612b7131574f685a524d44784c736b775a544f44505151777278533753563341484663534151437848552f797271476842772f5a4f4d63346f3137454459717266767442583441416359504a476c5a484d536361734d59474c6a366741696c4c476e65524576376d61675a6e6a367a6e483178566e5965545730666162352f44534f7834416a7a707449716e414b686b4e433546525542534f6146624e774248466763454c66616a654d6b7065756f614e3359694e78465159444d796643714a744d523245764c47584946474e4556316c695a3362546e6a44697645556558344e594d695a54596a507637704851664169345549526b51426b676e794d5a726964335070516f326c6f7a6b44754366346d3139325754336f4a4f566761326d78753536495344415241446d6e364671356f41624c38556148676833416d5947466f7a416e6d7a42346151395851683968494958364932746e574c72342b784e5175417657746e4d61565876484171433541726c4673335a514d6e4f6c5a61676d4e44547270346d4b354850536d4a46723448506159465a354158346c39436463636d497345714a5363534734744642304e694f66673244542f706d2f68616f346f635a2b6a575771565173614c5367777476494a4878754965596b7535415564516549343742687269774377415530394b7346416868416759764d4976575963383347674f68556e5676455361546c6930495a76594e4d64726b6b3459364153757653506e5a7641545755664e397156445356386630754a6d6b634e6d6d4d7079534a6130454e394d48412b76766f5433574672526f4b384e54784242314774664f41714a3947475541554d386d45706a6646776c426b617a356b6d795842632b384f38696c4a64444c4f526c506a455551775675554d487457495a7577454159554236364672424f316f714169412b386847477959474c44536c4a4e65414f56365758547172484266415a4c33516b774d6b72764b6c447030654c784a4264575669766c3861717666754d4f35635753594c4168783434424e4d67624d38726b47466366396a48422b6d45312f333352763858444d5669792b7a4655666f436f516a70784a396550436c427832764654586d436148782b6145425a6641576b52514e466938556c7050696751587755496c5145584a39667934787a555a56534573657a46466a7779385a556566584850634e414d6f4d595a4a69494450727a6d6f2b6e456a6d67796b546a7a433355466d346761564b7a446c4e72784665475255674152364c775972385a4450727a6d746754472f31496a4f71647a6a5248452f486e4b6a44326c6e6d674d6f6c4968336e465076435362354d6e444638704450747a6f6666434679775965685254795077664c6e74487535487a30736f68597152425a44627257486e4c64622f5171507244444d65444b4f784a584d32393030367874516b6a45444a4546753053436c656a6a4c694752664445734d6638476f694c44432f6547586b42566a387130347a675057397a504e4349584a42474853502b4669662f4d56303063383275795132532b34304979704559727462416b6a6f2f35324b42464a674574527a73787930736f68574d79527a367a6739543572316749576742674746684c454f326f7255564553426a6346553073457a66797a38516f4d534549517a346751334e456934664259314c66646631515930755177324155436a5246342f70516b326370516a4c6b77334575796a74657346703874574d4469317478785341796848784d42716d537a5a583069557673516a364d4b70596f416f3752626732504e6778744d4e7a77626d7847786f415544692b78464e2b78677a77415a75686854386763424e4a4d4c473572634f536b42555573567246356b553363424f346f6e4d746b6a3535455170593079433432397872567867595032694c77565a5a34555a626b68492b6c43585073456f4b414154562b4e336a62637153455378684164515a4e5a7039417768622f6e41594730553056625963546d59646f7a7a6536444670315338636f3270645678626544674948464d4d5641324961566559694274784642664561446c6d6f6262736c4c6546696e4656634e58567345586a677147517634735354326b4e4a7830625a4465495635446352375934624a2b49714a5535444e6f6c456979306557634467614664644859357045475a5a3633766745546668432b4e346878724433366439707263534f5173564338415862476a6b4d375155616552384d796a677958536d51417865644555517757666b6171524343724d534d505644694c473247545469564e7a615a5130353279346550365557567a7935776652395931485a39787a6e3946417543714d536c62647562574a2f4c674d58686c4958312b666e30794467456c74646e4b385473744d5675763065444b4b54614d4579424d33716d4f486f707753706a703862496f4e59382f684b534658386c7037504e69494153476945316134793351654354566853626d76326b2b694a70452f5a73734e6c364e61452f78492b7a554637526d6131547a346841525a736f7a586433526c7634683941512b624448446e665165455a7252426f6a7846616f5141796e393746762b724f62466a554c535532666f576a7368566155716a7a52637265336a566255396d317a42436a6d4a6f4c73434c656e2b34615152316e77656269797870514c2b5965334f3733626a354245447743672b6b62516b47596730372f547a2f6556385553306a6e7434583849377a71397733332b52424667492f4c7848664a49386b4d57544e5a4a6e764d5a7a534b57736f4c6943664d6a48436347374f3533432b636c2f36342b62664d736a7a4e50457645564262576a5476434a42424c726a5042765a4f382b66754d2f2f66444842764e4166544834562f596e334f74497676574d5450644d2f7657303650645250506456587664566650645a6e76645a7650646433454c3358667a3359683733596a7a335a6c7a3175427751414f773d3d, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pictures`
--

CREATE TABLE `pictures` (
  `PictureID` int(11) NOT NULL,
  `TaskID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `question`
--

CREATE TABLE `question` (
  `QuestionID` int(11) NOT NULL,
  `questiontext` varchar(200) NOT NULL,
  `kindofquestion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `question`
--

INSERT INTO `question` (`QuestionID`, `questiontext`, `kindofquestion`) VALUES
(12, 'adsfsdfasdf', 1),
(13, 'aaaaaaaa', 1),
(14, 'bbbbbbb', 2);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `task`
--

CREATE TABLE `task` (
  `TaskID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Description` varchar(4000) NOT NULL,
  `DifficultyID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `task`
--

INSERT INTO `task` (`TaskID`, `Name`, `Description`, `DifficultyID`) VALUES
(1, 'Liegestütz', 'aufab', 1),
(2, 'test', 'description', 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tasks`
--

CREATE TABLE `tasks` (
  `TrainingplanID` int(11) NOT NULL,
  `TaskID` int(11) NOT NULL,
  `Repeats` int(11) NOT NULL,
  `Sets` int(11) NOT NULL,
  `Duration` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `tasks`
--

INSERT INTO `tasks` (`TrainingplanID`, `TaskID`, `Repeats`, `Sets`, `Duration`) VALUES
(1, 1, 12, 3, 90),
(1, 2, 111, 222, 333),
(2, 1, 12, 3, NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `therapist`
--

CREATE TABLE `therapist` (
  `TherapistID` int(11) NOT NULL,
  `PersonID` int(11) NOT NULL,
  `Username` varchar(45) NOT NULL,
  `Password` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `therapist`
--

INSERT INTO `therapist` (`TherapistID`, `PersonID`, `Username`, `Password`) VALUES
(1, 1, 'Aaron', 'ff069ccecc4780f9f524892924434b355e49a799'),
(2, 2, 'Quinlan', 'ff069ccecc4780f9f524892924434b355e49a799'),
(3, 3, 'Melvin', 'ff069ccecc4780f9f524892924434b355e49a799'),
(4, 4, 'Tucker', 'ff069ccecc4780f9f524892924434b355e49a799'),
(5, 5, 'Adam', 'ff069ccecc4780f9f524892924434b355e49a799'),
(6, 6, 'Upton', 'ff069ccecc4780f9f524892924434b355e49a799'),
(7, 7, 'Flynn', 'ff069ccecc4780f9f524892924434b355e49a799'),
(8, 8, 'Robert', 'ff069ccecc4780f9f524892924434b355e49a799'),
(9, 9, 'Zeph', 'ff069ccecc4780f9f524892924434b355e49a799'),
(10, 10, 'Wylie', 'ff069ccecc4780f9f524892924434b355e49a799');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `trainingplan`
--

CREATE TABLE `trainingplan` (
  `TrainingplanID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `CustomerID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `trainingplan`
--

INSERT INTO `trainingplan` (`TrainingplanID`, `Name`, `CustomerID`) VALUES
(1, 'plan1', 1),
(2, 'plan2', 2),
(3, 'plan3', 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `undercategory`
--

CREATE TABLE `undercategory` (
  `UnderCategoryID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `CategoryID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `answer`
--
ALTER TABLE `answer`
  ADD PRIMARY KEY (`AnswerID`),
  ADD KEY `CustomerID` (`CustomerID`),
  ADD KEY `FeedbackID` (`FeedbackID`),
  ADD KEY `QuestionID` (`QuestionID`);

--
-- Indizes für die Tabelle `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`CategoryID`,`UnderCategoryID`,`TaskID`),
  ADD KEY `fk_Categorys_UnderCategory1_idx` (`UnderCategoryID`),
  ADD KEY `fk_Categorys_Task1_idx` (`TaskID`);

--
-- Indizes für die Tabelle `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`CategoryID`);

--
-- Indizes für die Tabelle `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`CustomerID`,`PersonID`,`DoctorID`,`TherapistID`),
  ADD KEY `fk_Customer_Person1_idx` (`PersonID`),
  ADD KEY `fk_Customer_Doctor1_idx` (`DoctorID`),
  ADD KEY `fk_Customer_Therapist1_idx` (`TherapistID`);

--
-- Indizes für die Tabelle `difficulty`
--
ALTER TABLE `difficulty`
  ADD PRIMARY KEY (`DifficultyID`);

--
-- Indizes für die Tabelle `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`DoctorID`,`PersonID`),
  ADD KEY `fk_Doctor_Person_idx` (`PersonID`);

--
-- Indizes für die Tabelle `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`FeedbackID`);

--
-- Indizes für die Tabelle `feedbackdonebyuser`
--
ALTER TABLE `feedbackdonebyuser`
  ADD KEY `CustomerID` (`CustomerID`),
  ADD KEY `FeedbackID` (`FeedbackID`);

--
-- Indizes für die Tabelle `feedbackquestions`
--
ALTER TABLE `feedbackquestions`
  ADD KEY `FeedbackID` (`FeedbackID`),
  ADD KEY `QuestionID` (`QuestionID`);

--
-- Indizes für die Tabelle `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`PersonID`);

--
-- Indizes für die Tabelle `picture`
--
ALTER TABLE `picture`
  ADD PRIMARY KEY (`PictureID`);

--
-- Indizes für die Tabelle `pictures`
--
ALTER TABLE `pictures`
  ADD PRIMARY KEY (`PictureID`,`TaskID`),
  ADD KEY `fk_Pictures_Task1_idx` (`TaskID`);

--
-- Indizes für die Tabelle `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`QuestionID`);

--
-- Indizes für die Tabelle `task`
--
ALTER TABLE `task`
  ADD PRIMARY KEY (`TaskID`,`DifficultyID`),
  ADD KEY `fk_Task_Difficulty1_idx` (`DifficultyID`);

--
-- Indizes für die Tabelle `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`TrainingplanID`,`TaskID`),
  ADD KEY `fk_Tasks_Task1_idx` (`TaskID`);

--
-- Indizes für die Tabelle `therapist`
--
ALTER TABLE `therapist`
  ADD PRIMARY KEY (`TherapistID`,`PersonID`),
  ADD KEY `fk_Therapist_Person1_idx` (`PersonID`);

--
-- Indizes für die Tabelle `trainingplan`
--
ALTER TABLE `trainingplan`
  ADD PRIMARY KEY (`TrainingplanID`,`CustomerID`),
  ADD KEY `fk_Trainingplan_Customer1_idx` (`CustomerID`);

--
-- Indizes für die Tabelle `undercategory`
--
ALTER TABLE `undercategory`
  ADD PRIMARY KEY (`UnderCategoryID`,`CategoryID`),
  ADD KEY `fk_UnderCategory_Category1_idx` (`CategoryID`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `answer`
--
ALTER TABLE `answer`
  MODIFY `AnswerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT für Tabelle `category`
--
ALTER TABLE `category`
  MODIFY `CategoryID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `customer`
--
ALTER TABLE `customer`
  MODIFY `CustomerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT für Tabelle `difficulty`
--
ALTER TABLE `difficulty`
  MODIFY `DifficultyID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `doctor`
--
ALTER TABLE `doctor`
  MODIFY `DoctorID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT für Tabelle `feedback`
--
ALTER TABLE `feedback`
  MODIFY `FeedbackID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT für Tabelle `person`
--
ALTER TABLE `person`
  MODIFY `PersonID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT für Tabelle `picture`
--
ALTER TABLE `picture`
  MODIFY `PictureID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `question`
--
ALTER TABLE `question`
  MODIFY `QuestionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT für Tabelle `task`
--
ALTER TABLE `task`
  MODIFY `TaskID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `therapist`
--
ALTER TABLE `therapist`
  MODIFY `TherapistID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT für Tabelle `trainingplan`
--
ALTER TABLE `trainingplan`
  MODIFY `TrainingplanID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `undercategory`
--
ALTER TABLE `undercategory`
  MODIFY `UnderCategoryID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `answer`
--
ALTER TABLE `answer`
  ADD CONSTRAINT `answer_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`),
  ADD CONSTRAINT `answer_ibfk_2` FOREIGN KEY (`FeedbackID`) REFERENCES `feedback` (`FeedbackID`),
  ADD CONSTRAINT `answer_ibfk_3` FOREIGN KEY (`QuestionID`) REFERENCES `question` (`QuestionID`);

--
-- Constraints der Tabelle `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `fk_Categorys_Category1` FOREIGN KEY (`CategoryID`) REFERENCES `category` (`CategoryID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Categorys_Task1` FOREIGN KEY (`TaskID`) REFERENCES `task` (`TaskID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Categorys_UnderCategory1` FOREIGN KEY (`UnderCategoryID`) REFERENCES `undercategory` (`UnderCategoryID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints der Tabelle `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `fk_Customer_Doctor1` FOREIGN KEY (`DoctorID`) REFERENCES `doctor` (`DoctorID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Customer_Person1` FOREIGN KEY (`PersonID`) REFERENCES `person` (`PersonID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Customer_Therapist1` FOREIGN KEY (`TherapistID`) REFERENCES `therapist` (`TherapistID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints der Tabelle `doctor`
--
ALTER TABLE `doctor`
  ADD CONSTRAINT `fk_Doctor_Person` FOREIGN KEY (`PersonID`) REFERENCES `person` (`PersonID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints der Tabelle `feedbackdonebyuser`
--
ALTER TABLE `feedbackdonebyuser`
  ADD CONSTRAINT `feedbackdonebyuser_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`),
  ADD CONSTRAINT `feedbackdonebyuser_ibfk_2` FOREIGN KEY (`FeedbackID`) REFERENCES `feedback` (`FeedbackID`);

--
-- Constraints der Tabelle `feedbackquestions`
--
ALTER TABLE `feedbackquestions`
  ADD CONSTRAINT `feedbackquestions_ibfk_1` FOREIGN KEY (`FeedbackID`) REFERENCES `feedback` (`FeedbackID`),
  ADD CONSTRAINT `feedbackquestions_ibfk_2` FOREIGN KEY (`QuestionID`) REFERENCES `question` (`QuestionID`);

--
-- Constraints der Tabelle `pictures`
--
ALTER TABLE `pictures`
  ADD CONSTRAINT `fk_Pictures_Picture1` FOREIGN KEY (`PictureID`) REFERENCES `picture` (`PictureID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Pictures_Task1` FOREIGN KEY (`TaskID`) REFERENCES `task` (`TaskID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints der Tabelle `task`
--
ALTER TABLE `task`
  ADD CONSTRAINT `fk_Task_Difficulty1` FOREIGN KEY (`DifficultyID`) REFERENCES `difficulty` (`DifficultyID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints der Tabelle `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `fk_Tasks_Task1` FOREIGN KEY (`TaskID`) REFERENCES `task` (`TaskID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Tasks_Trainingplan1` FOREIGN KEY (`TrainingplanID`) REFERENCES `trainingplan` (`TrainingplanID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints der Tabelle `therapist`
--
ALTER TABLE `therapist`
  ADD CONSTRAINT `fk_Therapist_Person1` FOREIGN KEY (`PersonID`) REFERENCES `person` (`PersonID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints der Tabelle `trainingplan`
--
ALTER TABLE `trainingplan`
  ADD CONSTRAINT `fk_Trainingplan_Customer1` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints der Tabelle `undercategory`
--
ALTER TABLE `undercategory`
  ADD CONSTRAINT `fk_UnderCategory_Category1` FOREIGN KEY (`CategoryID`) REFERENCES `category` (`CategoryID`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
