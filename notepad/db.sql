-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.6.21 - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             8.3.0.4694
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table sugarpad.posts
CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `fkid` int(5) DEFAULT NULL,
  `tittle` varchar(100) NOT NULL,
  `rw` decimal(10,2) NOT NULL,
  `sid` varchar(12) DEFAULT NULL,
  `flag` tinyint(1) DEFAULT '0',
  `date` date DEFAULT NULL,
  `ordered` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=448 DEFAULT CHARSET=latin1;

-- Dumping data for table sugarpad.posts: 418 rows
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` (`id`, `fkid`, `tittle`, `rw`, `sid`, `flag`, `date`, `ordered`) VALUES
	(38, NULL, 'poner weather strip laundry', 10.00, 'S1647', 1, NULL, NULL),
	(37, NULL, 'aire guagua repair, hacer cita', 10.00, 'S1647', 1, NULL, NULL),
	(36, NULL, 'vender laptop vieja bajo cama', 10.00, 'S1647', 2, NULL, NULL),
	(34, NULL, 'conference planning book', 10.00, 'S1647', 2, NULL, NULL),
	(32, NULL, 'vender iphone', 10.00, 'S1647', 2, NULL, NULL),
	(33, NULL, 'telefono paola', 10.00, 'S1647', 2, NULL, NULL),
	(31, NULL, 'gomas nikke guagua', 10.00, 'S1647', 2, NULL, NULL),
	(13, NULL, 'purchases', 10.00, 'Q9163', 1, NULL, NULL),
	(14, NULL, 'ver a vilma hoy', 10.00, 'K5949', 1, NULL, NULL),
	(16, NULL, 'leer manuscrito ', 10.00, 'K5949', 1, NULL, NULL),
	(17, NULL, 'carro: button radio, vicera, door', 10.00, 'S1647', 1, NULL, NULL),
	(18, NULL, 'reserve kevin o relly book', 10.00, 'S1647', 2, NULL, NULL),
	(20, NULL, 'cebolla', 10.00, 'Y4965', 1, NULL, NULL),
	(21, NULL, 'tomate', 10.00, 'Y4965', 1, NULL, NULL),
	(22, NULL, 'gree pepper', 10.00, 'Y4965', 1, NULL, NULL),
	(23, NULL, 'espejuelos roxy', 10.00, 'E2959', 1, NULL, NULL),
	(24, NULL, 'met museum', 10.00, 'E2959', 1, NULL, NULL),
	(25, NULL, 'computer repair', 10.00, 'E2959', 1, NULL, NULL),
	(26, NULL, 'computer battery rutgers', 10.00, 'E2959', 1, NULL, NULL),
	(30, NULL, 'mande fotos a papi', 10.00, 'G4378', 0, NULL, NULL),
	(39, NULL, 'store old compu and maletas', 10.00, 'S1647', 1, NULL, NULL),
	(42, NULL, 'arrwglar la ducha del bano', 10.00, 'S1647', 2, NULL, NULL),
	(43, NULL, 'back to school supplies', 10.00, 'S1647', 2, NULL, NULL),
	(45, NULL, 'cambiar piso baÃƒÂ±o', 10.00, 'S1647', 1, NULL, NULL),
	(46, NULL, 'pintar baÃƒÂ±o', 10.00, 'S1647', 2, NULL, NULL),
	(47, NULL, 'oil change VW', 10.00, 'S1647', 1, NULL, NULL),
	(50, NULL, 'cita con ENT 8/22 @9:30 AM', 10.00, 'S1647', 2, NULL, NULL),
	(55, NULL, 'ponerle gas al aire', 10.00, 'S1647', 2, NULL, NULL),
	(58, NULL, 'A test note', 10.00, 'F3734', 2, NULL, NULL),
	(59, NULL, 'This is a second note.', 10.00, 'F3734', 2, NULL, NULL),
	(60, NULL, 'This could be for brainstorming.', 10.00, 'F3734', 1, NULL, NULL),
	(61, NULL, 'buy andrea bocelli tickets', 10.00, 'S1647', 2, NULL, NULL),
	(62, NULL, 'toilet zapito nenas', 10.00, 'S1647', 2, NULL, NULL),
	(63, NULL, 'facturar relaxslim', 10.00, 'S1647', 2, NULL, NULL),
	(64, NULL, 'check el pago de loan nikke', 10.00, 'S1647', 2, NULL, NULL),
	(65, NULL, 'Testing this out', 10.00, 'S7674', 0, NULL, NULL),
	(66, NULL, 'And another test', 10.00, 'S7674', 2, NULL, NULL),
	(67, NULL, 'Que', 10.00, 'S1647', 2, NULL, NULL),
	(68, NULL, 'this is test', 10.00, 'D9549', 2, NULL, NULL),
	(69, NULL, 'conference planning book', 10.00, 'S1647', 2, '2011-08-25', NULL),
	(70, NULL, 'find out possible venues', 10.00, 'U6453', 1, '2011-08-25', NULL),
	(71, NULL, 'venues and costs', 10.00, 'U6453', 1, '2011-08-25', NULL),
	(72, NULL, 'puerto rico hotels', 10.00, 'U6453', 1, '2011-08-25', NULL),
	(73, NULL, 'posible sponsors', 10.00, 'U6453', 1, '2011-08-25', NULL),
	(74, NULL, 'name of event', 10.00, 'U6453', 1, '2011-08-25', NULL),
	(75, NULL, 'dates of event', 10.00, 'U6453', 2, '2011-08-25', NULL),
	(76, NULL, 'speaker prospects', 10.00, 'U6453', 1, '2011-08-25', NULL),
	(77, NULL, 'speaker costs', 10.00, 'U6453', 2, '2011-08-25', NULL),
	(78, NULL, 'marketing (tv, local radio,etc) costs', 10.00, 'U6453', 1, '2011-08-25', NULL),
	(79, NULL, 'Yet', 10.00, 'Z8248', 1, '2011-08-25', NULL),
	(80, NULL, 'Possible cities', 10.00, 'U6453', 2, '2011-08-25', NULL),
	(81, NULL, 'Potential attendees', 10.00, 'U6453', 1, '2011-08-25', NULL),
	(82, NULL, 'Twitter lists of Puerto Rico based designer/developers', 10.00, 'U6453', 1, '2011-08-25', NULL),
	(83, NULL, 'Gggg', 10.00, 'Z8248', 1, '2011-09-01', NULL),
	(84, NULL, 'Medias Paola ', 10.00, 'U6453', 2, '2011-09-11', NULL),
	(85, NULL, 'ir a ver officina', 10.00, 'M3197', 1, '2011-09-23', NULL),
	(86, NULL, 'comer con las nenas', 10.00, 'M3197', 1, '2011-09-23', NULL),
	(87, NULL, 'picina?', 10.00, 'M3197', 1, '2011-09-23', NULL),
	(88, NULL, 'airheads?', 10.00, 'M3197', 1, '2011-09-23', NULL),
	(89, NULL, 'medicina pao walgreens', 10.00, 'M3197', 1, '2011-09-23', NULL),
	(90, NULL, 'find space', 10.00, 'L4134', 2, '2011-09-24', NULL),
	(91, NULL, 'sign lease', 10.00, 'L4134', 2, '2011-09-24', NULL),
	(92, NULL, 'ÃƒÂ±ÃƒÂ¡Ãƒâ€˜ÃƒÂ©', 10.00, 'Y2753', 1, '2011-10-04', NULL),
	(93, NULL, 'http://www.link.com', 10.00, 'S1647', 2, '2011-10-04', NULL),
	(94, NULL, 'ok what...', 10.00, 'C2748', 2, '2011-10-04', NULL),
	(95, NULL, 'movies', 10.00, 'R9891', 2, '2011-10-04', NULL),
	(96, NULL, 'Test', 10.00, 'K8729', 2, '2011-10-05', NULL),
	(97, NULL, '123456789', 10.00, 'K8729', 2, '2011-10-05', NULL),
	(98, NULL, 'test', 10.00, 'K8729', 2, '2011-10-05', NULL),
	(99, NULL, 'toto je nejaky test ako si pridat note', 10.00, 'K8729', 2, '2011-10-05', NULL),
	(100, NULL, 'dune', 10.00, 'W7514', 1, '2011-10-05', NULL),
	(101, NULL, 'sdfhsjk', 10.00, 'W7514', 1, '2011-10-05', NULL),
	(102, NULL, 'khsjdkfh', 10.00, 'W7514', 2, '2011-10-05', NULL),
	(103, NULL, 'jkhdsjkfh', 10.00, 'W7514', 2, '2011-10-05', NULL),
	(104, NULL, 'some note', 10.00, 'Y2892', 1, '2011-10-06', NULL),
	(105, NULL, 'some note with URL', 10.00, 'Y2892', 1, '2011-10-06', NULL),
	(106, NULL, 'more notes', 10.00, 'Y2892', 1, '2011-10-06', NULL),
	(107, NULL, 'super notes!', 10.00, 'Y2892', 1, '2011-10-06', NULL),
	(108, NULL, 'yep', 10.00, 'Y2892', 1, '2011-10-06', NULL),
	(109, NULL, 'more more more more', 10.00, 'Y2892', 1, '2011-10-06', NULL),
	(110, NULL, 'this is one more', 10.00, 'Y2892', 1, '2011-10-06', NULL),
	(111, NULL, 'this is test', 10.00, 'V9761', 1, '2011-10-07', NULL),
	(112, NULL, 'another thing to do', 10.00, 'V9761', 2, '2011-10-07', NULL),
	(113, NULL, 'this is cool', 10.00, 'V9761', 2, '2011-10-07', NULL),
	(114, NULL, 'yes its cool', 10.00, 'V9761', 2, '2011-10-07', NULL),
	(115, NULL, 'dune', 10.00, 'Z7386', 1, '2011-10-13', NULL),
	(116, NULL, 'dune', 10.00, 'Z7386', 1, '2011-10-13', NULL),
	(117, NULL, 'dfsdf', 10.00, 'J1113', 1, '2011-10-16', NULL),
	(118, NULL, 'get more stuff', 10.00, 'J1113', 1, '2011-10-16', NULL),
	(119, NULL, 'get more stuff', 10.00, 'J1113', 1, '2011-10-16', NULL),
	(120, NULL, 'oceries, s', 10.00, 'Y8268', 1, '2011-10-17', NULL),
	(121, NULL, 'cola1', 10.00, 'C2748', 1, '2011-10-17', NULL),
	(122, NULL, 'cola2', 10.00, 'C2748', 1, '2011-10-17', NULL),
	(123, NULL, 'cola3', 10.00, 'C2748', 1, '2011-10-17', NULL),
	(124, NULL, 'cola5', 10.00, 'C2748', 1, '2011-10-17', NULL),
	(125, NULL, 'more more more', 10.00, 'C2748', 1, '2011-10-17', NULL),
	(126, NULL, 'this are more', 10.00, 'C2748', 1, '2011-10-17', NULL),
	(127, NULL, 'dune', 10.00, 'C7526', 1, '2011-10-17', NULL),
	(128, NULL, 'cola3', 10.00, 'C7526', 1, '2011-10-17', NULL),
	(129, NULL, 'cola2', 10.00, 'C7526', 1, '2011-10-17', NULL),
	(130, NULL, 'dasd', 10.00, 'U6444', 1, '2011-10-17', NULL),
	(131, NULL, 'dasdasd', 10.00, 'U6444', 1, '2011-10-17', NULL),
	(132, NULL, 'asdads', 10.00, 'U6444', 1, '2011-10-17', NULL),
	(133, NULL, 'This', 10.00, 'Q7826', 1, '2011-10-18', NULL),
	(134, NULL, 'Guo', 10.00, 'Q7826', 1, '2011-10-18', NULL),
	(135, NULL, 'YyHhh', 10.00, 'Q7826', 1, '2011-10-18', NULL),
	(136, NULL, 'Run', 10.00, 'N5646', 0, '2011-11-04', NULL),
	(137, NULL, 'buy more gas', 10.00, 'D4712', 1, '2011-11-06', NULL),
	(138, NULL, 'get more stuff', 10.00, 'D4712', 1, '2011-11-06', NULL),
	(139, NULL, 'pay bills', 10.00, 'D4712', 2, '2011-11-06', NULL),
	(140, NULL, 'dune', 10.00, 'J2661', 1, '2011-11-08', NULL),
	(141, NULL, 'dune', 10.00, 'J2661', 1, '2011-11-08', NULL),
	(142, NULL, 'cola5', 10.00, 'J2661', 1, '2011-11-08', NULL),
	(143, NULL, 'more more more', 10.00, 'Q2767', 1, '2011-11-08', NULL),
	(144, NULL, 'this are more', 10.00, 'Q2767', 1, '2011-11-08', NULL),
	(145, NULL, 'dune', 10.00, 'Q2767', 1, '2011-11-08', NULL),
	(146, NULL, 'http://www.link.com', 10.00, 'Q2767', 1, '2011-11-08', NULL),
	(147, NULL, 'jkhdsjkfh', 10.00, 'Q2767', 1, '2011-11-08', NULL),
	(148, NULL, 'cola1', 10.00, 'Q2767', 1, '2011-11-08', NULL),
	(149, NULL, 'Tttttt', 10.00, 'H7314', 0, '2011-11-08', NULL),
	(150, NULL, 'fhdfghfgh', 10.00, 'H2722', 0, '2011-11-10', NULL),
	(151, NULL, 'fhdfghfgh', 10.00, 'H2722', 0, '2011-11-10', NULL),
	(152, NULL, 'llamar a tino', 10.00, 'D7599', 1, '2011-11-14', NULL),
	(153, NULL, 'comprar vasos fiesta', 10.00, 'D7599', 1, '2011-11-14', NULL),
	(154, NULL, 'llamar a nikke', 10.00, 'D7599', 2, '2011-11-14', NULL),
	(155, NULL, 'obras publicas', 10.00, 'D7599', 2, '2011-11-14', NULL),
	(156, NULL, 'buy more gas', 10.00, 'D7599', 1, '2011-11-14', NULL),
	(157, NULL, 'oh no im running ', 10.00, 'D7599', 1, '2011-11-14', NULL),
	(158, NULL, 'oh no im running ', 10.00, 'D7599', 1, '2011-11-14', NULL),
	(159, NULL, 'call dmv', 10.00, 'A3336', 2, '2011-11-28', NULL),
	(160, NULL, 'talk to larry', 10.00, 'A3336', 2, '2011-11-28', NULL),
	(161, NULL, 'kohls', 10.00, 'A3336', 2, '2011-11-28', NULL),
	(162, NULL, 'pay mortgage', 10.00, 'A3336', 2, '2011-11-28', NULL),
	(163, NULL, 'invoice laura', 10.00, 'A3336', 2, '2011-11-28', NULL),
	(164, NULL, 'invoice relaxslim', 10.00, 'A3336', 2, '2011-11-28', NULL),
	(165, NULL, 'make check for office lease', 10.00, 'A3336', 2, '2011-11-28', NULL),
	(166, NULL, 'call fantastic coupons', 10.00, 'A3336', 2, '2011-11-28', NULL),
	(167, NULL, 'call fantastic coupons', 10.00, 'A3336', 2, '2011-11-28', NULL),
	(168, NULL, 'pick rebajar.com design options', 10.00, 'A3336', 2, '2011-11-29', NULL),
	(169, NULL, 'buy norelco blades 6885xl', 10.00, 'A3336', 2, '2011-12-01', NULL),
	(170, NULL, 'invoice laura', 10.00, 'A3336', 2, '2011-12-05', NULL),
	(171, NULL, 'cc code relaxslim', 10.00, 'A3336', 2, '2011-12-05', NULL),
	(172, NULL, 'buy more gas', 10.00, 'N9427', 1, '2011-12-12', NULL),
	(173, NULL, 'get more stuff', 10.00, 'N9427', 2, '2011-12-12', NULL),
	(174, NULL, 'pay bills', 10.00, 'N9427', 2, '2011-12-12', NULL),
	(175, NULL, 'pay bills', 10.00, 'N9427', 2, '2011-12-12', NULL),
	(176, NULL, 'buy more gas', 10.00, 'N3474', 1, '2011-12-15', 0),
	(177, NULL, 'get more stuff', 10.00, 'N3474', 1, '2011-12-15', 14),
	(178, NULL, 'oh no im running ', 10.00, 'N3474', 1, '2011-12-15', 12),
	(179, NULL, 'eee', 10.00, 'C9789', 1, '2011-12-15', NULL),
	(180, NULL, 'eee', 10.00, 'C9789', 1, '2011-12-15', NULL),
	(181, NULL, 'eee', 10.00, 'C9789', 2, '2011-12-15', NULL),
	(182, NULL, 'this is so awesome', 10.00, 'C9789', 2, '2011-12-15', NULL),
	(183, NULL, 'this is so awesome', 10.00, 'C9789', 2, '2011-12-15', NULL),
	(184, NULL, 'this is so awesome', 10.00, 'C9789', 2, '2011-12-15', NULL),
	(185, NULL, 'this is so awesome', 10.00, 'C9789', 2, '2011-12-15', NULL),
	(186, NULL, 'this is so awesome', 10.00, 'C9789', 1, '2011-12-15', NULL),
	(187, NULL, 'buy more gas', 10.00, 'N3474', 1, '2011-12-15', 11),
	(188, NULL, 'buy more gas', 10.00, 'N3474', 1, '2011-12-15', 10),
	(189, NULL, 'buy more gas', 10.00, 'N3474', 1, '2011-12-15', 9),
	(190, NULL, 'pay bills', 10.00, 'N3474', 1, '2011-12-15', 8),
	(191, NULL, 'dfsdf', 10.00, 'N3474', 1, '2011-12-15', 7),
	(192, NULL, 'pay bills', 10.00, 'N3474', 1, '2011-12-15', 6),
	(193, NULL, 'buy more gas', 10.00, 'N3474', 1, '2011-12-15', 5),
	(194, NULL, 'buy calefacion', 10.00, 'N3474', 1, '2011-12-15', 1),
	(195, NULL, 'buy calefacion', 10.00, 'N3474', 1, '2011-12-15', 4),
	(196, NULL, 'this is so awesome', 10.00, 'N3474', 1, '2011-12-15', 3),
	(197, NULL, 'this is so awesome', 10.00, 'N3474', 1, '2011-12-15', 2),
	(198, NULL, 'this is so awesome', 10.00, 'N3474', 1, '2011-12-15', 13),
	(199, NULL, 'eee', 10.00, 'N3474', 1, '2011-12-15', 15),
	(200, NULL, '101', 10.00, 'Z4929', 1, '2011-12-15', 1),
	(201, NULL, '102', 10.00, 'Z4929', 1, '2011-12-15', 2),
	(202, NULL, '103', 10.00, 'Z4929', 1, '2011-12-15', 3),
	(203, NULL, '104', 10.00, 'Z4929', 2, '2011-12-15', NULL),
	(204, NULL, '105', 10.00, 'Z4929', 2, '2011-12-15', NULL),
	(205, NULL, 'buy more gas', 10.00, 'Z4929', 2, '2011-12-15', NULL),
	(206, NULL, 'buy more gas', 10.00, 'Z4929', 2, '2011-12-15', NULL),
	(207, NULL, 'buy more gas', 10.00, 'Z4929', 2, '2011-12-15', NULL),
	(208, NULL, 'get more stuff', 10.00, 'Z4929', 2, '2011-12-16', NULL),
	(209, NULL, 'get more stuff', 10.00, 'Z4929', 2, '2011-12-16', NULL),
	(210, NULL, '104', 10.00, 'Z4929', 1, '2011-12-16', 0),
	(211, NULL, '105', 10.00, 'Z4929', 1, '2011-12-16', 4),
	(212, NULL, 'buy more gas', 10.00, 'P4126', 2, '2011-12-16', 2),
	(213, NULL, 'get more stuff', 10.00, 'P4126', 2, '2011-12-16', 1),
	(214, NULL, 'oh no im running ', 10.00, 'P4126', 2, '2011-12-16', 3),
	(215, NULL, 'pay bills', 10.00, 'P4126', 2, '2011-12-16', 0),
	(216, NULL, 'buy more gas', 10.00, 'P4126', 2, '2011-12-16', 1),
	(217, NULL, '105', 10.00, 'P4126', 2, '2011-12-16', NULL),
	(218, NULL, 'pay bills', 10.00, 'P4126', 2, '2011-12-16', 5),
	(219, NULL, 'go to movies', 10.00, 'P4126', 2, '2011-12-16', 6),
	(220, NULL, 'this is so awesome', 10.00, 'P4126', 2, '2011-12-16', 4),
	(221, NULL, '102', 10.00, 'P4126', 2, '2011-12-16', 0),
	(222, NULL, '103', 10.00, 'P4126', 2, '2011-12-16', 2),
	(223, NULL, '104', 10.00, 'P4126', 2, '2011-12-16', 3),
	(224, NULL, '105', 10.00, 'P4126', 2, '2011-12-16', 4),
	(225, NULL, '106', 10.00, 'P4126', 2, '2011-12-16', 5),
	(226, NULL, '107', 10.00, 'P4126', 2, '2011-12-16', 6),
	(227, NULL, '103', 10.00, 'P4126', 2, '2011-12-16', 0),
	(228, NULL, '104', 10.00, 'P4126', 2, '2011-12-16', 2),
	(229, NULL, '105', 10.00, 'P4126', 2, '2011-12-16', 3),
	(230, NULL, '103', 10.00, 'P4126', 2, '2011-12-16', 1),
	(231, NULL, 'this is so awesome', 10.00, 'P4126', 2, '2011-12-16', 3),
	(232, NULL, 'this is so awesome', 10.00, 'P4126', 2, '2011-12-16', 3),
	(233, NULL, 'this is so awesome', 10.00, 'P4126', 2, '2011-12-16', 3),
	(234, NULL, 'buy calefacion', 10.00, 'P4126', 2, '2011-12-16', 3),
	(235, NULL, 'this is so awesome', 10.00, 'P4126', 2, '2011-12-16', 3),
	(236, NULL, 'this is so awesome', 10.00, 'P4126', 2, '2011-12-16', 6),
	(237, NULL, 'this is so awesome', 10.00, 'P4126', 2, '2011-12-16', 7),
	(238, NULL, 'buy calefacion', 10.00, 'P4126', 2, '2011-12-16', 7),
	(239, NULL, 'this is so awesome', 10.00, 'P4126', 2, '2011-12-16', 7),
	(240, NULL, '103', 10.00, 'P4126', 2, '2011-12-16', 7),
	(241, NULL, 'this is so awesome', 10.00, 'P4126', 2, '2011-12-16', 11),
	(242, NULL, 'this is so awesome', 10.00, 'P4126', 2, '2011-12-16', 5),
	(243, NULL, 'buy calefacion', 10.00, 'P4126', 2, '2011-12-16', 6),
	(244, NULL, '104', 10.00, 'P4126', 2, '2011-12-16', 7),
	(245, NULL, '107', 10.00, 'P4126', 2, '2011-12-16', 8),
	(246, NULL, 'this is so awesome', 10.00, 'P4126', 2, '2011-12-16', 9),
	(247, NULL, 'this is so awesome', 10.00, 'P4126', 2, '2011-12-16', 9),
	(248, NULL, 'this is so awesome', 10.00, 'P4126', 2, '2011-12-16', 9),
	(249, NULL, 'this is so awesome', 10.00, 'P4126', 2, '2011-12-16', 9),
	(250, NULL, 'this is so awesome', 10.00, 'P4126', 2, '2011-12-16', 13),
	(251, NULL, 'this is so awesome', 10.00, 'P4126', 2, '2011-12-16', 13),
	(252, NULL, 'this is so awesome', 10.00, 'P4126', 2, '2011-12-16', 13),
	(253, NULL, 'this is so awesome', 10.00, 'P4126', 2, '2011-12-16', 13),
	(254, NULL, 'this is so awesome', 10.00, 'P4126', 2, '2011-12-16', 0),
	(255, NULL, 'this is so awesome', 10.00, 'P4126', 2, '2011-12-16', 2),
	(256, NULL, 'buy calefacion', 10.00, 'P4126', 2, '2011-12-16', 2),
	(257, NULL, 'this is so awesome', 10.00, 'P4126', 2, '2011-12-16', 5),
	(258, NULL, 'this is so awesome', 10.00, 'P4126', 2, '2011-12-16', 5),
	(259, NULL, 'this is so awesome', 10.00, 'P4126', 2, '2011-12-16', 7),
	(260, NULL, 'this is so awesome', 10.00, 'P4126', 2, '2011-12-16', 2),
	(261, NULL, 'this is so awesome', 10.00, 'P4126', 2, '2011-12-16', 3),
	(262, NULL, 'buy calefacion', 10.00, 'P4126', 2, '2011-12-16', 4),
	(263, NULL, 'buy calefacion', 10.00, 'P4126', 2, '2011-12-16', 1),
	(264, NULL, 'this is so awesome', 10.00, 'P4126', 2, '2011-12-16', 0),
	(265, NULL, 'this is so awesome', 10.00, 'P4126', 2, '2011-12-16', 5),
	(266, NULL, 'this is so awesome', 10.00, 'P4126', 2, '2011-12-16', 5),
	(267, NULL, 'this is so awesome', 10.00, 'P4126', 2, '2011-12-16', 5),
	(268, NULL, 'this is so awesome', 10.00, 'P4126', 2, '2011-12-16', 5),
	(269, NULL, 'this is so awesome', 10.00, 'P4126', 2, '2011-12-16', 5),
	(270, NULL, 'this is so awesome', 10.00, 'P4126', 2, '2011-12-16', 5),
	(271, NULL, 'this is so awesome', 10.00, 'P4126', 2, '2011-12-16', 5),
	(272, NULL, 'this is so awesome', 10.00, 'P4126', 2, '2011-12-16', 1),
	(273, NULL, '104', 10.00, 'P4126', 2, '2011-12-16', 1),
	(274, NULL, 'eee', 10.00, 'P4126', 2, '2011-12-16', 1),
	(275, NULL, '105', 10.00, 'P4126', 2, '2011-12-16', 1),
	(276, NULL, 'this is so awesome', 10.00, 'P4126', 2, '2011-12-16', 1),
	(277, NULL, 'this is so awesome', 10.00, 'P4126', 2, '2011-12-16', 1),
	(278, NULL, 'this is so awesome', 10.00, 'P4126', 2, '2011-12-16', 4),
	(279, NULL, 'eee', 10.00, 'P4126', 2, '2011-12-16', 0),
	(280, NULL, 'eee', 10.00, 'P4126', 2, '2011-12-16', 0),
	(281, NULL, 'eee', 10.00, 'P4126', 2, '2011-12-16', 0),
	(282, NULL, '104', 10.00, 'P4126', 2, '2011-12-16', 0),
	(283, NULL, 'buy calefacion', 10.00, 'P4126', 2, '2011-12-16', 0),
	(284, NULL, 'this is so awesome', 10.00, 'P4126', 1, '2011-12-16', 0),
	(285, NULL, '104', 10.00, 'P4126', 2, '2011-12-16', 1),
	(286, NULL, '104', 10.00, 'P4126', 2, '2011-12-16', 1),
	(287, NULL, '105', 10.00, 'P4126', 2, '2011-12-16', 1),
	(288, NULL, 'this is so awesome', 10.00, 'P4126', 2, '2011-12-16', 1),
	(289, NULL, 'this is so awesome', 10.00, 'P4126', 2, '2011-12-16', 1),
	(290, NULL, 'this is so awesome', 10.00, 'P4126', 2, '2011-12-16', 1),
	(291, NULL, 'this is so awesome', 10.00, 'P4126', 2, '2011-12-16', 1),
	(292, NULL, 'this is so awesome', 10.00, 'P4126', 2, '2011-12-16', 1),
	(293, NULL, 'this is so awesome', 10.00, 'P4126', 2, '2011-12-16', 1),
	(294, NULL, 'this is so awesome', 10.00, 'P4126', 1, '2011-12-16', 2),
	(295, NULL, 'this is so awesome', 10.00, 'P4126', 1, '2011-12-16', 3),
	(296, NULL, 'paola', 10.00, 'P4126', 1, '2011-12-17', 4),
	(297, NULL, 'buy more gas', 10.00, 'P3451', 1, '2012-01-07', 0),
	(298, NULL, 'this is a nest', 10.00, 'X6466', 2, '2012-01-07', 0),
	(299, NULL, 'this is a nest', 10.00, 'X6466', 2, '2012-01-07', 0),
	(300, NULL, 'this is a nest', 10.00, 'X6466', 1, '2012-01-07', 1),
	(301, NULL, 'this is a nest', 10.00, 'X6466', 2, '2012-01-07', 0),
	(302, NULL, 'this is a nest', 10.00, 'X6466', 2, '2012-01-07', 0),
	(303, NULL, 'this is a nest', 10.00, 'X6466', 1, '2012-01-07', 1),
	(304, NULL, 'this is a nest', 10.00, 'X6466', 2, '2012-01-07', 1),
	(305, NULL, 'this is a nest', 10.00, 'X6466', 2, '2012-01-07', 1),
	(306, NULL, 'buy more gas', 10.00, 'P3451', 2, '2012-01-07', 2),
	(307, NULL, 'oh no im running ', 10.00, 'P3451', 2, '2012-01-07', 3),
	(308, NULL, 'buy more gas', 10.00, 'P3451', 1, '2012-01-07', 2),
	(309, NULL, 'this is a nest', 10.00, 'X6466', 1, '2012-01-07', 2),
	(310, NULL, 'this is a nest', 10.00, 'X6466', 1, '2012-01-07', 2),
	(311, NULL, 'this is a nest', 10.00, 'X6466', 2, '2012-01-07', 2),
	(312, NULL, 'this is a nest', 10.00, 'P3451', 1, '2012-01-07', 3),
	(313, NULL, 'this is a nest', 10.00, 'P3451', 1, '2012-01-07', 1),
	(314, NULL, 'this is a nest', 10.00, 'X6466', 2, '2012-01-07', 10),
	(315, NULL, 'this is a nest', 10.00, 'X6466', 2, '2012-01-07', 10),
	(316, NULL, 'this is a nest', 10.00, 'X6466', 2, '2012-01-07', 10),
	(317, NULL, 'buy more gas', 10.00, 'X6466', 1, '2012-01-07', 3),
	(318, NULL, 'oh no im running ', 10.00, 'X6466', 1, '2012-01-07', 3),
	(319, NULL, 'oh no im running ', 10.00, 'X6466', 1, '2012-01-07', 3),
	(320, NULL, 'eee', 10.00, 'X6466', 1, '2012-01-07', 6),
	(321, NULL, 'this is so awesome but i cant get this to work!', 10.00, 'X6466', 1, '2012-01-07', 7),
	(322, NULL, 'buy more gas', 10.00, 'X6466', 1, '2012-01-07', 8),
	(323, NULL, 'this is a nest', 10.00, 'H5739', 0, '2012-01-07', -1),
	(324, NULL, 'this is so awesome', 10.00, 'E4182', 1, '2012-01-07', 0),
	(325, NULL, 'buy calefacion', 10.00, 'E4182', 1, '2012-01-07', 4),
	(326, NULL, 'buy calefacion', 10.00, 'E4182', 2, '2012-01-07', 2),
	(327, NULL, 'buy calefacion', 10.00, 'E4182', 2, '2012-01-07', 3),
	(328, NULL, 'buy calefacion', 10.00, 'E4182', 2, '2012-01-07', 1),
	(329, NULL, '813-466-8659', 10.00, 'V5155', 1, '2012-01-10', 2),
	(330, NULL, 'buy more gas', 10.00, 'V5155', 2, '2012-01-10', 3),
	(331, NULL, 'buy more gas', 10.00, 'V5155', 2, '2012-01-10', 4),
	(332, NULL, 'get more stuff', 10.00, 'V5155', 1, '2012-01-10', 0),
	(333, NULL, 'buy more gas', 10.00, 'V5155', 1, '2012-01-11', 1),
	(334, NULL, 'buy more gas', 10.00, 'X8435', 1, '2012-01-11', 0),
	(335, NULL, 'oh no im running ', 10.00, 'X8435', 1, '2012-01-11', 2),
	(336, NULL, 'this is so awesome', 10.00, 'B5435', 1, '2012-01-11', 0),
	(337, NULL, 'buy calefacion', 10.00, 'B5435', 1, '2012-01-11', 1),
	(338, NULL, 'buy calefacion', 10.00, 'B5435', 1, '2012-01-11', 2),
	(339, NULL, 'pagar cuenhtas', 10.00, 'B5435', 1, '2012-01-11', 3),
	(340, NULL, 'buy calefacion', 10.00, 'B5435', 1, '2012-01-11', 5),
	(341, NULL, 'elance feedback kerry?', 10.00, 'B5435', 1, '2012-01-11', 8),
	(342, NULL, 'buy more gas', 10.00, 'U1126', 1, '2012-01-11', -1),
	(343, NULL, 'oh no im running ', 10.00, 'U1126', 1, '2012-01-11', -1),
	(344, NULL, 'get more stuff', 10.00, 'U1126', 1, '2012-01-11', -1),
	(345, NULL, 'buy more gas', 10.00, 'V4611', 1, '2012-01-11', 0),
	(346, NULL, 'buy more gas', 10.00, 'V4611', 1, '2012-01-11', 4),
	(347, NULL, 'buy more gas', 10.00, 'V4611', 1, '2012-01-11', 3),
	(348, NULL, 'buy more gas', 10.00, 'V4611', 1, '2012-01-11', 5),
	(349, NULL, 'buy more gas', 10.00, 'V4611', 1, '2012-01-11', 6),
	(350, NULL, 'buy more gas', 10.00, 'V4611', 1, '2012-01-11', 7),
	(351, NULL, 'buy more gas', 10.00, 'V4611', 1, '2012-01-11', 8),
	(352, NULL, 'buy more gas', 10.00, 'V4611', 1, '2012-01-11', 9),
	(353, NULL, 'buy more gas', 10.00, 'V4611', 1, '2012-01-11', 10),
	(354, NULL, 'buy more gas', 10.00, 'V4611', 1, '2012-01-11', 1),
	(355, NULL, 'buy more gas', 10.00, 'V4611', 1, '2012-01-11', 2),
	(356, NULL, 'this is so awesome<br/>', 10.00, 'E4182', 2, '2012-01-11', 4),
	(357, NULL, 'this is so awesome', 10.00, 'E4182', 1, '2012-01-11', 2),
	(358, NULL, 'this is so awesome', 10.00, 'E4182', 1, '2012-01-11', 3),
	(359, NULL, 'paolas phone', 10.00, 'E7424', 1, '2012-01-11', -1),
	(360, NULL, 'hamburguer', 10.00, 'E7424', 1, '2012-01-11', -1),
	(361, NULL, 'nuggets', 10.00, 'E7424', 1, '2012-01-11', -1),
	(362, NULL, 'buy more gas', 10.00, 'B5435', 1, '2012-01-11', 6),
	(363, NULL, 'oh no im running ', 10.00, 'B5435', 1, '2012-01-11', 7),
	(364, NULL, 'dfsdf', 10.00, 'B5435', 1, '2012-01-11', 4),
	(365, NULL, 'buy more gas before my car runs into issues!', 10.00, 'X8435', 1, '2012-01-11', 1),
	(366, NULL, 'pay bills', 10.00, 'E4182', 1, '2012-01-11', 1),
	(367, NULL, 'this is what myt list contains!', 10.00, 'X4639', 1, '2012-01-12', -1),
	(368, NULL, 'and I need to do this', 10.00, 'X4639', 1, '2012-01-12', -1),
	(369, NULL, 'one more thing', 10.00, 'X4639', 1, '2012-01-12', 1),
	(370, NULL, 'this is so awesome', 10.00, 'C9621', 1, '2012-01-12', 1),
	(371, NULL, 'buy calefacion', 10.00, 'C9621', 1, '2012-01-12', 2),
	(372, NULL, 'buy more gas', 10.00, 'Q4672', 1, '2012-01-12', -1),
	(373, NULL, 'oh no im running ', 10.00, 'Q4672', 1, '2012-01-12', -1),
	(374, NULL, 'this', 10.00, 'C9621', 1, '2012-01-12', 0),
	(375, NULL, 'more of this', 10.00, 'C9621', 1, '2012-01-12', 3),
	(376, NULL, 'this is so awesome', 10.00, 'V9735', 1, '2012-01-12', -1),
	(377, NULL, 'and I need to do this', 10.00, 'V9735', 1, '2012-01-12', 0),
	(378, NULL, 'buy calefacion', 10.00, 'V9735', 1, '2012-01-12', 0),
	(379, NULL, 'and I need to do this', 10.00, 'U3799', 1, '2012-01-12', -1),
	(380, NULL, 'this is so awesome', 10.00, 'W6875', 1, '2012-01-12', -1),
	(381, NULL, '104', 10.00, 'E7534', 2, '2012-01-12', 5),
	(382, NULL, 'buy calefacion', 10.00, 'E7534', 2, '2012-01-12', 6),
	(383, NULL, 'this is so awesome', 10.00, 'E7534', 2, '2012-01-12', 0),
	(384, NULL, 'this is so awesome', 10.00, 'E7534', 2, '2012-01-12', 1),
	(385, NULL, 'and I need to do this', 10.00, 'E7534', 2, '2012-01-12', 2),
	(386, NULL, 'this is so awesome', 10.00, 'E7534', 2, '2012-01-12', 7),
	(387, NULL, 'and I need to do this', 10.00, 'E7534', 1, '2012-01-12', 9),
	(388, NULL, '103', 10.00, 'E7534', 2, '2012-01-12', 4),
	(389, NULL, 'this is so awesome', 10.00, 'E7534', 2, '2012-01-12', 3),
	(390, NULL, 'one more thing', 10.00, 'E7534', 2, '2012-01-12', 8),
	(391, NULL, 'buy calefacion', 10.00, 'E7534', 1, '2012-01-12', 9),
	(392, NULL, 'and I need to do this', 10.00, 'E7534', 1, '2012-01-12', 10),
	(393, NULL, 'this is what myt list contains!', 10.00, 'E7534', 1, '2012-01-12', 10),
	(394, NULL, 'and I need to do this', 10.00, 'E7534', 1, '2012-01-12', 12),
	(395, NULL, 'buy calefacion', 10.00, 'E7534', 1, '2012-01-12', 12),
	(396, NULL, 'buy calefacion', 10.00, 'D4812', 2, '2012-01-12', -1),
	(397, NULL, 'this is so awesome', 10.00, 'D4812', 1, '2012-01-12', -1),
	(398, NULL, 'write all your ideas for 2 weeks', 10.00, 'E4194', 0, '2012-01-12', 0),
	(399, NULL, 'create a list of your top two', 10.00, 'E4194', 0, '2012-01-12', 2),
	(400, NULL, 'gather feedback on twitter', 10.00, 'E4194', 0, '2012-01-12', 1),
	(401, NULL, 'buy more gas', 10.00, 'Q4672', 1, '2012-01-13', 1),
	(402, NULL, 'oh no im running ', 10.00, 'Q4672', 1, '2012-01-13', 1),
	(403, NULL, 'get more stuff', 10.00, 'Q4672', 1, '2012-01-13', 1),
	(404, NULL, 'buy more gas', 10.00, 'Q4672', 1, '2012-01-13', 1),
	(405, NULL, 'get more stuff', 10.00, 'Q4672', 1, '2012-01-13', 1),
	(406, NULL, 'this is so awesome', 10.00, 'T3716', 1, '2012-01-13', -1),
	(407, NULL, 'buy calefacion', 10.00, 'T3716', 1, '2012-01-13', -1),
	(408, NULL, 'this is what myt list contains!', 10.00, 'T3716', 1, '2012-01-13', -1),
	(409, NULL, 'this is so awesome', 10.00, 'T3716', 1, '2012-01-13', -1),
	(410, NULL, 'one more thing', 10.00, 'T3716', 1, '2012-01-13', -1),
	(411, NULL, 'gather feedback on twitter', 10.00, 'T3716', 1, '2012-01-13', -1),
	(412, NULL, 'this is so awesome<br/>', 10.00, 'T3716', 1, '2012-01-13', -1),
	(413, NULL, 'one more thing', 10.00, 'T3716', 1, '2012-01-13', -1),
	(414, NULL, 'create a list of your top two', 10.00, 'T3716', 1, '2012-01-13', -1),
	(415, NULL, 'this is so awesome', 10.00, 'Q2944', 1, '2012-01-13', -1),
	(416, NULL, 'buy calefacion', 10.00, 'Q2944', 1, '2012-01-13', 0),
	(417, NULL, 'buy calefacion', 10.00, 'G5692', 1, '2012-01-13', -1),
	(418, NULL, 'one more thing', 10.00, 'G5692', 1, '2012-01-13', -1),
	(419, NULL, 'this is what myt list contains!', 10.00, 'G5692', 1, '2012-01-13', -1),
	(420, NULL, 'buy more gas', 10.00, 'B7987', 1, '2012-01-13', 0),
	(421, NULL, 'oh no im running ', 10.00, 'B7987', 1, '2012-01-13', 2),
	(422, NULL, 'get more stuff', 10.00, 'B7987', 1, '2012-01-13', 3),
	(423, NULL, 'oh no im running ', 10.00, 'B7987', 1, '2012-01-13', 1),
	(424, NULL, 'this is a nest', 10.00, 'X1868', 1, '2012-01-13', -1),
	(425, NULL, 'this is a nest', 10.00, 'X1868', 1, '2012-01-13', -1),
	(426, NULL, 'this is a nest', 10.00, 'X1868', 1, '2012-01-13', -1),
	(427, NULL, 'this is so awesome', 10.00, 'G1143', 1, '2012-01-13', -1),
	(428, NULL, 'this is so awesome', 10.00, 'G1143', 1, '2012-01-13', -1),
	(429, NULL, 'buy more gas', 10.00, 'G1143', 1, '2012-01-13', 1),
	(430, NULL, 'buy more gas', 10.00, 'G1143', 1, '2012-01-13', 1),
	(431, NULL, 'this is some stuff!', 10.00, 'G1143', 1, '2012-01-13', 3),
	(432, NULL, 'buy more gas', 10.00, 'S3373', 1, '2012-01-20', -1),
	(433, NULL, 'buy more gas', 10.00, 'S3373', 1, '2012-01-20', -1),
	(434, NULL, 'oh no im running ', 10.00, 'S3373', 1, '2012-01-20', 0),
	(435, NULL, 'buy more gas', 10.00, 'S3373', 1, '2012-01-20', -1),
	(436, NULL, 'buy more gas', 10.00, 'S3373', 1, '2012-01-20', -1),
	(437, NULL, 'pay bills', 10.00, 'S3373', 1, '2012-01-20', 1),
	(438, NULL, 'get more stuff', 10.00, 'S3373', 1, '2012-01-20', 1),
	(439, NULL, 'oh no im running ', 10.00, 'S3373', 1, '2012-01-20', 1),
	(440, NULL, 'buy more gas', 10.00, 'S3373', 1, '2012-01-20', -1),
	(441, NULL, 'oh no im running ', 10.00, 'S3373', 1, '2012-01-20', -1),
	(442, NULL, 'buy more gas', 10.00, 'S3373', 1, '2012-01-20', -1),
	(443, NULL, 'buy more gas', 10.00, 'S3373', 1, '2012-01-20', -1),
	(444, NULL, 'oh no im running ', 10.00, 'S3373', 1, '2012-01-20', -1),
	(445, NULL, 'buy more gas', 10.00, 'S3373', 1, '2012-01-20', -1),
	(446, NULL, 'oh no im running ', 10.00, 'S3373', 1, '2012-01-20', -1),
	(447, NULL, 'buy more gas', 10.00, 'C9956', 1, '2012-01-20', -1),
	(448, NULL, 'hello', 10.00, 'Q5836', 0, '2015-01-07', -1),
	(449, NULL, 'fdgdsfgsdfgdsg', 10.00, 'Q5836', 0, '2015-01-07', -1);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;


-- Dumping structure for table sugarpad.posts_h
CREATE TABLE IF NOT EXISTS `posts_h` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `lid` varchar(10) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=56 DEFAULT CHARSET=latin1;

-- Dumping data for table sugarpad.posts_h: 17 rows
/*!40000 ALTER TABLE `posts_h` DISABLE KEYS */;
INSERT INTO `posts_h` (`id`, `lid`, `name`) VALUES
	(1, 'V5155', 'Why Ron Paul loves this!'),
	(13, 'U1126', 'This is my list!!'),
	(11, 'X8435', 'Things to do today!'),
	(51, 'Q2944', 'this is a very long title'),
	(9, 'B5435', 'pizza'),
	(50, 'T3716', 'NIkke NIkkes'),
	(49, 'D4812', 'new title here!'),
	(14, 'V4611', 'Nikkes List! #1'),
	(38, 'E4182', 'oh no no no!'),
	(52, 'G5692', 'I dont want to!'),
	(53, 'B7987', 'test'),
	(54, 'X1868', 'latest listita!'),
	(55, 'G1143', 'this is a crazy title'),
	(25, 'C9621', 'sdfsdf'),
	(28, 'V9735', 'Another list of glory'),
	(30, 'U3799', 'gfjgf'),
	(48, 'E7534', 'this is the best one!b');
/*!40000 ALTER TABLE `posts_h` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
