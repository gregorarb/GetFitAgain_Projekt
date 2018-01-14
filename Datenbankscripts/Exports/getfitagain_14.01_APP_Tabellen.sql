-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 14. Jan 2018 um 16:33
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
  `QuestionID` int(11) NOT NULL,
  `answerint` int(11) NOT NULL,
  `answerbool` tinyint(1) NOT NULL,
  `answerstring` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `feedbackdonebyuser`
--

CREATE TABLE `feedbackdonebyuser` (
  `PersonID` int(11) NOT NULL,
  `FeedbackID` int(11) NOT NULL,
  `finished` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `feedbackquestions`
--

CREATE TABLE `feedbackquestions` (
  `FeedbackID` int(11) NOT NULL,
  `QuestionID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `questiontext` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  ADD KEY `PersonID` (`PersonID`),
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
-- AUTO_INCREMENT für Tabelle `person`
--
ALTER TABLE `person`
  MODIFY `PersonID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT für Tabelle `picture`
--
ALTER TABLE `picture`
  MODIFY `PictureID` int(11) NOT NULL AUTO_INCREMENT;

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
  ADD CONSTRAINT `answer_ibfk_1` FOREIGN KEY (`QuestionID`) REFERENCES `question` (`QuestionID`);

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
  ADD CONSTRAINT `feedbackdonebyuser_ibfk_1` FOREIGN KEY (`PersonID`) REFERENCES `person` (`PersonID`),
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
