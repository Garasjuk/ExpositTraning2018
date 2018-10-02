-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 02, 2018 at 09:53 PM
-- Server version: 5.5.25
-- PHP Version: 5.3.13

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `carriage`
--

-- --------------------------------------------------------

--
-- Table structure for table `about`
--

CREATE TABLE IF NOT EXISTS `about` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `we_offer` text,
  `contact` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `about`
--

INSERT INTO `about` (`id`, `we_offer`, `contact`) VALUES
(1, 'Short-term car rental with the possibility of ending the trip at convenient points for drivers and places marked with a parking sign.We work on the one-way system', 'Address: st. Gorkogo 89, Grodno 230000');

-- --------------------------------------------------------

--
-- Table structure for table `advert`
--

CREATE TABLE IF NOT EXISTS `advert` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_marka` int(11) DEFAULT NULL,
  `id_model` int(11) DEFAULT NULL,
  `year_of_issue` varchar(10) DEFAULT NULL,
  `gov_number` varchar(20) DEFAULT NULL,
  `mileage` varchar(15) DEFAULT NULL,
  `seats` int(11) DEFAULT NULL,
  `latitude` varchar(10) DEFAULT NULL,
  `longitude` varchar(10) DEFAULT NULL,
  `id_transmission` int(11) DEFAULT NULL,
  `id_body` int(11) DEFAULT NULL,
  `id_drive` int(11) DEFAULT NULL,
  `id_engine` int(11) DEFAULT NULL,
  `id_fuel` int(11) DEFAULT NULL,
  `consumption` varchar(10) DEFAULT NULL,
  `damage` varchar(500) DEFAULT NULL,
  `accessory` varchar(200) DEFAULT NULL,
  `insurance` varchar(100) DEFAULT NULL,
  `cena` varchar(25) DEFAULT NULL,
  `text` varchar(500) DEFAULT NULL,
  `date_registration` date DEFAULT NULL,
  `active` int(11) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `advert`
--

INSERT INTO `advert` (`id`, `id_marka`, `id_model`, `year_of_issue`, `gov_number`, `mileage`, `seats`, `latitude`, `longitude`, `id_transmission`, `id_body`, `id_drive`, `id_engine`, `id_fuel`, `consumption`, `damage`, `accessory`, `insurance`, `cena`, `text`, `date_registration`, `active`, `id_user`) VALUES
(1, 1, 1, '2005', '4433 XP ', '100000', 5, '53.6594', '23.8367', 1, 1, 1, 1, 1, '5.6', 'Minor Damage ', 'no', 'no', '100', 'good car', '2018-07-09', 1, 3),
(2, 2, 4, '2010', '4567 PF', '350000', 4, '53.6607', '23.8153', 2, 2, 2, 2, 2, '7.5', 'Minor Damage ', 'Convenience Package', 'AUTO-CASCO', '1234', 'dbgfgbgf', '2018-08-05', 1, 3),
(3, 1, 1, '2010', '456RT-2', '450000', 3, '53.6566', '23.8302', 1, 1, 1, 1, 1, '10', 'Minor Damage ', 'Sport Package, 19-inch wheels etc', 'AUTO-CASCO', '23', 'qw', '2018-08-07', 1, 3),
(4, 3, 7, '2012', 'B-453SW', ' 150000', 4, '53.6906', '23.8243', 1, 1, 1, 1, 1, '5', 'Minor Damage ', ' Driver Assistance Package', 'AUTO-CASCO', '43', '33eew', '2018-08-08', 1, 2),
(5, 2, 4, '1987', 'D-546IT', '300000', 2, '53.6769', '23.8020', 1, 1, 1, 1, 1, ' 6.5', 'Minor Damage ', 'Dynamic Handling Package', 'AUTO-CASCO', '33', '4ewqewq', '2018-08-08', 1, 2),
(6, 5, 14, '2018', 'R-465TG', ' 250000', 4, '53.6984', '23.8575', 1, 1, 1, 1, 1, ' 9.5', 'Minor Damage ', 'Premium Sound Package', 'AUTO-CASCO', '555', 'rwe', '2018-08-08', 1, 2),
(7, 5, 13, '1999', '4rfr5r', '250000', 5, '53.6120', '23.9190', 2, 5, 1, 1, 2, ' ', ' ', ' ', ' ', '345', 'terterte', '2018-09-27', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `body`
--

CREATE TABLE IF NOT EXISTS `body` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `body` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `body`
--

INSERT INTO `body` (`id`, `body`) VALUES
(1, 'sedan'),
(2, 'cabriolet'),
(3, 'compartment'),
(4, 'jeep'),
(5, 'crossover');

-- --------------------------------------------------------

--
-- Table structure for table `calendar`
--

CREATE TABLE IF NOT EXISTS `calendar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_advert` int(11) DEFAULT NULL,
  `calendar` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `category`) VALUES
(1, 'A'),
(2, 'B'),
(3, 'AB'),
(4, 'C'),
(5, 'BC'),
(6, 'ABC'),
(7, 'AC'),
(8, 'E'),
(9, 'BCE'),
(10, 'CE'),
(11, 'ABCE'),
(12, 'D'),
(13, 'BD'),
(14, 'CD'),
(15, 'DE'),
(16, 'CDE'),
(17, 'BCDE'),
(18, 'ABCDE');

-- --------------------------------------------------------

--
-- Table structure for table `drive`
--

CREATE TABLE IF NOT EXISTS `drive` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `drive` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `drive`
--

INSERT INTO `drive` (`id`, `drive`) VALUES
(1, 'Front'),
(2, 'Rear'),
(3, 'Full');

-- --------------------------------------------------------

--
-- Table structure for table `engine`
--

CREATE TABLE IF NOT EXISTS `engine` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `engine` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `engine`
--

INSERT INTO `engine` (`id`, `engine`) VALUES
(1, 'Combustion engine'),
(2, 'Electrical engine');

-- --------------------------------------------------------

--
-- Table structure for table `fuel`
--

CREATE TABLE IF NOT EXISTS `fuel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fuel` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `fuel`
--

INSERT INTO `fuel` (`id`, `fuel`) VALUES
(1, 'Diesel'),
(2, 'Petrol'),
(3, 'Gas'),
(4, 'Gas / Petrol'),
(5, 'Electric');

-- --------------------------------------------------------

--
-- Table structure for table `marka`
--

CREATE TABLE IF NOT EXISTS `marka` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `marka` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `marka`
--

INSERT INTO `marka` (`id`, `marka`) VALUES
(1, 'Mersedes'),
(2, 'BMW'),
(3, 'Volvo'),
(4, 'Audi'),
(5, 'Honda'),
(6, 'Reno');

-- --------------------------------------------------------

--
-- Table structure for table `model`
--

CREATE TABLE IF NOT EXISTS `model` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_marka` int(11) DEFAULT NULL,
  `model` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `model`
--

INSERT INTO `model` (`id`, `id_marka`, `model`) VALUES
(1, 1, 'CL 500'),
(2, 1, 'Maclaren'),
(3, 2, '3'),
(4, 2, '5'),
(5, 2, '7'),
(6, 3, 's40'),
(7, 3, 's60'),
(8, 4, 'A4'),
(9, 4, 'A6'),
(10, 4, 'A8'),
(11, 4, 'A5'),
(12, 4, 'S8'),
(13, 5, 'Civic'),
(14, 5, 'Accord'),
(15, 6, 'Megane'),
(16, 6, 'Laguna');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_advert` int(11) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `date_order` date DEFAULT NULL,
  `date_registration` date DEFAULT NULL,
  `cena` int(11) DEFAULT NULL,
  `active` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `id_advert`, `id_user`, `date_order`, `date_registration`, `cena`, `active`) VALUES
(3, 6, 3, '2018-08-09', '2018-08-11', 123, 1),
(4, 6, 3, '2018-08-15', '2018-08-16', 100, 2),
(5, 2, 13, '2018-08-24', '2018-08-11', 0, 0),
(6, 6, 13, '2018-08-17', '2018-08-08', 0, 1),
(8, 4, 3, '2018-08-27', '2018-08-15', 50, 2),
(9, 6, 18, '2018-09-27', '2018-09-24', 700, 1),
(10, 4, 20, '2018-09-20', '2018-09-25', 0, -1),
(11, 3, 20, '2018-09-29', '2018-09-25', 150, -2),
(12, 5, 20, '2018-09-30', '2018-09-25', 50, 1);

-- --------------------------------------------------------

--
-- Table structure for table `photo`
--

CREATE TABLE IF NOT EXISTS `photo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_advert` int(11) DEFAULT NULL,
  `photo` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=24 ;

--
-- Dumping data for table `photo`
--

INSERT INTO `photo` (`id`, `id_advert`, `photo`) VALUES
(1, 1, 'static/photo/3.jpg'),
(2, 1, 'static/photo/4.jpg'),
(3, 1, 'static/photo/5.jpg'),
(4, 1, 'static/photo/6.jpg'),
(5, 1, 'static/photo/7.jpg'),
(6, 2, 'static/photo/11.jpg'),
(7, 2, 'static/photo/12.jpg'),
(8, 2, 'static/photo/13.jpg'),
(9, 3, 'static/photo/Mersedes_CL_500.jpg'),
(10, 4, 'static/photo/Volvo_s60_1.jpg'),
(11, 4, 'static/photo/Volvo_s60_2.jpg'),
(12, 4, 'static/photo/Volvo_s60_3.jpg'),
(13, 4, 'static/photo/Volvo_s60_4.jpg'),
(14, 5, 'static/photo/BMW_5_1.jpg'),
(15, 5, 'static/photo/BMW_5_2.jpg'),
(16, 5, 'static/photo/BMW_5_3.jpg'),
(17, 5, 'static/photo/BMW_5_4.jpg'),
(18, 6, 'static/photo/Honda_accord_1.jpg'),
(19, 6, 'static/photo/Honda_accord_2.jpg'),
(20, 6, 'static/photo/Honda_accord_3.jpg'),
(21, 2, 'static/photo/14.jpg'),
(22, 2, 'static/photo/15.jpg'),
(23, 2, 'static/photo/16.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE IF NOT EXISTS `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(20) NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `role`) VALUES
(1, 'Administrator'),
(2, 'Tenant'),
(3, 'Landlord');

-- --------------------------------------------------------

--
-- Table structure for table `transmission`
--

CREATE TABLE IF NOT EXISTS `transmission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transmission` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `transmission`
--

INSERT INTO `transmission` (`id`, `transmission`) VALUES
(1, 'Automatic'),
(2, 'Manual');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_name` varchar(30) DEFAULT NULL,
  `first_name` varchar(30) DEFAULT NULL,
  `midle_name` varchar(30) DEFAULT NULL,
  `series_passport` varchar(4) DEFAULT NULL,
  `number_passport` int(11) DEFAULT NULL,
  `issued_by_passport` varchar(50) DEFAULT NULL,
  `issued_passport` date DEFAULT NULL,
  `date_birthday` date DEFAULT NULL,
  `location_birthday` varchar(200) DEFAULT NULL,
  `series_license` varchar(4) DEFAULT NULL,
  `number_license` int(11) DEFAULT NULL,
  `issued_by_license` varchar(50) DEFAULT NULL,
  `issued_license` date DEFAULT NULL,
  `valid_license` date DEFAULT NULL,
  `id_category` int(11) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `pass` varchar(32) DEFAULT NULL,
  `date_registration` date DEFAULT NULL,
  `active` int(11) DEFAULT NULL,
  `id_role` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `last_name`, `first_name`, `midle_name`, `series_passport`, `number_passport`, `issued_by_passport`, `issued_passport`, `date_birthday`, `location_birthday`, `series_license`, `number_license`, `issued_by_license`, `issued_license`, `valid_license`, `id_category`, `photo`, `phone`, `email`, `pass`, `date_registration`, `active`, `id_role`) VALUES
(1, 'Ivanov', 'Ivan', 'Ivanovich', 'KH', 1234567, 'ROVD', '2018-03-05', '2017-08-08', 'Grodno', 'XA', 666666, 'GAI', '2018-07-01', '2018-11-15', 2, 'static/photo/cat.jpg', '+375 29 7894564', 'Ivanov@mail.ru', '202cb962ac59075b964b07152d234b70', '2018-07-24', 1, 1),
(2, 'Petrov', 'Petr', 'Petrovich', 'QQ', 123333, 'ROVD', '2018-08-13', '2018-04-09', 'Grodno', 'XW', 55522, 'GAI', '2018-03-05', '2017-09-12', 1, 'static/photo/cat.jpg', '+375 29 7554433', 'Petrov@mail.ru', '202cb962ac59075b964b07152d234b70', '2018-07-02', 1, 3),
(3, 'Sidor', 'Sid', NULL, 'KH', 1234567, NULL, NULL, '2018-03-05', NULL, NULL, 0, NULL, NULL, NULL, 3, NULL, NULL, 'sidor@mail.ru', '202cb962ac59075b964b07152d234b70', '2018-07-29', 1, 3),
(4, 'QWE', 'qwe', NULL, 'qa', 121111, NULL, NULL, '2018-06-11', NULL, NULL, 0, NULL, NULL, NULL, 2, NULL, NULL, 'qwewqeq@gdf.re', '2f6271aba6c0f327e801574edfb23e9c', '2018-07-29', 0, 2),
(13, 'Valery', 'Petr', 'test', 'KH', 123456, 'ROVD', '2018-06-03', '2017-11-06', 'Grodno', 'ED', 0, 'eqdsa', '2018-09-09', '2018-09-17', 5, ' ', '6546456', 'valery_val@mail.ru', '202cb962ac59075b964b07152d234b70', '2018-08-08', 1, 2),
(14, 'Valery', 'vala', 'Vaaa', 'KH', 456987, 'ROVD', '2018-04-02', '2018-02-05', 'Grodno', 'ED', 0, 'eqdsa', '2018-07-30', '2018-11-14', 11, ' ', '543543543', 'valery_val@inbox.ru', '96e79218965eb72c92a549dd5a330112', '2018-09-27', 1, 2);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
