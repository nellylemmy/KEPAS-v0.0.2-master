-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 31, 2023 at 10:07 AM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bom`
--

-- --------------------------------------------------------

--
-- Table structure for table `agents`
--

CREATE TABLE `agents` (
  `id` int(11) NOT NULL,
  `transactions_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `users_id` int(11) DEFAULT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `agent_number` mediumint(15) DEFAULT NULL,
  `agent_name` varchar(40) DEFAULT NULL,
  `agent_phone` varchar(14) DEFAULT NULL,
  `agent_email` varchar(250) DEFAULT NULL,
  `agent_password` varchar(250) DEFAULT NULL,
  `agent_income` float DEFAULT NULL,
  `agent_prev_bal` float DEFAULT NULL,
  `agent_new_bal` float DEFAULT NULL,
  `customer_amt_withdrawn` float DEFAULT NULL,
  `customer_phone` varchar(30) DEFAULT NULL,
  `customer_full_names` varchar(100) DEFAULT NULL,
  `agent_total_income` float DEFAULT NULL,
  `transaction_hash` varchar(200) DEFAULT NULL,
  `transaction_status` varchar(50) DEFAULT NULL,
  `time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `agents`
--

INSERT INTO `agents` (`id`, `transactions_id`, `company_id`, `users_id`, `agent_id`, `agent_number`, `agent_name`, `agent_phone`, `agent_email`, `agent_password`, `agent_income`, `agent_prev_bal`, `agent_new_bal`, `customer_amt_withdrawn`, `customer_phone`, `customer_full_names`, `agent_total_income`, `transaction_hash`, `transaction_status`, `time`) VALUES
(12, NULL, NULL, NULL, 100, 1234, 'penware', '0700000000', NULL, '1234', NULL, NULL, NULL, 20000, NULL, NULL, NULL, NULL, NULL, '2023-01-24 19:37:13');

-- --------------------------------------------------------

--
-- Table structure for table `all_transactions`
--

CREATE TABLE `all_transactions` (
  `id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `bank_id` int(11) DEFAULT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `sender_id` int(11) DEFAULT NULL,
  `recipient_id` int(11) DEFAULT NULL,
  `amount` decimal(13,2) DEFAULT 0.00,
  `mode` varchar(10) DEFAULT NULL,
  `sender_mode` varchar(10) DEFAULT NULL,
  `recipient_mode` varchar(10) DEFAULT NULL,
  `sender_first_name` varchar(30) DEFAULT NULL,
  `sender_last_name` varchar(30) DEFAULT NULL,
  `sender_mobile` varchar(15) DEFAULT NULL,
  `sender_transaction_cost` decimal(13,2) DEFAULT 0.00,
  `sender_income` decimal(13,2) DEFAULT 0.00,
  `recipient_first_name` varchar(30) DEFAULT NULL,
  `recipient_last_name` varchar(30) DEFAULT NULL,
  `recipient_mobile` varchar(15) DEFAULT NULL,
  `recipient_transaction_cost` decimal(13,2) DEFAULT 0.00,
  `recipient_income` decimal(13,2) DEFAULT 0.00,
  `transaction_id` varchar(30) DEFAULT NULL,
  `sender_success_message` longtext DEFAULT NULL,
  `recipient_success_message` longtext DEFAULT NULL,
  `pending_message` longtext DEFAULT NULL,
  `warning_message` longtext DEFAULT NULL,
  `error_message` longtext DEFAULT NULL,
  `current_date` varchar(30) DEFAULT NULL,
  `current_time` varchar(30) DEFAULT NULL,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `all_transactions`
--

INSERT INTO `all_transactions` (`id`, `company_id`, `bank_id`, `agent_id`, `sender_id`, `recipient_id`, `amount`, `mode`, `sender_mode`, `recipient_mode`, `sender_first_name`, `sender_last_name`, `sender_mobile`, `sender_transaction_cost`, `sender_income`, `recipient_first_name`, `recipient_last_name`, `recipient_mobile`, `recipient_transaction_cost`, `recipient_income`, `transaction_id`, `sender_success_message`, `recipient_success_message`, `pending_message`, `warning_message`, `error_message`, `current_date`, `current_time`, `date_time`) VALUES
(208, NULL, NULL, NULL, 33, NULL, NULL, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TID-5463225387', NULL, NULL, NULL, NULL, '<span class=\"random-ids\"><u><b>TID-5463225387</b></u></span> <b>Failed!</b> You can not send money to your own number; Your number is <span class=\"phone-number\"><u>0741642093</u></span> And recipient number is <span class=\"phone-number\"><u>0741642093</u><', 'Jul 10, 2022', '3:17 PM', '2022-07-10 12:17:21'),
(209, NULL, NULL, NULL, 33, NULL, NULL, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TID-6532141632', NULL, NULL, NULL, NULL, '<span class=\"random-ids\"><u><b>TID-6532141632</b></u></span> Failed. You can not send money to your own number! Your number is <span class=\"phone-number\"><u>( 0741642093 )</u></span> And recipient number is <span class=\"phone-number\"><u>( 0741642093 )</u>', 'Jul 10, 2022', '3:19 PM', '2022-07-10 12:19:12'),
(210, NULL, NULL, NULL, 33, NULL, NULL, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TID-7526193571', NULL, NULL, NULL, NULL, 'TID-7526193571 Failed. There Is No user with the number <u><b>0766</b></u> Please check the number and try again', 'Jul 10, 2022', '3:30 PM', '2022-07-10 12:30:30'),
(211, NULL, NULL, NULL, 33, NULL, NULL, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TID-5136293718', NULL, NULL, NULL, NULL, '<span class=\"random-ids\"><u><b>TID-5136293718</b></u></span> Failed. There Is No user with the number <span class=\"phone-number\"><u><b>07894646464</b></u></span> Please check the number and try again', 'Jul 10, 2022', '3:33 PM', '2022-07-10 12:33:07'),
(212, NULL, NULL, NULL, 33, NULL, NULL, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TID-5327425438', NULL, NULL, NULL, NULL, '<span class=\"random-ids\"><u><b>TID-5327425438</b></u></span> Failed. You can not send money to your own number! Your number is <span class=\"phone-number\"><u>0741642093</u></span> And recipient number is <span class=\"phone-number\"><u>0741642093</u></span>.', 'Jul 10, 2022', '5:50 PM', '2022-07-10 14:50:39'),
(213, NULL, NULL, NULL, 33, NULL, NULL, 'W', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TID-3176413824', NULL, NULL, NULL, '<span class=\"random-ids\"><u><b>TID-3176413824</b></u></span> Failed. You can not send funds less than Ksh <span class=\"money\"><b><u>5.00</u></b></span> Current balance is <span class=\"money\"><b><u>37,644.00</u></b></span> Please top up and try again.', NULL, 'Jul 10, 2022', '6:00 PM', '2022-07-10 15:00:55'),
(214, NULL, NULL, NULL, 33, NULL, NULL, 'W', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TID-7193868195', NULL, NULL, NULL, '<span class=\"random-ids\"><u><b>TID-7193868195</b></u></span> Failed. You can not send funds less than <span class=\"money\"><b><u>Ksh 5.00</u></b></span> Current balance is <span class=\"money\"><b><u> Ksh 37,644.00</u></b></span> Please top up and try again.', NULL, 'Jul 10, 2022', '6:02 PM', '2022-07-10 15:02:56'),
(215, NULL, NULL, NULL, 33, NULL, NULL, 'W', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TID-8391245293', NULL, NULL, NULL, '<span class=\"random-ids\"><u><b>TID-8391245293</b></u></span> Failed. You do not have sufficient funds to send <span class=\"money\"><b><u>Ksh 40,000.00</u></b></span> Your balance is <span class=\"money\"><b><u>Ksh 37,644.00</u></b></span> You should pay a transaction fee of <span class=\"money\"><b><u>Ksh 105.00</u></b></span> Please top up <span class=\"money\"><b><u>Ksh 2,461.00</u></b></span> and Try Again', NULL, 'Jul 10, 2022', '6:19 PM', '2022-07-10 15:19:59'),
(216, NULL, NULL, NULL, 33, 34, '300.00', NULL, 'S', NULL, 'nelson', 'lemein', '0741642093', '6.00', '0.00', 'cate', 'tracy', '1234567890', '0.00', '0.60', 'TID-4137634216', '<span class=\"random-ids\"><u><b>TID-4137634216</b></u></span> Confirmed. You have successfully sent <span class=\"money\"><b><u>Ksh 300.00</u></b></span> to <b>cate tracy</b> <span class=\"phone-number\">1234567890</span> On <b>Jul 10, 2022</b> at <b>6:33 PM</', NULL, NULL, NULL, NULL, 'Jul 10, 2022', '6:33 PM', '2022-07-10 15:33:05'),
(217, NULL, NULL, NULL, 33, 34, '300.00', NULL, NULL, 'R', 'nelson', 'lemein', '0741642093', '6.00', '0.00', 'cate', 'tracy', '1234567890', '0.00', '0.60', 'TID-4137634216', NULL, 'TID-4137634216 Confirmed. You have Received 300 from nelson lemein (0741642093). On Jul 10, 2022 at 6:33 PM New balance is: 67452. Thank you choosing our platform. BOM, with you everywhere.', NULL, NULL, NULL, 'Jul 10, 2022', '6:33 PM', '2022-07-10 15:33:05'),
(218, NULL, NULL, NULL, 33, 34, '200.00', NULL, 'S', NULL, 'nelson', 'lemein', '0741642093', '6.00', '0.00', 'cate', 'tracy', '1234567890', '0.00', '0.60', 'TID-8249595674', '<span class=\"random-ids\"><u><b>TID-8249595674</b></u></span> Confirmed. You have successfully sent 200 to cate tracy (1234567890). On Jul 10, 2022 at 6:36 PM. New balance is: 37132. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, NULL, 'Jul 10, 2022', '6:36 PM', '2022-07-10 15:36:32'),
(219, NULL, NULL, NULL, 33, 34, '200.00', NULL, NULL, 'R', 'nelson', 'lemein', '0741642093', '6.00', '0.00', 'cate', 'tracy', '1234567890', '0.00', '0.60', 'TID-8249595674', NULL, 'TID-8249595674 Confirmed. You have Received 200 from nelson lemein (0741642093). On Jul 10, 2022 at 6:36 PM New balance is: 67652. Thank you choosing our platform. BOM, with you everywhere.', NULL, NULL, NULL, 'Jul 10, 2022', '6:36 PM', '2022-07-10 15:36:32'),
(220, NULL, NULL, NULL, 33, 34, '1234.00', NULL, 'S', NULL, 'nelson', 'lemein', '0741642093', '22.00', '0.00', 'cate', 'tracy', '1234567890', '0.00', '2.20', 'TID-4316965271', '<span class=\"random-ids\"><u><b>TID-4316965271</b></u></span> Confirmed. You have successfully sent 1,234.00 to cate tracy (1234567890). On Jul 10, 2022 at 6:40 PM. New balance is: 35876. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, NULL, 'Jul 10, 2022', '6:40 PM', '2022-07-10 15:40:16'),
(221, NULL, NULL, NULL, 33, 34, '1234.00', NULL, NULL, 'R', 'nelson', 'lemein', '0741642093', '22.00', '0.00', 'cate', 'tracy', '1234567890', '0.00', '2.20', 'TID-4316965271', NULL, 'TID-4316965271 Confirmed. You have Received 1234 from nelson lemein (0741642093). On Jul 10, 2022 at 6:40 PM New balance is: 68886. Thank you choosing our platform. BOM, with you everywhere.', NULL, NULL, NULL, 'Jul 10, 2022', '6:40 PM', '2022-07-10 15:40:16'),
(222, NULL, NULL, NULL, 33, 34, '100.00', NULL, 'S', NULL, 'nelson', 'lemein', '0741642093', '0.00', '0.00', 'cate', 'tracy', '1234567890', '0.00', '0.00', 'TID-3569224198', '<span class=\"random-ids\"><u><b>TID-3569224198</b></u></span> Confirmed. You have successfully sent 100.00 to cate tracy (1234567890). On Jul 10, 2022 at 6:40 PM. New balance is: 35776. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, NULL, 'Jul 10, 2022', '6:40 PM', '2022-07-10 15:40:52'),
(223, NULL, NULL, NULL, 33, 34, '100.00', NULL, NULL, 'R', 'nelson', 'lemein', '0741642093', '0.00', '0.00', 'cate', 'tracy', '1234567890', '0.00', '0.00', 'TID-3569224198', NULL, 'TID-3569224198 Confirmed. You have Received 100 from nelson lemein (0741642093). On Jul 10, 2022 at 6:40 PM New balance is: 68986. Thank you choosing our platform. BOM, with you everywhere.', NULL, NULL, NULL, 'Jul 10, 2022', '6:40 PM', '2022-07-10 15:40:52'),
(224, NULL, NULL, NULL, 33, 34, '2300.00', NULL, 'S', NULL, 'nelson', 'lemein', '0741642093', '32.00', '0.00', 'cate', 'tracy', '1234567890', '0.00', '3.20', 'TID-1893491237', '<span class=\"random-ids\"><u><b>TID-1893491237</b></u></span> Confirmed. You have successfully sent 2,300.00 to cate tracy (1234567890). On Jul 10, 2022 at 6:41 PM. New balance is: 33444. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, NULL, 'Jul 10, 2022', '6:41 PM', '2022-07-10 15:41:13'),
(225, NULL, NULL, NULL, 33, 34, '2300.00', NULL, NULL, 'R', 'nelson', 'lemein', '0741642093', '32.00', '0.00', 'cate', 'tracy', '1234567890', '0.00', '3.20', 'TID-1893491237', NULL, 'TID-1893491237 Confirmed. You have Received 2300 from nelson lemein (0741642093). On Jul 10, 2022 at 6:41 PM New balance is: 71286. Thank you choosing our platform. BOM, with you everywhere.', NULL, NULL, NULL, 'Jul 10, 2022', '6:41 PM', '2022-07-10 15:41:13'),
(226, NULL, NULL, NULL, 34, NULL, NULL, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TID-6398524736', NULL, NULL, NULL, NULL, '<span class=\"random-ids\"><u><b>TID-6398524736</b></u></span> Failed. You can not send money to your own number! Your number is <span class=\"phone-number\"><u>1234567890</u></span> And recipient number is <span class=\"phone-number\"><u>1234567890</u></span>.', 'Jul 10, 2022', '6:43 PM', '2022-07-10 15:43:09'),
(227, NULL, NULL, NULL, 34, 33, '3000.00', NULL, 'S', NULL, 'cate', 'tracy', '1234567890', '51.00', '0.00', 'nelson', 'lemein', '0741642093', '0.00', '5.10', 'TID-2846923987', '<span class=\"random-ids\"><u><b>TID-2846923987</b></u></span> Confirmed. You have successfully sent <span class=\"money\"><b><u>Ksh 3,000.00</u></b></span> to nelson lemein (0741642093). On Jul 10, 2022 at 6:43 PM. New balance is: 68235. Thank you for choosi', NULL, NULL, NULL, NULL, 'Jul 10, 2022', '6:43 PM', '2022-07-10 15:43:40'),
(228, NULL, NULL, NULL, 34, 33, '3000.00', NULL, NULL, 'R', 'cate', 'tracy', '1234567890', '51.00', '0.00', 'nelson', 'lemein', '0741642093', '0.00', '5.10', 'TID-2846923987', NULL, 'TID-2846923987 Confirmed. You have Received 3000 from cate tracy (1234567890). On Jul 10, 2022 at 6:43 PM New balance is: 36444. Thank you choosing our platform. BOM, with you everywhere.', NULL, NULL, NULL, 'Jul 10, 2022', '6:43 PM', '2022-07-10 15:43:40'),
(229, NULL, NULL, NULL, 33, 34, '200.00', NULL, 'S', NULL, 'nelson', 'lemein', '0741642093', '6.00', '0.00', 'cate', 'tracy', '1234567890', '0.00', '0.60', 'TID-1748551962', '<span class=\"random-ids\"><u><b>TID-1748551962</b></u></span> Confirmed You have successfully sent <span class=\"money\"><b><u>Ksh 200.00</u></b></span> to <b>cate tracy</b> (<b>1234567890</b>). On <b>Jul 10, 2022</b> at <b>6:47 PM</b>. New BOM balance is 36', NULL, NULL, NULL, NULL, 'Jul 10, 2022', '6:47 PM', '2022-07-10 15:47:56'),
(230, NULL, NULL, NULL, 33, 34, '200.00', NULL, NULL, 'R', 'nelson', 'lemein', '0741642093', '6.00', '0.00', 'cate', 'tracy', '1234567890', '0.00', '0.60', 'TID-1748551962', NULL, 'TID-1748551962 Confirmed. You have Received 200 from nelson lemein (0741642093). On Jul 10, 2022 at 6:47 PM New balance is: 68435. Thank you choosing our platform. BOM, with you everywhere.', NULL, NULL, NULL, 'Jul 10, 2022', '6:47 PM', '2022-07-10 15:47:56'),
(231, NULL, NULL, NULL, 33, 34, '280.00', NULL, 'S', NULL, 'nelson', 'lemein', '0741642093', '6.00', '0.00', 'cate', 'tracy', '1234567890', '0.00', '0.60', 'TID-2756383159', '<span class=\"random-ids\"><u><b>TID-2756383159</b></u></span> Confirmed You have successfully sent <span class=\"money\"><b><u>Ksh 280.00 </u></b></span>to<b>cate tracy</b><b>1234567890</b>. On <b>Jul 10, 2022</b>at<b>6:50 PM</b>New BOM balance is 35952 Than', NULL, NULL, NULL, NULL, 'Jul 10, 2022', '6:50 PM', '2022-07-10 15:50:14'),
(232, NULL, NULL, NULL, 33, 34, '280.00', NULL, NULL, 'R', 'nelson', 'lemein', '0741642093', '6.00', '0.00', 'cate', 'tracy', '1234567890', '0.00', '0.60', 'TID-2756383159', NULL, 'TID-2756383159 Confirmed. You have Received 280 from nelson lemein (0741642093). On Jul 10, 2022 at 6:50 PM New balance is: 68715. Thank you choosing our platform. BOM, with you everywhere.', NULL, NULL, NULL, 'Jul 10, 2022', '6:50 PM', '2022-07-10 15:50:14'),
(233, NULL, NULL, NULL, 33, 34, '100.00', NULL, NULL, 'R', 'nelson', 'lemein', '0741642093', '0.00', '0.00', 'cate', 'tracy', '1234567890', '0.00', '0.00', 'TID-1258943168', NULL, 'TID-1258943168 Confirmed. You have Received 100 from nelson lemein (0741642093). On Jul 10, 2022 at 6:51 PM New balance is: 68815. Thank you choosing our platform. BOM, with you everywhere.', NULL, NULL, NULL, 'Jul 10, 2022', '6:51 PM', '2022-07-10 15:51:27'),
(234, NULL, NULL, NULL, 33, 34, '100.00', NULL, 'S', NULL, 'nelson', 'lemein', '0741642093', '0.00', '0.00', 'cate', 'tracy', '1234567890', '0.00', '0.00', 'TID-1258943168', '<span class=\"random-ids\"><u><b>TID-1258943168</b></u></span> Confirmed You have successfully sent <span class=\"money\"><b><u>Ksh 100.00 </u></b></span>to<b>cate tracy</b><b>1234567890</b>. On <b>Jul 10, 2022</b>at<b>6:51 PM</b>New BOM balance is 35852 Than', NULL, NULL, NULL, NULL, 'Jul 10, 2022', '6:51 PM', '2022-07-10 15:51:27'),
(235, NULL, NULL, NULL, 33, 34, '200.00', NULL, 'S', NULL, 'nelson', 'lemein', '0741642093', '6.00', '0.00', 'cate', 'tracy', '1234567890', '0.00', '0.60', 'TID-2745145137', '<span class=\"random-ids\"><u><b>TID-2745145137</b></u></span> Confirmed. You have successfully sent <span class=\"money\"><b><u>Ksh 200.00</u></b></span> to cate tracy (1234567890). On Jul 10, 2022 at 6:52 PM. New balance is: 35646. Thank you for choosing our platform', NULL, NULL, NULL, NULL, 'Jul 10, 2022', '6:52 PM', '2022-07-10 15:52:47'),
(236, NULL, NULL, NULL, 33, 34, '200.00', NULL, NULL, 'R', 'nelson', 'lemein', '0741642093', '6.00', '0.00', 'cate', 'tracy', '1234567890', '0.00', '0.60', 'TID-2745145137', NULL, 'TID-2745145137 Confirmed. You have Received 200 from nelson lemein (0741642093). On Jul 10, 2022 at 6:52 PM New balance is: 69015. Thank you choosing our platform. BOM, with you everywhere.', NULL, NULL, NULL, 'Jul 10, 2022', '6:52 PM', '2022-07-10 15:52:47'),
(237, NULL, NULL, NULL, 33, 34, '300.00', NULL, 'S', NULL, 'nelson', 'lemein', '0741642093', '6.00', '0.00', 'cate', 'tracy', '1234567890', '0.00', '0.60', 'TID-1985228631', '<span class=\"random-ids\"><u><b>TID-1985228631</b></u></span> Confirmed You have successfully sent <span class=\"money\"><b><u>Ksh 300.00 </u></b></span>to<b>cate tracy</b><b>1234567890</b>. On <b>Jul 10, 2022</b>at<b>7:08 PM</b>New BOM balance is 35340 Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, NULL, 'Jul 10, 2022', '7:08 PM', '2022-07-10 16:08:45'),
(238, NULL, NULL, NULL, 33, 34, '300.00', NULL, NULL, 'R', 'nelson', 'lemein', '0741642093', '6.00', '0.00', 'cate', 'tracy', '1234567890', '0.00', '0.60', 'TID-1985228631', NULL, 'TID-1985228631 Confirmed. You have Received 300 from nelson lemein (0741642093). On Jul 10, 2022 at 7:08 PM New balance is: 69315. Thank you choosing our platform. BOM, with you everywhere.', NULL, NULL, NULL, 'Jul 10, 2022', '7:08 PM', '2022-07-10 16:08:45'),
(239, NULL, NULL, NULL, 33, 34, '700.00', NULL, 'S', NULL, 'nelson', 'lemein', '0741642093', '12.00', '0.00', 'cate', 'tracy', '1234567890', '0.00', '1.20', 'TID-7421559731', '<span class=\"random-ids\"><u><b>TID-7421559731</b></u></span> Confirmed You have successfully sent <span class=\"money\"><b><u>Ksh 700.00 </u></b></span> to <b>cate tracy</b> (<span class=\"phone-number\"><u>1234567890</u></span>). On <b>Jul 10, 2022</b>at<b>7:13 PM</b>New BOM balance is 34628 Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, NULL, 'Jul 10, 2022', '7:13 PM', '2022-07-10 16:13:54'),
(240, NULL, NULL, NULL, 33, 34, '700.00', NULL, NULL, 'R', 'nelson', 'lemein', '0741642093', '12.00', '0.00', 'cate', 'tracy', '1234567890', '0.00', '1.20', 'TID-7421559731', NULL, 'TID-7421559731 Confirmed. You have Received 700 from nelson lemein (0741642093). On Jul 10, 2022 at 7:13 PM New balance is: 70015. Thank you choosing our platform. BOM, with you everywhere.', NULL, NULL, NULL, 'Jul 10, 2022', '7:13 PM', '2022-07-10 16:13:54'),
(241, NULL, NULL, NULL, 33, 34, '390.00', NULL, 'S', NULL, 'nelson', 'lemein', '0741642093', '6.00', '0.00', 'cate', 'tracy', '1234567890', '0.00', '0.60', 'TID-1982362593', '<span class=\"random-ids\"><u><b>TID-1982362593</b></u></span> Confirmed You have successfully sent <span class=\"money\"><b><u>Ksh 390.00 </u></b></span> to <b>cate tracy</b> (<span class=\"phone-number\"><u>1234567890</u></span>). On (<b>Jul 10, 2022</b> at <b>7:21 PM</b>). New BOM balance is <span class=\"money\"><b><u>Ksh 34,232.00</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, NULL, 'Jul 10, 2022', '7:21 PM', '2022-07-10 16:21:54'),
(242, NULL, NULL, NULL, 33, 34, '390.00', NULL, NULL, 'R', 'nelson', 'lemein', '0741642093', '6.00', '0.00', 'cate', 'tracy', '1234567890', '0.00', '0.60', 'TID-1982362593', NULL, 'TID-1982362593 Confirmed. You have Received 390 from nelson lemein (0741642093). On Jul 10, 2022 at 7:21 PM New balance is <span class=\"money\"><b><u>Ksh 70,405.00</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, 'Jul 10, 2022', '7:21 PM', '2022-07-10 16:21:54'),
(243, NULL, NULL, NULL, 33, 34, '200.00', NULL, NULL, 'R', 'nelson', 'lemein', '0741642093', '6.00', '0.00', 'cate', 'tracy', '1234567890', '0.00', '0.60', 'TID-4253176354', NULL, 'TID-4253176354 Confirmed. You have Received 200 from nelson lemein (0741642093). On Jul 10, 2022 at 7:48 PM New balance is <span class=\"money\"><b><u>Ksh 70,605.00</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, 'Jul 10, 2022', '7:48 PM', '2022-07-10 16:48:33'),
(244, NULL, NULL, NULL, 33, 34, '200.00', NULL, 'S', NULL, 'nelson', 'lemein', '0741642093', '6.00', '0.00', 'cate', 'tracy', '1234567890', '0.00', '0.60', 'TID-4253176354', '<span class=\"random-ids\"><u><b>TID-4253176354</b></u></span> Confirmed You have successfully sent <span class=\"money\"><b><u>Ksh 200.00 </u></b></span> to <b>cate tracy</b> (<span class=\"phone-number\"><u>1234567890</u></span>). On (<b>Jul 10, 2022</b> at <b>7:48 PM</b>). New BOM balance is <span class=\"money\"><b><u>Ksh 34,026.00</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, NULL, 'Jul 10, 2022', '7:48 PM', '2022-07-10 16:48:33'),
(245, NULL, NULL, NULL, 33, 34, '2500.00', NULL, 'S', NULL, 'nelson', 'lemein', '0741642093', '32.00', '0.00', 'cate', 'tracy', '1234567890', '0.00', '3.20', 'TID-2139415837', '<span class=\"random-ids\"><u><b>TID-2139415837</b></u></span> Confirmed You have successfully sent <span class=\"money\"><b><u>Ksh 2,500.00 </u></b></span> to <b>cate tracy</b> (<span class=\"phone-number\"><u>1234567890</u></span>). On (<b>Jul 10, 2022</b> at <b>7:54 PM</b>). New BOM balance is <span class=\"money\"><b><u>Ksh 31,494.00</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, NULL, 'Jul 10, 2022', '7:54 PM', '2022-07-10 16:54:15'),
(246, NULL, NULL, NULL, 33, 34, '2500.00', NULL, NULL, 'R', 'nelson', 'lemein', '0741642093', '32.00', '0.00', 'cate', 'tracy', '1234567890', '0.00', '3.20', 'TID-2139415837', NULL, '<span class=\"random-ids\"><u><b>TID-2139415837</b></u></span> Confirmed You have Received <span class=\"money\"><b><u>Ksh 2,500.00 </u></b></span> from <b>nelson</b> <b>lemein</b> (<span class=\"phone-number\"><u>0741642093</u></span>). On <b>Jul 10, 2022</b> at <b>7:54 PM</b> New BOM balance is <span class=\"money\"><b><u>Ksh 73,105.00</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, 'Jul 10, 2022', '7:54 PM', '2022-07-10 16:54:15'),
(247, NULL, NULL, NULL, 33, 34, '300.00', NULL, 'S', NULL, 'nelson', 'lemein', '0741642093', '6.00', '0.00', 'cate', 'tracy', '1234567890', '0.00', '0.60', 'TID-9175376159', '<span class=\"random-ids\"><u><b>TID-9175376159</b></u></span> Confirmed You have successfully sent <span class=\"money\"><b><u>Ksh 300.00 </u></b></span> to <b>cate tracy</b> (<span class=\"phone-number\"><u>1234567890</u></span>). On (<b>Jul 10, 2022</b> at <b>8:06 PM</b>). New BOM balance is <span class=\"money\"><b><u>Ksh 31,188.00</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, NULL, 'Jul 10, 2022', '8:06 PM', '2022-07-10 17:06:52'),
(248, NULL, NULL, NULL, 33, 34, '300.00', NULL, NULL, 'R', 'nelson', 'lemein', '0741642093', '6.00', '0.00', 'cate', 'tracy', '1234567890', '0.00', '0.60', 'TID-9175376159', NULL, '<span class=\"random-ids\"><u><b>TID-9175376159</b></u></span> Confirmed You have Received <span class=\"money\"><b><u>Ksh 300.00 </u></b></span> from <b>nelson</b> <b>lemein</b> (<span class=\"phone-number\"><u>0741642093</u></span>). On (<b>Jul 10, 2022</b> at <b>8:06 PM</b>) New BOM balance is <span class=\"money\"><b><u>Ksh 73,405.00</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, 'Jul 10, 2022', '8:06 PM', '2022-07-10 17:06:52'),
(249, NULL, NULL, NULL, 34, NULL, NULL, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TID-6498716723', NULL, NULL, NULL, NULL, '<span class=\"random-ids\"><u><b>TID-6498716723</b></u></span> Failed. There Is No user with the number <span class=\"phone-number\"><u><b>46464646</b></u></span> Please check the number and try again', 'Jul 10, 2022', '8:08 PM', '2022-07-10 17:08:12'),
(250, NULL, NULL, NULL, 34, NULL, NULL, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TID-6182759184', NULL, NULL, NULL, NULL, '<span class=\"random-ids\"><u><b>TID-6182759184</b></u></span> Failed. You can not send money to your own number! Your number is <span class=\"phone-number\"><u>1234567890</u></span> And recipient number is <span class=\"phone-number\"><u>1234567890</u></span>. Please Check the number And Try Again', 'Jul 10, 2022', '8:08 PM', '2022-07-10 17:08:36'),
(251, NULL, NULL, NULL, 34, NULL, NULL, 'W', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TID-3951659782', NULL, NULL, NULL, '<span class=\"random-ids\"><u><b>TID-3951659782</b></u></span> Failed. You do not have sufficient funds to send <span class=\"money\"><b><u>Ksh 30,000,000.00</u></b></span> Your balance is <span class=\"money\"><b><u>Ksh 73,405.00</u></b></span> You should pay a transaction fee of <span class=\"money\"><b><u>Ksh 1,665.00</u></b></span> Please top up <span class=\"money\"><b><u>Ksh 29,928,260.00</u></b></span> and Try Again', NULL, 'Jul 10, 2022', '8:09 PM', '2022-07-10 17:09:07'),
(252, NULL, NULL, NULL, 34, NULL, NULL, 'W', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TID-1348573584', NULL, NULL, NULL, '<span class=\"random-ids\"><u><b>TID-1348573584</b></u></span> Warning! You entered a wrong password', NULL, 'Jul 10, 2022', '8:11 PM', '2022-07-10 17:11:24'),
(253, NULL, NULL, NULL, 34, NULL, NULL, 'W', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TID-7438125769', NULL, NULL, NULL, '<span class=\"random-ids\"><u><b>TID-7438125769</b></u></span> Failed. You can not send funds less than <span class=\"money\"><b><u>Ksh 5.00</u></b></span> Current balance is <span class=\"money\"><b><u> Ksh 73,405.00</u></b></span> Please top up and try again.', NULL, 'Aug 14, 2022', '1:30 PM', '2022-08-14 10:30:02'),
(254, NULL, NULL, NULL, 33, NULL, NULL, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TID-5763162941', NULL, NULL, NULL, NULL, '<span class=\"random-ids\"><u><b>TID-5763162941</b></u></span> Failed. You can not send money to your own number! Your number is <span class=\"phone-number\"><u>0741642093</u></span> And recipient number is <span class=\"phone-number\"><u>0741642093</u></span>. Please Check the number And Try Again', 'Nov 1, 2022', '6:50 PM', '2022-11-01 15:50:16'),
(255, NULL, NULL, NULL, 33, NULL, NULL, 'W', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TID-4278913985', NULL, NULL, NULL, '<span class=\"random-ids\"><u><b>TID-4278913985</b></u></span> Failed. You can not send funds less than <span class=\"money\"><b><u>Ksh 5.00</u></b></span> Current balance is <span class=\"money\"><b><u> Ksh 31,188.00</u></b></span> Please top up and try again.', NULL, 'Nov 1, 2022', '6:50 PM', '2022-11-01 15:50:44'),
(256, NULL, NULL, NULL, 33, NULL, NULL, 'W', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TID-1782365893', NULL, NULL, NULL, '<span class=\"random-ids\"><u><b>TID-1782365893</b></u></span> Warning! You entered a wrong password', NULL, 'Nov 1, 2022', '6:51 PM', '2022-11-01 15:51:29'),
(257, NULL, NULL, NULL, 33, 34, '2000.00', NULL, 'S', NULL, 'nelson', 'lemein', '0741642093', '32.00', '0.00', 'cate', 'tracy', '1234567890', '0.00', '3.20', 'TID-3294545617', '<span class=\"random-ids\"><u><b>TID-3294545617</b></u></span> Confirmed You have successfully sent <span class=\"money\"><b><u>Ksh 2,000.00 </u></b></span> to <b>cate tracy</b> (<span class=\"phone-number\"><u>1234567890</u></span>). On (<b>Nov 1, 2022</b> at <b>6:51 PM</b>). New BOM balance is <span class=\"money\"><b><u>Ksh 29,156.00</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, NULL, 'Nov 1, 2022', '6:51 PM', '2022-11-01 15:51:50'),
(258, NULL, NULL, NULL, 33, 34, '2000.00', NULL, NULL, 'R', 'nelson', 'lemein', '0741642093', '32.00', '0.00', 'cate', 'tracy', '1234567890', '0.00', '3.20', 'TID-3294545617', NULL, '<span class=\"random-ids\"><u><b>TID-3294545617</b></u></span> Confirmed You have Received <span class=\"money\"><b><u>Ksh 2,000.00 </u></b></span> from <b>nelson</b> <b>lemein</b> (<span class=\"phone-number\"><u>0741642093</u></span>). On (<b>Nov 1, 2022</b> at <b>6:51 PM</b>) New BOM balance is <span class=\"money\"><b><u>Ksh 75,405.00</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, 'Nov 1, 2022', '6:51 PM', '2022-11-01 15:51:50'),
(259, NULL, NULL, NULL, 40, NULL, NULL, 'W', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TID-4618987612', NULL, NULL, NULL, '<span class=\"random-ids\"><u><b>TID-4618987612</b></u></span> Failed. You do not have sufficient funds to send <span class=\"money\"><b><u>Ksh 400.00</u></b></span> Your balance is <span class=\"money\"><b><u>Ksh 0.00</u></b></span> You should pay a transaction fee of <span class=\"money\"><b><u>Ksh 6.00</u></b></span> Please top up <span class=\"money\"><b><u>Ksh 406.00</u></b></span> and Try Again', NULL, 'Nov 5, 2022', '5:04 PM', '2022-11-05 14:04:18'),
(260, NULL, NULL, NULL, 33, NULL, NULL, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TID-7394661238', NULL, NULL, NULL, NULL, '<span class=\"random-ids\"><u><b>TID-7394661238</b></u></span> Failed. You can not send money to your own number! Your number is <span class=\"phone-number\"><u>0741642093</u></span> And recipient number is <span class=\"phone-number\"><u>0741642093</u></span>. Please Check the number And Try Again', 'Dec 12, 2022', '7:36 PM', '2022-12-12 16:36:09'),
(261, NULL, NULL, NULL, 33, NULL, NULL, 'W', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TID-1684941927', NULL, NULL, NULL, '<span class=\"random-ids\"><u><b>TID-1684941927</b></u></span> Warning! You entered a wrong password', NULL, 'Dec 12, 2022', '7:46 PM', '2022-12-12 16:46:16'),
(262, NULL, NULL, NULL, 33, NULL, NULL, 'W', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TID-3845771853', NULL, NULL, NULL, '<span class=\"random-ids\"><u><b>TID-3845771853</b></u></span> Warning! You entered a wrong password', NULL, 'Dec 12, 2022', '10:04 PM', '2022-12-12 19:04:05'),
(263, NULL, NULL, NULL, 34, 33, '300.00', NULL, NULL, 'R', 'cate', 'tracy', '1234567890', '6.00', '0.00', 'nelson', 'lemein', '0741642093', '0.00', '0.60', 'TID-1978487953', NULL, '<span class=\"random-ids\"><u><b>TID-1978487953</b></u></span> Confirmed You have Received <span class=\"money\"><b><u>Ksh 300.00 </u></b></span> from <b>cate</b> <b>tracy</b> (<span class=\"phone-number\"><u>1234567890</u></span>). On (<b>Dec 12, 2022</b> at <b>11:11 PM</b>) New BOM balance is <span class=\"money\"><b><u>Ksh 29,456.00</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, 'Dec 12, 2022', '11:11 PM', '2022-12-12 20:11:49'),
(264, NULL, NULL, NULL, 34, 33, '300.00', NULL, 'S', NULL, 'cate', 'tracy', '1234567890', '6.00', '0.00', 'nelson', 'lemein', '0741642093', '0.00', '0.60', 'TID-1978487953', '<span class=\"random-ids\"><u><b>TID-1978487953</b></u></span> Confirmed You have successfully sent <span class=\"money\"><b><u>Ksh 300.00 </u></b></span> to <b>nelson lemein</b> (<span class=\"phone-number\"><u>0741642093</u></span>). On (<b>Dec 12, 2022</b> at <b>11:11 PM</b>). New BOM balance is <span class=\"money\"><b><u>Ksh 75,099.00</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, NULL, 'Dec 12, 2022', '11:11 PM', '2022-12-12 20:11:49'),
(265, NULL, NULL, NULL, 34, 33, '1000.00', NULL, 'S', NULL, 'cate', 'tracy', '1234567890', '12.00', '0.00', 'nelson', 'lemein', '0741642093', '0.00', '1.20', 'TID-6751963472', '<span class=\"random-ids\"><u><b>TID-6751963472</b></u></span> Confirmed You have successfully sent <span class=\"money\"><b><u>Ksh 1,000.00 </u></b></span> to <b>nelson lemein</b> (<span class=\"phone-number\"><u>0741642093</u></span>). On (<b>Dec 12, 2022</b> at <b>11:14 PM</b>). New BOM balance is <span class=\"money\"><b><u>Ksh 74,087.00</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, NULL, 'Dec 12, 2022', '11:14 PM', '2022-12-12 20:14:55'),
(266, NULL, NULL, NULL, 34, 33, '1000.00', NULL, NULL, 'R', 'cate', 'tracy', '1234567890', '12.00', '0.00', 'nelson', 'lemein', '0741642093', '0.00', '1.20', 'TID-6751963472', NULL, '<span class=\"random-ids\"><u><b>TID-6751963472</b></u></span> Confirmed You have Received <span class=\"money\"><b><u>Ksh 1,000.00 </u></b></span> from <b>cate</b> <b>tracy</b> (<span class=\"phone-number\"><u>1234567890</u></span>). On (<b>Dec 12, 2022</b> at <b>11:14 PM</b>) New BOM balance is <span class=\"money\"><b><u>Ksh 30,156.00</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, 'Dec 12, 2022', '11:14 PM', '2022-12-12 20:14:55'),
(267, NULL, NULL, NULL, 34, NULL, NULL, 'W', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TID-2587646851', NULL, NULL, NULL, '<span class=\"random-ids\"><u><b>TID-2587646851</b></u></span> Failed. You do not have sufficient funds to send <span class=\"money\"><b><u>Ksh 74,087.00</u></b></span> Your balance is <span class=\"money\"><b><u>Ksh 74,087.00</u></b></span> You should pay a transaction fee of <span class=\"money\"><b><u>Ksh 105.00</u></b></span> Please top up <span class=\"money\"><b><u>Ksh 105.00</u></b></span> and Try Again', NULL, 'Dec 13, 2022', '1:15 AM', '2022-12-12 22:15:50'),
(268, NULL, NULL, NULL, 33, NULL, NULL, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TID-8197318794', NULL, NULL, NULL, NULL, '<span class=\"random-ids\"><u><b>TID-8197318794</b></u></span> Failed. You can not send money to your own number! Your number is <span class=\"phone-number\"><u>0741642093</u></span> And recipient number is <span class=\"phone-number\"><u>0741642093</u></span>. Please Check the number And Try Again', 'Dec 13, 2022', '7:42 PM', '2022-12-13 16:42:43'),
(269, NULL, NULL, NULL, 33, 34, '300.00', NULL, 'S', NULL, 'nelson', 'lemein', '0741642093', '6.00', '0.00', 'cate', 'tracy', '1234567890', '0.00', '0.60', 'TID-3964235418', 'TID-3964235418 Confirmed. You have successfully sent 300 to 1234567890. New balance is: 29856. Thank you choosing our platform. BOM, with you everywhere.', NULL, NULL, NULL, NULL, 'Dec 31, 2022', '1:44 AM', '2022-12-30 22:44:21'),
(270, NULL, NULL, NULL, 33, 34, '300.00', NULL, NULL, 'R', 'nelson', 'lemein', '0741642093', '6.00', '0.00', 'cate', 'tracy', '1234567890', '0.00', '0.60', 'TID-3964235418', NULL, 'TID-3964235418 Confirmed. You have Received 300 from nelson lemein (0741642093). On Dec 31, 2022 at 1:44 AM New balance is: 74387. Thank you choosing our platform. BOM, with you everywhere.', NULL, NULL, NULL, 'Dec 31, 2022', '1:44 AM', '2022-12-30 22:44:21'),
(271, NULL, NULL, NULL, 34, 33, '400.00', NULL, 'S', NULL, 'cate', 'tracy', '1234567890', '6.00', '0.00', 'nelson', 'lemein', '0741642093', '0.00', '0.60', 'TID-2671819768', '<span class=\"random-ids\"><u><b>TID-2671819768</b></u></span> Confirmed You have successfully sent <span class=\"money\"><b><u>Ksh 400.00 </u></b></span> to <b>nelson lemein</b> (<span class=\"phone-number\"><u>0741642093</u></span>). On (<b>Dec 31, 2022</b> at <b>1:15 PM</b>). New BOM balance is <span class=\"money\"><b><u>Ksh 73,981.00</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, NULL, 'Dec 31, 2022', '1:15 PM', '2022-12-31 10:15:52'),
(272, NULL, NULL, NULL, 34, 33, '400.00', NULL, NULL, 'R', 'cate', 'tracy', '1234567890', '6.00', '0.00', 'nelson', 'lemein', '0741642093', '0.00', '0.60', 'TID-2671819768', NULL, '<span class=\"random-ids\"><u><b>TID-2671819768</b></u></span> Confirmed You have Received <span class=\"money\"><b><u>Ksh 400.00 </u></b></span> from <b>cate</b> <b>tracy</b> (<span class=\"phone-number\"><u>1234567890</u></span>). On (<b>Dec 31, 2022</b> at <b>1:15 PM</b>) New BOM balance is <span class=\"money\"><b><u>Ksh 30,256.00</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, 'Dec 31, 2022', '1:15 PM', '2022-12-31 10:15:52'),
(273, NULL, NULL, NULL, 34, 33, '9999.99', NULL, NULL, 'R', 'cate', 'tracy', '1234567890', '102.00', '0.00', 'nelson', 'lemein', '0741642093', '0.00', '10.20', 'TID-8916764519', NULL, '<span class=\"random-ids\"><u><b>TID-8916764519</b></u></span> Confirmed You have Received <span class=\"money\"><b><u>Ksh 16,000.00 </u></b></span> from <b>cate</b> <b>tracy</b> (<span class=\"phone-number\"><u>1234567890</u></span>). On (<b>Dec 31, 2022</b> at <b>1:17 PM</b>) New BOM balance is <span class=\"money\"><b><u>Ksh 46,256.00</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, 'Dec 31, 2022', '1:17 PM', '2022-12-31 10:17:44'),
(274, NULL, NULL, NULL, 34, 33, '9999.99', NULL, 'S', NULL, 'cate', 'tracy', '1234567890', '102.00', '0.00', 'nelson', 'lemein', '0741642093', '0.00', '10.20', 'TID-8916764519', '<span class=\"random-ids\"><u><b>TID-8916764519</b></u></span> Confirmed You have successfully sent <span class=\"money\"><b><u>Ksh 16,000.00 </u></b></span> to <b>nelson lemein</b> (<span class=\"phone-number\"><u>0741642093</u></span>). On (<b>Dec 31, 2022</b> at <b>1:17 PM</b>). New BOM balance is <span class=\"money\"><b><u>Ksh 57,879.00</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, NULL, 'Dec 31, 2022', '1:17 PM', '2022-12-31 10:17:44'),
(275, NULL, NULL, NULL, 33, 34, '100.00', NULL, 'S', NULL, 'nelson', 'lemein', '0741642093', '0.00', '0.00', 'cate', 'tracy', '1234567890', '0.00', '0.00', 'TID-4689156792', '<span class=\"random-ids\"><u><b>TID-4689156792</b></u></span> Confirmed You have successfully sent <span class=\"money\"><b><u>Ksh 100.00 </u></b></span> to <b>cate tracy</b> (<span class=\"phone-number\"><u>1234567890</u></span>). On (<b>Jan 1, 2023</b> at <b>3:49 AM</b>). New BOM balance is <span class=\"money\"><b><u>Ksh 46,156.00</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, NULL, 'Jan 1, 2023', '3:49 AM', '2023-01-01 00:49:17'),
(276, NULL, NULL, NULL, 33, 34, '100.00', NULL, NULL, 'R', 'nelson', 'lemein', '0741642093', '0.00', '0.00', 'cate', 'tracy', '1234567890', '0.00', '0.00', 'TID-4689156792', NULL, '<span class=\"random-ids\"><u><b>TID-4689156792</b></u></span> Confirmed You have Received <span class=\"money\"><b><u>Ksh 100.00 </u></b></span> from <b>nelson</b> <b>lemein</b> (<span class=\"phone-number\"><u>0741642093</u></span>). On (<b>Jan 1, 2023</b> at <b>3:49 AM</b>) New BOM balance is <span class=\"money\"><b><u>Ksh 57,979.00</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, 'Jan 1, 2023', '3:49 AM', '2023-01-01 00:49:17'),
(277, NULL, NULL, NULL, 33, 34, '100.00', NULL, NULL, 'R', 'nelson', 'lemein', '0741642093', '0.00', '0.00', 'cate', 'tracy', '1234567890', '0.00', '0.00', 'TID-3487292381', NULL, '<span class=\"random-ids\"><u><b>TID-3487292381</b></u></span> Confirmed You have Received <span class=\"money\"><b><u>Ksh 100.00 </u></b></span> from <b>nelson</b> <b>lemein</b> (<span class=\"phone-number\"><u>0741642093</u></span>). On (<b>Jan 1, 2023</b> at <b>1:47 PM</b>) New BOM balance is <span class=\"money\"><b><u>Ksh 58,079.00</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, 'Jan 1, 2023', '1:47 PM', '2023-01-01 10:47:27'),
(278, NULL, NULL, NULL, 33, 34, '100.00', NULL, 'S', NULL, 'nelson', 'lemein', '0741642093', '0.00', '0.00', 'cate', 'tracy', '1234567890', '0.00', '0.00', 'TID-3487292381', '<span class=\"random-ids\"><u><b>TID-3487292381</b></u></span> Confirmed You have successfully sent <span class=\"money\"><b><u>Ksh 100.00 </u></b></span> to <b>cate tracy</b> (<span class=\"phone-number\"><u>1234567890</u></span>). On (<b>Jan 1, 2023</b> at <b>1:47 PM</b>). New BOM balance is <span class=\"money\"><b><u>Ksh 46,056.00</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, NULL, 'Jan 1, 2023', '1:47 PM', '2023-01-01 10:47:27'),
(279, NULL, NULL, NULL, 33, 34, '50.00', NULL, 'S', NULL, 'nelson', 'lemein', '0741642093', '0.00', '0.00', 'cate', 'tracy', '1234567890', '0.00', '0.00', 'TID-8726194362', '<span class=\"random-ids\"><u><b>TID-8726194362</b></u></span> Confirmed You have successfully sent <span class=\"money\"><b><u>Ksh 50.00 </u></b></span> to <b>cate tracy</b> (<span class=\"phone-number\"><u>1234567890</u></span>). On (<b>Jan 1, 2023</b> at <b>1:48 PM</b>). New BOM balance is <span class=\"money\"><b><u>Ksh 46,006.00</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, NULL, 'Jan 1, 2023', '1:48 PM', '2023-01-01 10:48:10'),
(280, NULL, NULL, NULL, 33, 34, '50.00', NULL, NULL, 'R', 'nelson', 'lemein', '0741642093', '0.00', '0.00', 'cate', 'tracy', '1234567890', '0.00', '0.00', 'TID-8726194362', NULL, '<span class=\"random-ids\"><u><b>TID-8726194362</b></u></span> Confirmed You have Received <span class=\"money\"><b><u>Ksh 50.00 </u></b></span> from <b>nelson</b> <b>lemein</b> (<span class=\"phone-number\"><u>0741642093</u></span>). On (<b>Jan 1, 2023</b> at <b>1:48 PM</b>) New BOM balance is <span class=\"money\"><b><u>Ksh 58,129.00</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, 'Jan 1, 2023', '1:48 PM', '2023-01-01 10:48:10'),
(281, NULL, NULL, NULL, 33, NULL, NULL, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TID-7186285472', NULL, NULL, NULL, NULL, '<span class=\"random-ids\"><u><b>TID-7186285472</b></u></span> Failed. You can not send money to your own number! Your number is <span class=\"phone-number\"><u>0741642093</u></span> And recipient number is <span class=\"phone-number\"><u>0741642093</u></span>. Please Check the number And Try Again', 'Jan 1, 2023', '1:49 PM', '2023-01-01 10:49:06'),
(282, NULL, NULL, NULL, 34, 33, '7900.00', NULL, 'S', NULL, 'cate', 'tracy', '1234567890', '87.00', '0.00', 'nelson', 'lemein', '0741642093', '0.00', '8.70', 'TID-7865484325', '<span class=\"random-ids\"><u><b>TID-7865484325</b></u></span> Confirmed You have successfully sent <span class=\"money\"><b><u>Ksh 7,900.00 </u></b></span> to <b>nelson lemein</b> (<span class=\"phone-number\"><u>0741642093</u></span>). On (<b>Jan 1, 2023</b> at <b>3:42 PM</b>). New BOM balance is <span class=\"money\"><b><u>Ksh 50,142.00</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, NULL, 'Jan 1, 2023', '3:42 PM', '2023-01-01 12:42:43'),
(283, NULL, NULL, NULL, 34, 33, '7900.00', NULL, NULL, 'R', 'cate', 'tracy', '1234567890', '87.00', '0.00', 'nelson', 'lemein', '0741642093', '0.00', '8.70', 'TID-7865484325', NULL, '<span class=\"random-ids\"><u><b>TID-7865484325</b></u></span> Confirmed You have Received <span class=\"money\"><b><u>Ksh 7,900.00 </u></b></span> from <b>cate</b> <b>tracy</b> (<span class=\"phone-number\"><u>1234567890</u></span>). On (<b>Jan 1, 2023</b> at <b>3:42 PM</b>) New BOM balance is <span class=\"money\"><b><u>Ksh 53,906.00</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, 'Jan 1, 2023', '3:42 PM', '2023-01-01 12:42:43'),
(284, NULL, NULL, NULL, 33, 34, '200.00', NULL, 'S', NULL, 'nelson', 'lemein', '0741642093', '6.00', '0.00', 'cate', 'tracy', '1234567890', '0.00', '0.60', 'TID-6829791873', '<span class=\"random-ids\"><u><b>TID-6829791873</b></u></span> Confirmed You have successfully sent <span class=\"money\"><b><u>Ksh 200.00 </u></b></span> to <b>cate tracy</b> (<span class=\"phone-number\"><u>1234567890</u></span>). On (<b>Jan 1, 2023</b> at <b>8:05 PM</b>). New BOM balance is <span class=\"money\"><b><u>Ksh 45,800.00</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, NULL, 'Jan 1, 2023', '8:05 PM', '2023-01-01 17:05:02'),
(285, NULL, NULL, NULL, 33, 34, '200.00', NULL, NULL, 'R', 'nelson', 'lemein', '0741642093', '6.00', '0.00', 'cate', 'tracy', '1234567890', '0.00', '0.60', 'TID-6829791873', NULL, '<span class=\"random-ids\"><u><b>TID-6829791873</b></u></span> Confirmed You have Received <span class=\"money\"><b><u>Ksh 200.00 </u></b></span> from <b>nelson</b> <b>lemein</b> (<span class=\"phone-number\"><u>0741642093</u></span>). On (<b>Jan 1, 2023</b> at <b>8:05 PM</b>) New BOM balance is <span class=\"money\"><b><u>Ksh 50,342.00</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, 'Jan 1, 2023', '8:05 PM', '2023-01-01 17:05:02'),
(286, NULL, NULL, NULL, 34, 33, '1200.00', NULL, NULL, 'R', 'cate', 'tracy', '1234567890', '22.00', '0.00', 'nelson', 'lemein', '0741642093', '0.00', '2.20', 'TID-8251428453', NULL, '<span class=\"random-ids\"><u><b>TID-8251428453</b></u></span> Confirmed You have Received <span class=\"money\"><b><u>Ksh 1,200.00 </u></b></span> from <b>cate</b> <b>tracy</b> (<span class=\"phone-number\"><u>1234567890</u></span>). On (<b>Jan 1, 2023</b> at <b>9:21 PM</b>) New BOM balance is <span class=\"money\"><b><u>Ksh 47,000.00</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, 'Jan 1, 2023', '9:21 PM', '2023-01-01 18:21:53'),
(287, NULL, NULL, NULL, 34, 33, '1200.00', NULL, 'S', NULL, 'cate', 'tracy', '1234567890', '22.00', '0.00', 'nelson', 'lemein', '0741642093', '0.00', '2.20', 'TID-8251428453', '<span class=\"random-ids\"><u><b>TID-8251428453</b></u></span> Confirmed You have successfully sent <span class=\"money\"><b><u>Ksh 1,200.00 </u></b></span> to <b>nelson lemein</b> (<span class=\"phone-number\"><u>0741642093</u></span>). On (<b>Jan 1, 2023</b> at <b>9:21 PM</b>). New BOM balance is <span class=\"money\"><b><u>Ksh 49,120.00</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, NULL, 'Jan 1, 2023', '9:21 PM', '2023-01-01 18:21:53'),
(288, NULL, NULL, NULL, 40, NULL, NULL, 'W', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TID-4317986753', NULL, NULL, NULL, '<span class=\"random-ids\"><u><b>TID-4317986753</b></u></span> Failed. You do not have sufficient funds to send <span class=\"money\"><b><u>Ksh 12.00</u></b></span> Your balance is <span class=\"money\"><b><u>Ksh 0.00</u></b></span> You should pay a transaction fee of <span class=\"money\"><b><u>Ksh 0.00</u></b></span> Please top up <span class=\"money\"><b><u>Ksh 12.00</u></b></span> and Try Again', NULL, 'Jan 1, 2023', '9:45 PM', '2023-01-01 18:45:54'),
(289, NULL, NULL, NULL, 40, NULL, NULL, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TID-8367463854', NULL, NULL, NULL, NULL, '<span class=\"random-ids\"><u><b>TID-8367463854</b></u></span> Failed. You can not send money to your own number! Your number is <span class=\"phone-number\"><u>0711223344</u></span> And recipient number is <span class=\"phone-number\"><u>0711223344</u></span>. Please Check the number And Try Again', 'Jan 1, 2023', '9:46 PM', '2023-01-01 18:46:27'),
(290, NULL, NULL, NULL, 33, NULL, NULL, 'E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TID-7894183765', NULL, NULL, NULL, NULL, '<span class=\"random-ids\"><u><b>TID-7894183765</b></u></span> Failed. You can not send money to your own number! Your number is <span class=\"phone-number\"><u>0741642093</u></span> And recipient number is <span class=\"phone-number\"><u>0741642093</u></span>. Please Check the number And Try Again', 'Jan 4, 2023', '6:56 PM', '2023-01-04 15:56:16'),
(291, NULL, NULL, NULL, 33, 34, '200.00', NULL, 'S', NULL, 'nelson', 'lemein', '0741642093', '6.00', '0.00', 'cate', 'tracy', '1234567890', '0.00', '0.60', 'TID-6891245238', '<span class=\"random-ids\"><u><b>TID-6891245238</b></u></span> Confirmed You have successfully sent <span class=\"money\"><b><u>Ksh 200.00 </u></b></span> to <b>cate tracy</b> (<span class=\"phone-number\"><u>1234567890</u></span>). On (<b>Jan 4, 2023</b> at <b>7:49 PM</b>). New BOM balance is <span class=\"money\"><b><u>Ksh 46,794.00</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, NULL, 'Jan 4, 2023', '7:49 PM', '2023-01-04 16:49:43'),
(292, NULL, NULL, NULL, 33, 34, '200.00', NULL, NULL, 'R', 'nelson', 'lemein', '0741642093', '6.00', '0.00', 'cate', 'tracy', '1234567890', '0.00', '0.60', 'TID-6891245238', NULL, '<span class=\"random-ids\"><u><b>TID-6891245238</b></u></span> Confirmed You have Received <span class=\"money\"><b><u>Ksh 200.00 </u></b></span> from <b>nelson</b> <b>lemein</b> (<span class=\"phone-number\"><u>0741642093</u></span>). On (<b>Jan 4, 2023</b> at <b>7:49 PM</b>) New BOM balance is <span class=\"money\"><b><u>Ksh 49,320.00</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, 'Jan 4, 2023', '7:49 PM', '2023-01-04 16:49:43'),
(293, NULL, NULL, NULL, 41, NULL, NULL, 'W', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TID-1695778165', NULL, NULL, NULL, '<span class=\"random-ids\"><u><b>TID-1695778165</b></u></span> Failed. You do not have sufficient funds to send <span class=\"money\"><b><u>Ksh 11.00</u></b></span> Your balance is <span class=\"money\"><b><u>Ksh 0.00</u></b></span> You should pay a transaction fee of <span class=\"money\"><b><u>Ksh 0.00</u></b></span> Please top up <span class=\"money\"><b><u>Ksh 11.00</u></b></span> and Try Again', NULL, 'Jan 4, 2023', '9:10 PM', '2023-01-04 18:10:56'),
(294, NULL, NULL, NULL, 33, 34, '250.57', NULL, 'S', NULL, 'nelson', 'lemein', '0741642093', '6.00', '0.00', 'cate', 'tracy', '1234567890', '0.00', '0.60', 'TID-2768389432', '<span class=\"random-ids\"><u><b>TID-2768389432</b></u></span> Confirmed You have successfully sent <span class=\"money\"><b><u>Ksh 250.57 </u></b></span> to <b>cate tracy</b> (<span class=\"phone-number\"><u>1234567890</u></span>). On (<b>Jan 5, 2023</b> at <b>1:13 AM</b>). New BOM balance is <span class=\"money\"><b><u>Ksh 46,537.43</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, NULL, 'Jan 5, 2023', '1:13 AM', '2023-01-04 22:13:30'),
(295, NULL, NULL, NULL, 33, 34, '250.57', NULL, NULL, 'R', 'nelson', 'lemein', '0741642093', '6.00', '0.00', 'cate', 'tracy', '1234567890', '0.00', '0.60', 'TID-2768389432', NULL, '<span class=\"random-ids\"><u><b>TID-2768389432</b></u></span> Confirmed You have Received <span class=\"money\"><b><u>Ksh 250.57 </u></b></span> from <b>nelson</b> <b>lemein</b> (<span class=\"phone-number\"><u>0741642093</u></span>). On (<b>Jan 5, 2023</b> at <b>1:13 AM</b>) New BOM balance is <span class=\"money\"><b><u>Ksh 49,570.57</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, 'Jan 5, 2023', '1:13 AM', '2023-01-04 22:13:30'),
(296, NULL, NULL, NULL, 33, NULL, NULL, 'W', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TID-4158791246', NULL, NULL, NULL, '<span class=\"random-ids\"><u><b>TID-4158791246</b></u></span> Failed. You can not send funds less than <span class=\"money\"><b><u>Ksh 5.00</u></b></span> Current balance is <span class=\"money\"><b><u> Ksh 46,331.16</u></b></span> Please top up and try again.', NULL, 'Jan 9, 2023', '6:41 AM', '2023-01-09 03:41:48'),
(297, NULL, NULL, NULL, 33, NULL, NULL, 'W', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TID-4618789461', NULL, NULL, NULL, '<span class=\"random-ids\"><u><b>TID-4618789461</b></u></span> Failed. You can not send funds less than <span class=\"money\"><b><u>Ksh 5.00</u></b></span> Current balance is <span class=\"money\"><b><u> Ksh 46,331.16</u></b></span> Please top up and try again.', NULL, 'Jan 9, 2023', '6:42 AM', '2023-01-09 03:42:53');
INSERT INTO `all_transactions` (`id`, `company_id`, `bank_id`, `agent_id`, `sender_id`, `recipient_id`, `amount`, `mode`, `sender_mode`, `recipient_mode`, `sender_first_name`, `sender_last_name`, `sender_mobile`, `sender_transaction_cost`, `sender_income`, `recipient_first_name`, `recipient_last_name`, `recipient_mobile`, `recipient_transaction_cost`, `recipient_income`, `transaction_id`, `sender_success_message`, `recipient_success_message`, `pending_message`, `warning_message`, `error_message`, `current_date`, `current_time`, `date_time`) VALUES
(298, NULL, NULL, NULL, 33, 34, '1000.00', NULL, 'S', NULL, 'nelson', 'lemein', '0741642093', '12.00', '0.00', 'cate', 'tracy', '1234567890', '0.00', '1.20', 'TID-5423967312', '<span class=\"random-ids\"><u><b>TID-5423967312</b></u></span> Confirmed You have successfully sent <span class=\"money\"><b><u>Ksh 1,000.00 </u></b></span> to <b>cate tracy</b> (<span class=\"phone-number\"><u>1234567890</u></span>). On (<b>Jan 9, 2023</b> at <b>6:43 AM</b>). New BOM balance is <span class=\"money\"><b><u>Ksh 45,319.16</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, NULL, 'Jan 9, 2023', '6:43 AM', '2023-01-09 03:43:30'),
(299, NULL, NULL, NULL, 33, 34, '1000.00', NULL, NULL, 'R', 'nelson', 'lemein', '0741642093', '12.00', '0.00', 'cate', 'tracy', '1234567890', '0.00', '1.20', 'TID-5423967312', NULL, '<span class=\"random-ids\"><u><b>TID-5423967312</b></u></span> Confirmed You have Received <span class=\"money\"><b><u>Ksh 1,000.00 </u></b></span> from <b>nelson</b> <b>lemein</b> (<span class=\"phone-number\"><u>0741642093</u></span>). On (<b>Jan 9, 2023</b> at <b>6:43 AM</b>) New BOM balance is <span class=\"money\"><b><u>Ksh 50,570.57</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, 'Jan 9, 2023', '6:43 AM', '2023-01-09 03:43:30'),
(300, NULL, NULL, NULL, 33, 34, '200.57', NULL, 'S', NULL, 'nelson', 'lemein', '0741642093', '6.00', '0.00', 'cate', 'tracy', '1234567890', '0.00', '0.60', 'TID-5127992415', '<span class=\"random-ids\"><u><b>TID-5127992415</b></u></span> Confirmed You have successfully sent <span class=\"money\"><b><u>Ksh 200.57 </u></b></span> to <b>cate tracy</b> (<span class=\"phone-number\"><u>1234567890</u></span>). On (<b>Jan 9, 2023</b> at <b>5:13 PM</b>). New BOM balance is <span class=\"money\"><b><u>Ksh 45,112.59</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, NULL, 'Jan 9, 2023', '5:13 PM', '2023-01-09 14:13:52'),
(301, NULL, NULL, NULL, 33, 34, '200.57', NULL, NULL, 'R', 'nelson', 'lemein', '0741642093', '6.00', '0.00', 'cate', 'tracy', '1234567890', '0.00', '0.60', 'TID-5127992415', NULL, '<span class=\"random-ids\"><u><b>TID-5127992415</b></u></span> Confirmed You have Received <span class=\"money\"><b><u>Ksh 200.57 </u></b></span> from <b>nelson</b> <b>lemein</b> (<span class=\"phone-number\"><u>0741642093</u></span>). On (<b>Jan 9, 2023</b> at <b>5:13 PM</b>) New BOM balance is <span class=\"money\"><b><u>Ksh aN</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, 'Jan 9, 2023', '5:13 PM', '2023-01-09 14:13:52'),
(302, NULL, NULL, NULL, 33, 34, '100.59', NULL, NULL, 'R', 'nelson', 'lemein', '0741642093', '0.00', '0.00', 'cate', 'tracy', '1234567890', '0.00', '0.00', 'TID-6942593127', NULL, '<span class=\"random-ids\"><u><b>TID-6942593127</b></u></span> Confirmed You have Received <span class=\"money\"><b><u>Ksh 100.59 </u></b></span> from <b>nelson</b> <b>lemein</b> (<span class=\"phone-number\"><u>0741642093</u></span>). On (<b>Jan 9, 2023</b> at <b>5:20 PM</b>) New BOM balance is <span class=\"money\"><b><u>Ksh aN</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, 'Jan 9, 2023', '5:20 PM', '2023-01-09 14:20:06'),
(303, NULL, NULL, NULL, 33, 34, '100.59', NULL, 'S', NULL, 'nelson', 'lemein', '0741642093', '0.00', '0.00', 'cate', 'tracy', '1234567890', '0.00', '0.00', 'TID-6942593127', '<span class=\"random-ids\"><u><b>TID-6942593127</b></u></span> Confirmed You have successfully sent <span class=\"money\"><b><u>Ksh 100.59 </u></b></span> to <b>cate tracy</b> (<span class=\"phone-number\"><u>1234567890</u></span>). On (<b>Jan 9, 2023</b> at <b>5:20 PM</b>). New BOM balance is <span class=\"money\"><b><u>Ksh 45,012.00</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, NULL, 'Jan 9, 2023', '5:20 PM', '2023-01-09 14:20:06'),
(304, NULL, NULL, NULL, 33, 34, '150.99', NULL, NULL, 'R', 'nelson', 'lemein', '0741642093', '6.00', '0.00', 'cate', 'tracy', '1234567890', '0.00', '0.60', 'TID-7514623176', NULL, '<span class=\"random-ids\"><u><b>TID-7514623176</b></u></span> Confirmed You have Received <span class=\"money\"><b><u>Ksh 150.99 </u></b></span> from <b>nelson</b> <b>lemein</b> (<span class=\"phone-number\"><u>0741642093</u></span>). On (<b>Jan 9, 2023</b> at <b>5:49 PM</b>) New BOM balance is <span class=\"money\"><b><u>Ksh aN</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, 'Jan 9, 2023', '5:49 PM', '2023-01-09 14:49:14'),
(305, NULL, NULL, NULL, 33, 34, '150.99', NULL, 'S', NULL, 'nelson', 'lemein', '0741642093', '6.00', '0.00', 'cate', 'tracy', '1234567890', '0.00', '0.60', 'TID-7514623176', '<span class=\"random-ids\"><u><b>TID-7514623176</b></u></span> Confirmed You have successfully sent <span class=\"money\"><b><u>Ksh 150.99 </u></b></span> to <b>cate tracy</b> (<span class=\"phone-number\"><u>1234567890</u></span>). On (<b>Jan 9, 2023</b> at <b>5:49 PM</b>). New BOM balance is <span class=\"money\"><b><u>Ksh 93,274.01</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, NULL, 'Jan 9, 2023', '5:49 PM', '2023-01-09 14:49:14'),
(306, NULL, NULL, NULL, 34, 33, '20000.98', NULL, NULL, 'R', 'cate', 'tracy', '1234567890', '0.00', '0.00', 'nelson', 'lemein', '0741642093', '0.00', '0.00', 'TID-8451784695', NULL, '<span class=\"random-ids\"><u><b>TID-8451784695</b></u></span> Confirmed You have Received <span class=\"money\"><b><u>Ksh 20,000.98 </u></b></span> from <b>cate</b> <b>tracy</b> (<span class=\"phone-number\"><u>1234567890</u></span>). On (<b>Jan 9, 2023</b> at <b>5:51 PM</b>) New BOM balance is <span class=\"money\"><b><u>Ksh aN</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, 'Jan 9, 2023', '5:51 PM', '2023-01-09 14:51:47'),
(307, NULL, NULL, NULL, 34, 33, '20000.98', NULL, 'S', NULL, 'cate', 'tracy', '1234567890', '0.00', '0.00', 'nelson', 'lemein', '0741642093', '0.00', '0.00', 'TID-8451784695', '<span class=\"random-ids\"><u><b>TID-8451784695</b></u></span> Confirmed You have successfully sent <span class=\"money\"><b><u>Ksh 20,000.98 </u></b></span> to <b>nelson lemein</b> (<span class=\"phone-number\"><u>0741642093</u></span>). On (<b>Jan 9, 2023</b> at <b>5:51 PM</b>). New BOM balance is <span class=\"money\"><b><u>Ksh 30,569.59</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, NULL, 'Jan 9, 2023', '5:51 PM', '2023-01-09 14:51:47'),
(308, NULL, NULL, NULL, 33, 34, '230.00', NULL, 'S', NULL, 'nelson', 'lemein', '0741642093', '6.00', '0.00', 'cate', 'tracy', '1234567890', '0.00', '0.60', 'TID-8196327891', '<span class=\"random-ids\"><u><b>TID-8196327891</b></u></span> Confirmed You have successfully sent <span class=\"money\"><b><u>Ksh 230.00 </u></b></span> to <b>cate tracy</b> (<span class=\"phone-number\"><u>1234567890</u></span>). On (<b>Jan 9, 2023</b> at <b>5:57 PM</b>). New BOM balance is <span class=\"money\"><b><u>Ksh 93,038.01</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, NULL, 'Jan 9, 2023', '5:57 PM', '2023-01-09 14:57:53'),
(309, NULL, NULL, NULL, 33, 34, '230.00', NULL, NULL, 'R', 'nelson', 'lemein', '0741642093', '6.00', '0.00', 'cate', 'tracy', '1234567890', '0.00', '0.60', 'TID-8196327891', NULL, '<span class=\"random-ids\"><u><b>TID-8196327891</b></u></span> Confirmed You have Received <span class=\"money\"><b><u>Ksh 230.00 </u></b></span> from <b>nelson</b> <b>lemein</b> (<span class=\"phone-number\"><u>0741642093</u></span>). On (<b>Jan 9, 2023</b> at <b>5:57 PM</b>) New BOM balance is <span class=\"money\"><b><u>Ksh 30,799.59</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, 'Jan 9, 2023', '5:57 PM', '2023-01-09 14:57:53'),
(310, NULL, NULL, NULL, 33, 34, '500.99', NULL, 'S', NULL, 'nelson', 'lemein', '0741642093', '0.00', '0.00', 'cate', 'tracy', '1234567890', '0.00', '0.00', 'TID-8936163421', '<span class=\"random-ids\"><u><b>TID-8936163421</b></u></span> Confirmed You have successfully sent <span class=\"money\"><b><u>Ksh 500.99 </u></b></span> to <b>cate tracy</b> (<span class=\"phone-number\"><u>1234567890</u></span>). On (<b>Jan 9, 2023</b> at <b>5:58 PM</b>). New BOM balance is <span class=\"money\"><b><u>Ksh 92,537.02</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, NULL, 'Jan 9, 2023', '5:58 PM', '2023-01-09 14:58:46'),
(311, NULL, NULL, NULL, 33, 34, '500.99', NULL, NULL, 'R', 'nelson', 'lemein', '0741642093', '0.00', '0.00', 'cate', 'tracy', '1234567890', '0.00', '0.00', 'TID-8936163421', NULL, '<span class=\"random-ids\"><u><b>TID-8936163421</b></u></span> Confirmed You have Received <span class=\"money\"><b><u>Ksh 500.99 </u></b></span> from <b>nelson</b> <b>lemein</b> (<span class=\"phone-number\"><u>0741642093</u></span>). On (<b>Jan 9, 2023</b> at <b>5:58 PM</b>) New BOM balance is <span class=\"money\"><b><u>Ksh 31,300.58</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, 'Jan 9, 2023', '5:58 PM', '2023-01-09 14:58:46'),
(312, NULL, NULL, NULL, 33, 34, '300.99', NULL, 'S', NULL, 'nelson', 'lemein', '0741642093', '6.00', '0.00', 'cate', 'tracy', '1234567890', '0.00', '0.60', 'TID-5196745187', '<span class=\"random-ids\"><u><b>TID-5196745187</b></u></span> Confirmed You have successfully sent <span class=\"money\"><b><u>Ksh 300.99 </u></b></span> to <b>cate tracy</b> (<span class=\"phone-number\"><u>1234567890</u></span>). On (<b>Jan 9, 2023</b> at <b>6:01 PM</b>). New BOM balance is <span class=\"money\"><b><u>Ksh 92,230.03</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, NULL, 'Jan 9, 2023', '6:01 PM', '2023-01-09 15:01:03'),
(313, NULL, NULL, NULL, 33, 34, '300.99', NULL, NULL, 'R', 'nelson', 'lemein', '0741642093', '6.00', '0.00', 'cate', 'tracy', '1234567890', '0.00', '0.60', 'TID-5196745187', NULL, '<span class=\"random-ids\"><u><b>TID-5196745187</b></u></span> Confirmed You have Received <span class=\"money\"><b><u>Ksh 300.99 </u></b></span> from <b>nelson</b> <b>lemein</b> (<span class=\"phone-number\"><u>0741642093</u></span>). On (<b>Jan 9, 2023</b> at <b>6:01 PM</b>) New BOM balance is <span class=\"money\"><b><u>Ksh 31,601.57</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, 'Jan 9, 2023', '6:01 PM', '2023-01-09 15:01:03'),
(314, NULL, NULL, NULL, 34, 33, '1000.57', NULL, 'S', NULL, 'cate', 'tracy', '1234567890', '0.00', '0.00', 'nelson', 'lemein', '0741642093', '0.00', '0.00', 'TID-2936489615', '<span class=\"random-ids\"><u><b>TID-2936489615</b></u></span> Confirmed You have successfully sent <span class=\"money\"><b><u>Ksh 1,000.57 </u></b></span> to <b>nelson lemein</b> (<span class=\"phone-number\"><u>0741642093</u></span>). On (<b>Jan 9, 2023</b> at <b>6:02 PM</b>). New BOM balance is <span class=\"money\"><b><u>Ksh 30,601.00</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, NULL, 'Jan 9, 2023', '6:02 PM', '2023-01-09 15:02:26'),
(315, NULL, NULL, NULL, 34, 33, '1000.57', NULL, NULL, 'R', 'cate', 'tracy', '1234567890', '0.00', '0.00', 'nelson', 'lemein', '0741642093', '0.00', '0.00', 'TID-2936489615', NULL, '<span class=\"random-ids\"><u><b>TID-2936489615</b></u></span> Confirmed You have Received <span class=\"money\"><b><u>Ksh 1,000.57 </u></b></span> from <b>cate</b> <b>tracy</b> (<span class=\"phone-number\"><u>1234567890</u></span>). On (<b>Jan 9, 2023</b> at <b>6:02 PM</b>) New BOM balance is <span class=\"money\"><b><u>Ksh 93,230.60</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, 'Jan 9, 2023', '6:02 PM', '2023-01-09 15:02:26'),
(316, NULL, NULL, NULL, 34, 33, '200.70', NULL, 'S', NULL, 'cate', 'tracy', '1234567890', '6.00', '0.00', 'nelson', 'lemein', '0741642093', '0.00', '0.60', 'TID-5239463821', '<span class=\"random-ids\"><u><b>TID-5239463821</b></u></span> Confirmed You have successfully sent <span class=\"money\"><b><u>Ksh 200.70 </u></b></span> to <b>nelson lemein</b> (<span class=\"phone-number\"><u>0741642093</u></span>). On (<b>Jan 9, 2023</b> at <b>6:06 PM</b>). New BOM balance is <span class=\"money\"><b><u>Ksh 30,394.30</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, NULL, 'Jan 9, 2023', '6:06 PM', '2023-01-09 15:06:56'),
(317, NULL, NULL, NULL, 34, 33, '200.70', NULL, NULL, 'R', 'cate', 'tracy', '1234567890', '6.00', '0.00', 'nelson', 'lemein', '0741642093', '0.00', '0.60', 'TID-5239463821', NULL, '<span class=\"random-ids\"><u><b>TID-5239463821</b></u></span> Confirmed You have Received <span class=\"money\"><b><u>Ksh 200.70 </u></b></span> from <b>cate</b> <b>tracy</b> (<span class=\"phone-number\"><u>1234567890</u></span>). On (<b>Jan 9, 2023</b> at <b>6:06 PM</b>) New BOM balance is <span class=\"money\"><b><u>Ksh 93,431.30</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, 'Jan 9, 2023', '6:06 PM', '2023-01-09 15:06:56'),
(318, NULL, NULL, NULL, 34, 33, '200.00', NULL, 'S', NULL, 'cate', 'tracy', '1234567890', '6.00', '0.00', 'nelson', 'lemein', '0741642093', '0.00', '0.60', 'TID-6835782134', '<span class=\"random-ids\"><u><b>TID-6835782134</b></u></span> Confirmed You have successfully sent <span class=\"money\"><b><u>Ksh 200.00 </u></b></span> to <b>nelson lemein</b> (<span class=\"phone-number\"><u>0741642093</u></span>). On (<b>Jan 9, 2023</b> at <b>6:10 PM</b>). New BOM balance is <span class=\"money\"><b><u>Ksh 30,188.30</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, NULL, 'Jan 9, 2023', '6:10 PM', '2023-01-09 15:10:03'),
(319, NULL, NULL, NULL, 34, 33, '200.00', NULL, NULL, 'R', 'cate', 'tracy', '1234567890', '6.00', '0.00', 'nelson', 'lemein', '0741642093', '0.00', '0.60', 'TID-6835782134', NULL, '<span class=\"random-ids\"><u><b>TID-6835782134</b></u></span> Confirmed You have Received <span class=\"money\"><b><u>Ksh 200.00 </u></b></span> from <b>cate</b> <b>tracy</b> (<span class=\"phone-number\"><u>1234567890</u></span>). On (<b>Jan 9, 2023</b> at <b>6:10 PM</b>) New BOM balance is <span class=\"money\"><b><u>Ksh 93,631.30</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, 'Jan 9, 2023', '6:10 PM', '2023-01-09 15:10:03'),
(320, NULL, NULL, NULL, 33, 34, '270.00', NULL, NULL, 'R', 'nelson', 'lemein', '0741642093', '6.00', '0.00', 'cate', 'tracy', '1234567890', '0.00', '0.60', 'TID-3754137219', NULL, '<span class=\"random-ids\"><u><b>TID-3754137219</b></u></span> Confirmed You have Received <span class=\"money\"><b><u>Ksh 270.00 </u></b></span> from <b>nelson</b> <b>lemein</b> (<span class=\"phone-number\"><u>0741642093</u></span>). On (<b>Jan 9, 2023</b> at <b>6:12 PM</b>) New BOM balance is <span class=\"money\"><b><u>Ksh 30,458.30</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, 'Jan 9, 2023', '6:12 PM', '2023-01-09 15:12:19'),
(321, NULL, NULL, NULL, 33, 34, '270.00', NULL, 'S', NULL, 'nelson', 'lemein', '0741642093', '6.00', '0.00', 'cate', 'tracy', '1234567890', '0.00', '0.60', 'TID-3754137219', '<span class=\"random-ids\"><u><b>TID-3754137219</b></u></span> Confirmed You have successfully sent <span class=\"money\"><b><u>Ksh 270.00 </u></b></span> to <b>cate tracy</b> (<span class=\"phone-number\"><u>1234567890</u></span>). On (<b>Jan 9, 2023</b> at <b>6:12 PM</b>). New BOM balance is <span class=\"money\"><b><u>Ksh 93,355.30</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, NULL, 'Jan 9, 2023', '6:12 PM', '2023-01-09 15:12:19'),
(322, NULL, NULL, NULL, 34, 33, '300.00', NULL, 'S', NULL, 'cate', 'tracy', '1234567890', '6.00', '0.00', 'nelson', 'lemein', '0741642093', '0.00', '0.60', 'TID-2845134716', '<span class=\"random-ids\"><u><b>TID-2845134716</b></u></span> Confirmed You have successfully sent <span class=\"money\"><b><u>Ksh 300.00 </u></b></span> to <b>nelson lemein</b> (<span class=\"phone-number\"><u>0741642093</u></span>). On (<b>Jan 9, 2023</b> at <b>6:14 PM</b>). New BOM balance is <span class=\"money\"><b><u>Ksh 30,152.30</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, NULL, 'Jan 9, 2023', '6:14 PM', '2023-01-09 15:14:49'),
(323, NULL, NULL, NULL, 34, 33, '300.00', NULL, NULL, 'R', 'cate', 'tracy', '1234567890', '6.00', '0.00', 'nelson', 'lemein', '0741642093', '0.00', '0.60', 'TID-2845134716', NULL, '<span class=\"random-ids\"><u><b>TID-2845134716</b></u></span> Confirmed You have Received <span class=\"money\"><b><u>Ksh 300.00 </u></b></span> from <b>cate</b> <b>tracy</b> (<span class=\"phone-number\"><u>1234567890</u></span>). On (<b>Jan 9, 2023</b> at <b>6:14 PM</b>) New BOM balance is <span class=\"money\"><b><u>Ksh 93,655.30</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, 'Jan 9, 2023', '6:14 PM', '2023-01-09 15:14:49'),
(324, NULL, NULL, NULL, 33, 34, '600.00', NULL, 'S', NULL, 'nelson', 'lemein', '0741642093', '12.00', '0.00', 'cate', 'tracy', '1234567890', '0.00', '1.20', 'TID-6135894218', '<span class=\"random-ids\"><u><b>TID-6135894218</b></u></span> Confirmed You have successfully sent <span class=\"money\"><b><u>Ksh 600.00 </u></b></span> to <b>cate tracy</b> (<span class=\"phone-number\"><u>1234567890</u></span>). On (<b>Jan 9, 2023</b> at <b>6:16 PM</b>). New BOM balance is <span class=\"money\"><b><u>Ksh 93,043.30</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, NULL, 'Jan 9, 2023', '6:16 PM', '2023-01-09 15:16:48'),
(325, NULL, NULL, NULL, 33, 34, '600.00', NULL, NULL, 'R', 'nelson', 'lemein', '0741642093', '12.00', '0.00', 'cate', 'tracy', '1234567890', '0.00', '1.20', 'TID-6135894218', NULL, '<span class=\"random-ids\"><u><b>TID-6135894218</b></u></span> Confirmed You have Received <span class=\"money\"><b><u>Ksh 600.00 </u></b></span> from <b>nelson</b> <b>lemein</b> (<span class=\"phone-number\"><u>0741642093</u></span>). On (<b>Jan 9, 2023</b> at <b>6:16 PM</b>) New BOM balance is <span class=\"money\"><b><u>Ksh 30,752.30</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, 'Jan 9, 2023', '6:16 PM', '2023-01-09 15:16:48'),
(326, NULL, NULL, NULL, 34, 33, '700.00', NULL, 'S', NULL, 'cate', 'tracy', '1234567890', '12.00', '0.00', 'nelson', 'lemein', '0741642093', '0.00', '1.20', 'TID-9657262518', '<span class=\"random-ids\"><u><b>TID-9657262518</b></u></span> Confirmed You have successfully sent <span class=\"money\"><b><u>Ksh 700.00 </u></b></span> to <b>nelson lemein</b> (<span class=\"phone-number\"><u>0741642093</u></span>). On (<b>Jan 9, 2023</b> at <b>6:17 PM</b>). New BOM balance is <span class=\"money\"><b><u>Ksh 30,040.30</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, NULL, 'Jan 9, 2023', '6:17 PM', '2023-01-09 15:17:59'),
(327, NULL, NULL, NULL, 34, 33, '700.00', NULL, NULL, 'R', 'cate', 'tracy', '1234567890', '12.00', '0.00', 'nelson', 'lemein', '0741642093', '0.00', '1.20', 'TID-9657262518', NULL, '<span class=\"random-ids\"><u><b>TID-9657262518</b></u></span> Confirmed You have Received <span class=\"money\"><b><u>Ksh 700.00 </u></b></span> from <b>cate</b> <b>tracy</b> (<span class=\"phone-number\"><u>1234567890</u></span>). On (<b>Jan 9, 2023</b> at <b>6:17 PM</b>) New BOM balance is <span class=\"money\"><b><u>Ksh 93,743.30</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, 'Jan 9, 2023', '6:17 PM', '2023-01-09 15:17:59'),
(328, NULL, NULL, NULL, 34, 33, '950.50', NULL, NULL, 'R', 'cate', 'tracy', '1234567890', '12.00', '0.00', 'nelson', 'lemein', '0741642093', '0.00', '1.20', 'TID-8693771386', NULL, '<span class=\"random-ids\"><u><b>TID-8693771386</b></u></span> Confirmed You have Received <span class=\"money\"><b><u>Ksh 950.50 </u></b></span> from <b>cate</b> <b>tracy</b> (<span class=\"phone-number\"><u>1234567890</u></span>). On (<b>Jan 9, 2023</b> at <b>6:21 PM</b>) New BOM balance is <span class=\"money\"><b><u>Ksh 94,693.80</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, 'Jan 9, 2023', '6:21 PM', '2023-01-09 15:21:04'),
(329, NULL, NULL, NULL, 34, 33, '950.50', NULL, 'S', NULL, 'cate', 'tracy', '1234567890', '12.00', '0.00', 'nelson', 'lemein', '0741642093', '0.00', '1.20', 'TID-8693771386', '<span class=\"random-ids\"><u><b>TID-8693771386</b></u></span> Confirmed You have successfully sent <span class=\"money\"><b><u>Ksh 950.50 </u></b></span> to <b>nelson lemein</b> (<span class=\"phone-number\"><u>0741642093</u></span>). On (<b>Jan 9, 2023</b> at <b>6:21 PM</b>). New BOM balance is <span class=\"money\"><b><u>Ksh 29,077.80</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, NULL, 'Jan 9, 2023', '6:21 PM', '2023-01-09 15:21:04'),
(330, NULL, NULL, NULL, 33, 34, '300.00', NULL, 'S', NULL, 'nelson', 'lemein', '0741642093', '6.00', '0.00', 'cate', 'tracy', '1234567890', '0.00', '0.60', 'TID-4596184761', '<span class=\"random-ids\"><u><b>TID-4596184761</b></u></span> Confirmed You have successfully sent <span class=\"money\"><b><u>Ksh 300.00 </u></b></span> to <b>cate tracy</b> (<span class=\"phone-number\"><u>1234567890</u></span>). On (<b>Jan 18, 2023</b> at <b>1:10 AM</b>). New BOM balance is <span class=\"money\"><b><u>Ksh 94,387.80</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, NULL, 'Jan 18, 2023', '1:10 AM', '2023-01-17 22:10:46'),
(331, NULL, NULL, NULL, 33, 34, '300.00', NULL, NULL, 'R', 'nelson', 'lemein', '0741642093', '6.00', '0.00', 'cate', 'tracy', '1234567890', '0.00', '0.60', 'TID-4596184761', NULL, '<span class=\"random-ids\"><u><b>TID-4596184761</b></u></span> Confirmed You have Received <span class=\"money\"><b><u>Ksh 300.00 </u></b></span> from <b>nelson</b> <b>lemein</b> (<span class=\"phone-number\"><u>0741642093</u></span>). On (<b>Jan 18, 2023</b> at <b>1:10 AM</b>) New BOM balance is <span class=\"money\"><b><u>Ksh 29,377.80</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, 'Jan 18, 2023', '1:10 AM', '2023-01-17 22:10:46'),
(332, NULL, NULL, NULL, 33, 34, '250.00', NULL, 'S', NULL, 'nelson', 'lemein', '0741642093', '6.00', '0.00', 'cate', 'tracy', '1234567890', '0.00', '0.60', 'TID-4536158297', '<span class=\"random-ids\"><u><b>TID-4536158297</b></u></span> Confirmed You have successfully sent <span class=\"money\"><b><u>Ksh 250.00 </u></b></span> to <b>cate tracy</b> (<span class=\"phone-number\"><u>1234567890</u></span>). On (<b>Jan 24, 2023</b> at <b>11:18 PM</b>). New BOM balance is <span class=\"money\"><b><u>Ksh 94,131.80</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, NULL, 'Jan 24, 2023', '11:18 PM', '2023-01-24 20:18:03'),
(333, NULL, NULL, NULL, 33, 34, '250.00', NULL, NULL, 'R', 'nelson', 'lemein', '0741642093', '6.00', '0.00', 'cate', 'tracy', '1234567890', '0.00', '0.60', 'TID-4536158297', NULL, '<span class=\"random-ids\"><u><b>TID-4536158297</b></u></span> Confirmed You have Received <span class=\"money\"><b><u>Ksh 250.00 </u></b></span> from <b>nelson</b> <b>lemein</b> (<span class=\"phone-number\"><u>0741642093</u></span>). On (<b>Jan 24, 2023</b> at <b>11:18 PM</b>) New BOM balance is <span class=\"money\"><b><u>Ksh 29,627.80</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, 'Jan 24, 2023', '11:18 PM', '2023-01-24 20:18:03'),
(334, NULL, NULL, NULL, 33, 34, '450.00', NULL, 'S', NULL, 'nelson', 'lemein', '0741642093', '6.00', '0.00', 'cate', 'tracy', '1234567890', '0.00', '0.60', 'TID-4357842956', '<span class=\"random-ids\"><u><b>TID-4357842956</b></u></span> Confirmed You have successfully sent <span class=\"money\"><b><u>Ksh 450.00 </u></b></span> to <b>cate tracy</b> (<span class=\"phone-number\"><u>1234567890</u></span>). On (<b>Jan 24, 2023</b> at <b>11:25 PM</b>). New BOM balance is <span class=\"money\"><b><u>Ksh 93,675.80</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, NULL, 'Jan 24, 2023', '11:25 PM', '2023-01-24 20:25:57'),
(335, NULL, NULL, NULL, 33, 34, '450.00', NULL, NULL, 'R', 'nelson', 'lemein', '0741642093', '6.00', '0.00', 'cate', 'tracy', '1234567890', '0.00', '0.60', 'TID-4357842956', NULL, '<span class=\"random-ids\"><u><b>TID-4357842956</b></u></span> Confirmed You have Received <span class=\"money\"><b><u>Ksh 450.00 </u></b></span> from <b>nelson</b> <b>lemein</b> (<span class=\"phone-number\"><u>0741642093</u></span>). On (<b>Jan 24, 2023</b> at <b>11:25 PM</b>) New BOM balance is <span class=\"money\"><b><u>Ksh 30,077.80</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, 'Jan 24, 2023', '11:25 PM', '2023-01-24 20:25:57'),
(336, NULL, NULL, NULL, 34, 33, '400.00', NULL, 'S', NULL, 'cate', 'tracy', '1234567890', '6.00', '0.00', 'nelson', 'lemein', '0741642093', '0.00', '0.60', 'TID-6715374198', '<span class=\"random-ids\"><u><b>TID-6715374198</b></u></span> Confirmed You have successfully sent <span class=\"money\"><b><u>Ksh 400.00 </u></b></span> to <b>nelson lemein</b> (<span class=\"phone-number\"><u>0741642093</u></span>). On (<b>Jan 25, 2023</b> at <b>3:16 AM</b>). New BOM balance is <span class=\"money\"><b><u>Ksh 29,671.80</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, NULL, 'Jan 25, 2023', '3:16 AM', '2023-01-25 00:16:18'),
(337, NULL, NULL, NULL, 34, 33, '400.00', NULL, NULL, 'R', 'cate', 'tracy', '1234567890', '6.00', '0.00', 'nelson', 'lemein', '0741642093', '0.00', '0.60', 'TID-6715374198', NULL, '<span class=\"random-ids\"><u><b>TID-6715374198</b></u></span> Confirmed You have Received <span class=\"money\"><b><u>Ksh 400.00 </u></b></span> from <b>cate</b> <b>tracy</b> (<span class=\"phone-number\"><u>1234567890</u></span>). On (<b>Jan 25, 2023</b> at <b>3:16 AM</b>) New BOM balance is <span class=\"money\"><b><u>Ksh 94,075.80</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, 'Jan 25, 2023', '3:16 AM', '2023-01-25 00:16:18'),
(338, NULL, NULL, NULL, 34, 33, '1200.00', NULL, 'S', NULL, 'cate', 'tracy', '1234567890', '22.00', '0.00', 'nelson', 'lemein', '0741642093', '0.00', '2.20', 'TID-8197274861', '<span class=\"random-ids\"><u><b>TID-8197274861</b></u></span> Confirmed You have successfully sent <span class=\"money\"><b><u>Ksh 1,200.00 </u></b></span> to <b>nelson lemein</b> (<span class=\"phone-number\"><u>0741642093</u></span>). On (<b>Jan 25, 2023</b> at <b>8:13 PM</b>). New BOM balance is <span class=\"money\"><b><u>Ksh 28,449.80</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, NULL, 'Jan 25, 2023', '8:13 PM', '2023-01-25 17:13:45'),
(339, NULL, NULL, NULL, 34, 33, '1200.00', NULL, NULL, 'R', 'cate', 'tracy', '1234567890', '22.00', '0.00', 'nelson', 'lemein', '0741642093', '0.00', '2.20', 'TID-8197274861', NULL, '<span class=\"random-ids\"><u><b>TID-8197274861</b></u></span> Confirmed You have Received <span class=\"money\"><b><u>Ksh 1,200.00 </u></b></span> from <b>cate</b> <b>tracy</b> (<span class=\"phone-number\"><u>1234567890</u></span>). On (<b>Jan 25, 2023</b> at <b>8:13 PM</b>) New BOM balance is <span class=\"money\"><b><u>Ksh 95,275.80</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, 'Jan 25, 2023', '8:13 PM', '2023-01-25 17:13:45'),
(340, NULL, NULL, NULL, 33, 34, '400.00', NULL, 'S', NULL, 'nelson', 'lemein', '0741642093', '6.00', '0.00', 'cate', 'tracy', '1234567890', '0.00', '0.60', 'TID-9235461879', '<span class=\"random-ids\"><u><b>TID-9235461879</b></u></span> Confirmed You have successfully sent <span class=\"money\"><b><u>Ksh 400.00 </u></b></span> to <b>cate tracy</b> (<span class=\"phone-number\"><u>1234567890</u></span>). On (<b>Jan 25, 2023</b> at <b>8:28 PM</b>). New BOM balance is <span class=\"money\"><b><u>Ksh 94,869.80</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, NULL, 'Jan 25, 2023', '8:28 PM', '2023-01-25 17:28:18'),
(341, NULL, NULL, NULL, 33, 34, '400.00', NULL, NULL, 'R', 'nelson', 'lemein', '0741642093', '6.00', '0.00', 'cate', 'tracy', '1234567890', '0.00', '0.60', 'TID-9235461879', NULL, '<span class=\"random-ids\"><u><b>TID-9235461879</b></u></span> Confirmed You have Received <span class=\"money\"><b><u>Ksh 400.00 </u></b></span> from <b>nelson</b> <b>lemein</b> (<span class=\"phone-number\"><u>0741642093</u></span>). On (<b>Jan 25, 2023</b> at <b>8:28 PM</b>) New BOM balance is <span class=\"money\"><b><u>Ksh 28,849.80</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, 'Jan 25, 2023', '8:28 PM', '2023-01-25 17:28:18'),
(342, NULL, NULL, NULL, 33, 34, '100.00', NULL, 'S', NULL, 'nelson', 'lemein', '0741642093', '0.00', '0.00', 'cate', 'tracy', '1234567890', '0.00', '0.00', 'TID-1982362389', '<span class=\"random-ids\"><u><b>TID-1982362389</b></u></span> Confirmed You have successfully sent <span class=\"money\"><b><u>Ksh 100.00 </u></b></span> to <b>cate tracy</b> (<span class=\"phone-number\"><u>1234567890</u></span>). On (<b>Jan 25, 2023</b> at <b>8:37 PM</b>). New BOM balance is <span class=\"money\"><b><u>Ksh 94,769.80</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, NULL, 'Jan 25, 2023', '8:37 PM', '2023-01-25 17:37:06'),
(343, NULL, NULL, NULL, 33, 34, '100.00', NULL, NULL, 'R', 'nelson', 'lemein', '0741642093', '0.00', '0.00', 'cate', 'tracy', '1234567890', '0.00', '0.00', 'TID-1982362389', NULL, '<span class=\"random-ids\"><u><b>TID-1982362389</b></u></span> Confirmed You have Received <span class=\"money\"><b><u>Ksh 100.00 </u></b></span> from <b>nelson</b> <b>lemein</b> (<span class=\"phone-number\"><u>0741642093</u></span>). On (<b>Jan 25, 2023</b> at <b>8:37 PM</b>) New BOM balance is <span class=\"money\"><b><u>Ksh 28,949.80</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, 'Jan 25, 2023', '8:37 PM', '2023-01-25 17:37:06'),
(344, NULL, NULL, NULL, 33, NULL, '0.00', 'E', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', NULL, NULL, NULL, '0.00', '0.00', 'TID-5726312794', NULL, NULL, NULL, NULL, '<span class=\"random-ids\"><u><b>TID-5726312794</b></u></span> Failed. You can not send money to your own number! Your number is <span class=\"phone-number\"><u>0741642093</u></span> And recipient number is <span class=\"phone-number\"><u>0741642093</u></span>. Please Check the number And Try Again', 'Jan 25, 2023', '9:37 PM', '2023-01-25 18:37:08'),
(345, NULL, NULL, NULL, 33, NULL, '0.00', 'E', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', NULL, NULL, NULL, '0.00', '0.00', 'TID-6125989476', NULL, NULL, NULL, NULL, '<span class=\"random-ids\"><u><b>TID-6125989476</b></u></span> Failed. You can not send money to your own number! Your number is <span class=\"phone-number\"><u>0741642093</u></span> And recipient number is <span class=\"phone-number\"><u>0741642093</u></span>. Please Check the number And Try Again', 'Jan 25, 2023', '10:17 PM', '2023-01-25 19:17:12'),
(346, NULL, NULL, NULL, 33, 34, '200.00', NULL, 'S', NULL, 'nelson', 'lemein', '0741642093', '6.00', '0.00', 'cate', 'tracy', '1234567890', '0.00', '0.60', 'TID-2165347528', '<span class=\"random-ids\"><u><b>TID-2165347528</b></u></span> Confirmed You have successfully sent <span class=\"money\"><b><u>Ksh 200.00 </u></b></span> to <b>cate tracy</b> (<span class=\"phone-number\"><u>1234567890</u></span>). On (<b>Jan 25, 2023</b> at <b>10:36 PM</b>). New BOM balance is <span class=\"money\"><b><u>Ksh 94,563.80</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, NULL, 'Jan 25, 2023', '10:36 PM', '2023-01-25 19:36:41'),
(347, NULL, NULL, NULL, 33, 34, '200.00', NULL, NULL, 'R', 'nelson', 'lemein', '0741642093', '6.00', '0.00', 'cate', 'tracy', '1234567890', '0.00', '0.60', 'TID-2165347528', NULL, '<span class=\"random-ids\"><u><b>TID-2165347528</b></u></span> Confirmed You have Received <span class=\"money\"><b><u>Ksh 200.00 </u></b></span> from <b>nelson</b> <b>lemein</b> (<span class=\"phone-number\"><u>0741642093</u></span>). On (<b>Jan 25, 2023</b> at <b>10:36 PM</b>) New BOM balance is <span class=\"money\"><b><u>Ksh 29,149.80</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, 'Jan 25, 2023', '10:36 PM', '2023-01-25 19:36:41'),
(348, NULL, NULL, NULL, 33, 40, '400.00', NULL, 'S', NULL, 'nelson', 'lemein', '0741642093', '6.00', '0.00', 'willy', 'paul', '0711223344', '0.00', '0.60', 'TID-6395127389', '<span class=\"random-ids\"><u><b>TID-6395127389</b></u></span> Confirmed You have successfully sent <span class=\"money\"><b><u>Ksh 400.00 </u></b></span> to <b>willy paul</b> (<span class=\"phone-number\"><u>0711223344</u></span>). On (<b>Jan 25, 2023</b> at <b>10:46 PM</b>). New BOM balance is <span class=\"money\"><b><u>Ksh 94,157.80</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, NULL, 'Jan 25, 2023', '10:46 PM', '2023-01-25 19:46:11'),
(349, NULL, NULL, NULL, 33, 40, '400.00', NULL, NULL, 'R', 'nelson', 'lemein', '0741642093', '6.00', '0.00', 'willy', 'paul', '0711223344', '0.00', '0.60', 'TID-6395127389', NULL, '<span class=\"random-ids\"><u><b>TID-6395127389</b></u></span> Confirmed You have Received <span class=\"money\"><b><u>Ksh 400.00 </u></b></span> from <b>nelson</b> <b>lemein</b> (<span class=\"phone-number\"><u>0741642093</u></span>). On (<b>Jan 25, 2023</b> at <b>10:46 PM</b>) New BOM balance is <span class=\"money\"><b><u>Ksh 400.00</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, 'Jan 25, 2023', '10:46 PM', '2023-01-25 19:46:11'),
(350, NULL, NULL, NULL, 40, 33, '300.00', NULL, NULL, 'R', 'willy', 'paul', '0711223344', '6.00', '0.00', 'nelson', 'lemein', '0741642093', '0.00', '0.60', 'TID-8376512843', NULL, '<span class=\"random-ids\"><u><b>TID-8376512843</b></u></span> Confirmed You have Received <span class=\"money\"><b><u>Ksh 300.00 </u></b></span> from <b>willy</b> <b>paul</b> (<span class=\"phone-number\"><u>0711223344</u></span>). On (<b>Jan 25, 2023</b> at <b>10:48 PM</b>) New BOM balance is <span class=\"money\"><b><u>Ksh 94,457.80</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, 'Jan 25, 2023', '10:48 PM', '2023-01-25 19:48:21'),
(351, NULL, NULL, NULL, 40, 33, '300.00', NULL, 'S', NULL, 'willy', 'paul', '0711223344', '6.00', '0.00', 'nelson', 'lemein', '0741642093', '0.00', '0.60', 'TID-8376512843', '<span class=\"random-ids\"><u><b>TID-8376512843</b></u></span> Confirmed You have successfully sent <span class=\"money\"><b><u>Ksh 300.00 </u></b></span> to <b>nelson lemein</b> (<span class=\"phone-number\"><u>0741642093</u></span>). On (<b>Jan 25, 2023</b> at <b>10:48 PM</b>). New BOM balance is <span class=\"money\"><b><u>Ksh 94.00</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, NULL, 'Jan 25, 2023', '10:48 PM', '2023-01-25 19:48:21'),
(352, NULL, NULL, NULL, 33, 40, '800.00', NULL, NULL, 'R', 'nelson', 'lemein', '0741642093', '12.00', '0.00', 'willy', 'paul', '0711223344', '0.00', '1.20', 'TID-2347614965', NULL, '<span class=\"random-ids\"><u><b>TID-2347614965</b></u></span> Confirmed You have Received <span class=\"money\"><b><u>Ksh 800.00 </u></b></span> from <b>nelson</b> <b>lemein</b> (<span class=\"phone-number\"><u>0741642093</u></span>). On (<b>Jan 25, 2023</b> at <b>10:49 PM</b>) New BOM balance is <span class=\"money\"><b><u>Ksh 894.00</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, 'Jan 25, 2023', '10:49 PM', '2023-01-25 19:49:18'),
(353, NULL, NULL, NULL, 33, 40, '800.00', NULL, 'S', NULL, 'nelson', 'lemein', '0741642093', '12.00', '0.00', 'willy', 'paul', '0711223344', '0.00', '1.20', 'TID-2347614965', '<span class=\"random-ids\"><u><b>TID-2347614965</b></u></span> Confirmed You have successfully sent <span class=\"money\"><b><u>Ksh 800.00 </u></b></span> to <b>willy paul</b> (<span class=\"phone-number\"><u>0711223344</u></span>). On (<b>Jan 25, 2023</b> at <b>10:49 PM</b>). New BOM balance is <span class=\"money\"><b><u>Ksh 93,645.80</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, NULL, 'Jan 25, 2023', '10:49 PM', '2023-01-25 19:49:18'),
(354, NULL, NULL, NULL, 40, NULL, '0.00', 'W', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', NULL, NULL, NULL, '0.00', '0.00', 'TID-4138745362', NULL, NULL, NULL, '<span class=\"random-ids\"><u><b>TID-4138745362</b></u></span> Failed. You do not have sufficient funds to send <span class=\"money\"><b><u>Ksh 2,330.00</u></b></span> Your balance is <span class=\"money\"><b><u>Ksh 894.00</u></b></span> You should pay a transaction fee of <span class=\"money\"><b><u>Ksh 32.00</u></b></span> Please top up <span class=\"money\"><b><u>Ksh 1,468.00</u></b></span> and Try Again', NULL, 'Jan 25, 2023', '10:55 PM', '2023-01-25 19:55:27'),
(355, NULL, NULL, NULL, 40, 33, '200.00', NULL, 'S', NULL, 'willy', 'paul', '0711223344', '6.00', '0.00', 'nelson', 'lemein', '0741642093', '0.00', '0.60', 'TID-8532675128', '<span class=\"random-ids\"><u><b>TID-8532675128</b></u></span> Confirmed You have successfully sent <span class=\"money\"><b><u>Ksh 200.00 </u></b></span> to <b>nelson lemein</b> (<span class=\"phone-number\"><u>0741642093</u></span>). On (<b>Jan 25, 2023</b> at <b>11:00 PM</b>). New BOM balance is <span class=\"money\"><b><u>Ksh 688.00</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, NULL, 'Jan 25, 2023', '11:00 PM', '2023-01-25 20:00:10'),
(356, NULL, NULL, NULL, 40, 33, '200.00', NULL, NULL, 'R', 'willy', 'paul', '0711223344', '6.00', '0.00', 'nelson', 'lemein', '0741642093', '0.00', '0.60', 'TID-8532675128', NULL, '<span class=\"random-ids\"><u><b>TID-8532675128</b></u></span> Confirmed You have Received <span class=\"money\"><b><u>Ksh 200.00 </u></b></span> from <b>willy</b> <b>paul</b> (<span class=\"phone-number\"><u>0711223344</u></span>). On (<b>Jan 25, 2023</b> at <b>11:00 PM</b>) New BOM balance is <span class=\"money\"><b><u>Ksh 93,845.80</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, 'Jan 25, 2023', '11:00 PM', '2023-01-25 20:00:10'),
(357, NULL, NULL, NULL, 33, 39, '700.00', NULL, 'S', NULL, 'nelson', 'lemein', '0741642093', '12.00', '0.00', 'denos', 'lenos', '0112345678', '0.00', '1.20', 'TID-7361413645', '<span class=\"random-ids\"><u><b>TID-7361413645</b></u></span> Confirmed You have successfully sent <span class=\"money\"><b><u>Ksh 700.00 </u></b></span> to <b>denos lenos</b> (<span class=\"phone-number\"><u>0112345678</u></span>). On (<b>Jan 26, 2023</b> at <b>12:32 AM</b>). New BOM balance is <span class=\"money\"><b><u>Ksh 93,133.80</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, NULL, 'Jan 26, 2023', '12:32 AM', '2023-01-25 21:32:04'),
(358, NULL, NULL, NULL, 33, 39, '700.00', NULL, NULL, 'R', 'nelson', 'lemein', '0741642093', '12.00', '0.00', 'denos', 'lenos', '0112345678', '0.00', '1.20', 'TID-7361413645', NULL, '<span class=\"random-ids\"><u><b>TID-7361413645</b></u></span> Confirmed You have Received <span class=\"money\"><b><u>Ksh 700.00 </u></b></span> from <b>nelson</b> <b>lemein</b> (<span class=\"phone-number\"><u>0741642093</u></span>). On (<b>Jan 26, 2023</b> at <b>12:32 AM</b>) New BOM balance is <span class=\"money\"><b><u>Ksh 700.00</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, 'Jan 26, 2023', '12:32 AM', '2023-01-25 21:32:04'),
(359, NULL, NULL, NULL, 33, 39, '80.00', NULL, 'S', NULL, 'nelson', 'lemein', '0741642093', '0.00', '0.00', 'denos', 'lenos', '0112345678', '0.00', '0.00', 'TID-7958472583', '<span class=\"random-ids\"><u><b>TID-7958472583</b></u></span> Confirmed You have successfully sent <span class=\"money\"><b><u>Ksh 80.00 </u></b></span> to <b>denos lenos</b> (<span class=\"phone-number\"><u>0112345678</u></span>). On (<b>Jan 26, 2023</b> at <b>1:04 AM</b>). New BOM balance is <span class=\"money\"><b><u>Ksh 93,053.80</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, NULL, 'Jan 26, 2023', '1:04 AM', '2023-01-25 22:04:45'),
(360, NULL, NULL, NULL, 33, 39, '80.00', NULL, NULL, 'R', 'nelson', 'lemein', '0741642093', '0.00', '0.00', 'denos', 'lenos', '0112345678', '0.00', '0.00', 'TID-7958472583', NULL, '<span class=\"random-ids\"><u><b>TID-7958472583</b></u></span> Confirmed You have Received <span class=\"money\"><b><u>Ksh 80.00 </u></b></span> from <b>nelson</b> <b>lemein</b> (<span class=\"phone-number\"><u>0741642093</u></span>). On (<b>Jan 26, 2023</b> at <b>1:04 AM</b>) New BOM balance is <span class=\"money\"><b><u>Ksh 780.00</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, 'Jan 26, 2023', '1:04 AM', '2023-01-25 22:04:45'),
(361, NULL, NULL, NULL, 39, 33, '350.00', NULL, 'S', NULL, 'denos', 'lenos', '0112345678', '6.00', '0.00', 'nelson', 'lemein', '0741642093', '0.00', '0.60', 'TID-8431689641', '<span class=\"random-ids\"><u><b>TID-8431689641</b></u></span> Confirmed You have successfully sent <span class=\"money\"><b><u>Ksh 350.00 </u></b></span> to <b>nelson lemein</b> (<span class=\"phone-number\"><u>0741642093</u></span>). On (<b>Jan 26, 2023</b> at <b>1:21 AM</b>). New BOM balance is <span class=\"money\"><b><u>Ksh 424.00</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, NULL, 'Jan 26, 2023', '1:21 AM', '2023-01-25 22:21:53'),
(362, NULL, NULL, NULL, 39, 33, '350.00', NULL, NULL, 'R', 'denos', 'lenos', '0112345678', '6.00', '0.00', 'nelson', 'lemein', '0741642093', '0.00', '0.60', 'TID-8431689641', NULL, '<span class=\"random-ids\"><u><b>TID-8431689641</b></u></span> Confirmed You have Received <span class=\"money\"><b><u>Ksh 350.00 </u></b></span> from <b>denos</b> <b>lenos</b> (<span class=\"phone-number\"><u>0112345678</u></span>). On (<b>Jan 26, 2023</b> at <b>1:21 AM</b>) New BOM balance is <span class=\"money\"><b><u>Ksh 93,403.80</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, 'Jan 26, 2023', '1:21 AM', '2023-01-25 22:21:53'),
(363, NULL, NULL, NULL, 33, 34, '200.00', NULL, 'S', NULL, 'nelson', 'lemein', '0741642093', '6.00', '0.00', 'cate', 'tracy', '1234567890', '0.00', '0.60', 'TID-5869136495', '<span class=\"random-ids\"><u><b>TID-5869136495</b></u></span> Confirmed You have successfully sent <span class=\"money\"><b><u>Ksh 200.00 </u></b></span> to <b>cate tracy</b> (<span class=\"phone-number\"><u>1234567890</u></span>). On (<b>Jan 26, 2023</b> at <b>1:25 AM</b>). New BOM balance is <span class=\"money\"><b><u>Ksh 93,197.80</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, NULL, 'Jan 26, 2023', '1:25 AM', '2023-01-25 22:25:17'),
(364, NULL, NULL, NULL, 33, 34, '200.00', NULL, NULL, 'R', 'nelson', 'lemein', '0741642093', '6.00', '0.00', 'cate', 'tracy', '1234567890', '0.00', '0.60', 'TID-5869136495', NULL, '<span class=\"random-ids\"><u><b>TID-5869136495</b></u></span> Confirmed You have Received <span class=\"money\"><b><u>Ksh 200.00 </u></b></span> from <b>nelson</b> <b>lemein</b> (<span class=\"phone-number\"><u>0741642093</u></span>). On (<b>Jan 26, 2023</b> at <b>1:25 AM</b>) New BOM balance is <span class=\"money\"><b><u>Ksh 29,349.80</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, 'Jan 26, 2023', '1:25 AM', '2023-01-25 22:25:17'),
(365, NULL, NULL, NULL, 34, 33, '9000.00', NULL, 'S', NULL, 'cate', 'tracy', '1234567890', '87.00', '0.00', 'nelson', 'lemein', '0741642093', '0.00', '8.70', 'TID-5748312738', '<span class=\"random-ids\"><u><b>TID-5748312738</b></u></span> Confirmed You have successfully sent <span class=\"money\"><b><u>Ksh 9,000.00 </u></b></span> to <b>nelson lemein</b> (<span class=\"phone-number\"><u>0741642093</u></span>). On (<b>Jan 26, 2023</b> at <b>1:41 AM</b>). New BOM balance is <span class=\"money\"><b><u>Ksh 20,262.80</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, NULL, 'Jan 26, 2023', '1:41 AM', '2023-01-25 22:41:13'),
(366, NULL, NULL, NULL, 34, 33, '9000.00', NULL, NULL, 'R', 'cate', 'tracy', '1234567890', '87.00', '0.00', 'nelson', 'lemein', '0741642093', '0.00', '8.70', 'TID-5748312738', NULL, '<span class=\"random-ids\"><u><b>TID-5748312738</b></u></span> Confirmed You have Received <span class=\"money\"><b><u>Ksh 9,000.00 </u></b></span> from <b>cate</b> <b>tracy</b> (<span class=\"phone-number\"><u>1234567890</u></span>). On (<b>Jan 26, 2023</b> at <b>1:41 AM</b>) New BOM balance is <span class=\"money\"><b><u>Ksh 102,197.80</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, 'Jan 26, 2023', '1:41 AM', '2023-01-25 22:41:13'),
(367, NULL, NULL, NULL, 34, 33, '4000.00', NULL, 'S', NULL, 'cate', 'tracy', '1234567890', '55.00', '0.00', 'nelson', 'lemein', '0741642093', '0.00', '5.50', 'TID-8964118926', '<span class=\"random-ids\"><u><b>TID-8964118926</b></u></span> Confirmed You have successfully sent <span class=\"money\"><b><u>Ksh 4,000.00 </u></b></span> to <b>nelson lemein</b> (<span class=\"phone-number\"><u>0741642093</u></span>). On (<b>Jan 26, 2023</b> at <b>1:43 AM</b>). New BOM balance is <span class=\"money\"><b><u>Ksh 16,207.80</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, NULL, 'Jan 26, 2023', '1:43 AM', '2023-01-25 22:43:54'),
(368, NULL, NULL, NULL, 34, 33, '4000.00', NULL, NULL, 'R', 'cate', 'tracy', '1234567890', '55.00', '0.00', 'nelson', 'lemein', '0741642093', '0.00', '5.50', 'TID-8964118926', NULL, '<span class=\"random-ids\"><u><b>TID-8964118926</b></u></span> Confirmed You have Received <span class=\"money\"><b><u>Ksh 4,000.00 </u></b></span> from <b>cate</b> <b>tracy</b> (<span class=\"phone-number\"><u>1234567890</u></span>). On (<b>Jan 26, 2023</b> at <b>1:43 AM</b>) New BOM balance is <span class=\"money\"><b><u>Ksh 97,197.80</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, 'Jan 26, 2023', '1:43 AM', '2023-01-25 22:43:54'),
(369, NULL, NULL, NULL, 34, 33, '6000.00', NULL, 'S', NULL, 'cate', 'tracy', '1234567890', '75.00', '0.00', 'nelson', 'lemein', '0741642093', '0.00', '7.50', 'TID-2145343862', '<span class=\"random-ids\"><u><b>TID-2145343862</b></u></span> Confirmed You have successfully sent <span class=\"money\"><b><u>Ksh 6,000.00 </u></b></span> to <b>nelson lemein</b> (<span class=\"phone-number\"><u>0741642093</u></span>). On (<b>Jan 26, 2023</b> at <b>1:45 AM</b>). New BOM balance is <span class=\"money\"><b><u>Ksh 10,132.80</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, NULL, 'Jan 26, 2023', '1:45 AM', '2023-01-25 22:45:44'),
(370, NULL, NULL, NULL, 34, 33, '6000.00', NULL, NULL, 'R', 'cate', 'tracy', '1234567890', '75.00', '0.00', 'nelson', 'lemein', '0741642093', '0.00', '7.50', 'TID-2145343862', NULL, '<span class=\"random-ids\"><u><b>TID-2145343862</b></u></span> Confirmed You have Received <span class=\"money\"><b><u>Ksh 6,000.00 </u></b></span> from <b>cate</b> <b>tracy</b> (<span class=\"phone-number\"><u>1234567890</u></span>). On (<b>Jan 26, 2023</b> at <b>1:45 AM</b>) New BOM balance is <span class=\"money\"><b><u>Ksh 103,197.80</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, 'Jan 26, 2023', '1:45 AM', '2023-01-25 22:45:44'),
(371, NULL, NULL, NULL, 33, 34, '230.00', NULL, 'S', NULL, 'nelson', 'lemein', '0741642093', '6.00', '0.00', 'cate', 'tracy', '1234567890', '0.00', '0.60', 'TID-9672567289', '<span class=\"random-ids\"><u><b>TID-9672567289</b></u></span> Confirmed You have successfully sent <span class=\"money\"><b><u>Ksh 230.00 </u></b></span> to <b>cate tracy</b> (<span class=\"phone-number\"><u>1234567890</u></span>). On (<b>Jan 27, 2023</b> at <b>1:56 PM</b>). New BOM balance is <span class=\"money\"><b><u>Ksh 96,961.80</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, NULL, 'Jan 27, 2023', '1:56 PM', '2023-01-27 10:56:40');
INSERT INTO `all_transactions` (`id`, `company_id`, `bank_id`, `agent_id`, `sender_id`, `recipient_id`, `amount`, `mode`, `sender_mode`, `recipient_mode`, `sender_first_name`, `sender_last_name`, `sender_mobile`, `sender_transaction_cost`, `sender_income`, `recipient_first_name`, `recipient_last_name`, `recipient_mobile`, `recipient_transaction_cost`, `recipient_income`, `transaction_id`, `sender_success_message`, `recipient_success_message`, `pending_message`, `warning_message`, `error_message`, `current_date`, `current_time`, `date_time`) VALUES
(372, NULL, NULL, NULL, 33, 34, '230.00', NULL, NULL, 'R', 'nelson', 'lemein', '0741642093', '6.00', '0.00', 'cate', 'tracy', '1234567890', '0.00', '0.60', 'TID-9672567289', NULL, '<span class=\"random-ids\"><u><b>TID-9672567289</b></u></span> Confirmed You have Received <span class=\"money\"><b><u>Ksh 230.00 </u></b></span> from <b>nelson</b> <b>lemein</b> (<span class=\"phone-number\"><u>0741642093</u></span>). On (<b>Jan 27, 2023</b> at <b>1:56 PM</b>) New BOM balance is <span class=\"money\"><b><u>Ksh 10,362.80</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, 'Jan 27, 2023', '1:56 PM', '2023-01-27 10:56:40'),
(373, NULL, NULL, NULL, 33, 34, '200.00', NULL, 'S', NULL, 'nelson', 'lemein', '0741642093', '6.00', '0.00', 'cate', 'tracy', '1234567890', '0.00', '0.60', 'TID-1542913854', '<span class=\"random-ids\"><u><b>TID-1542913854</b></u></span> Confirmed You have successfully sent <span class=\"money\"><b><u>Ksh 200.00 </u></b></span> to <b>cate tracy</b> (<span class=\"phone-number\"><u>1234567890</u></span>). On (<b>Jan 27, 2023</b> at <b>2:26 PM</b>). New BOM balance is <span class=\"money\"><b><u>Ksh 96,755.80</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, NULL, 'Jan 27, 2023', '2:26 PM', '2023-01-27 11:26:19'),
(374, NULL, NULL, NULL, 33, 34, '200.00', NULL, NULL, 'R', 'nelson', 'lemein', '0741642093', '6.00', '0.00', 'cate', 'tracy', '1234567890', '0.00', '0.60', 'TID-1542913854', NULL, '<span class=\"random-ids\"><u><b>TID-1542913854</b></u></span> Confirmed You have Received <span class=\"money\"><b><u>Ksh 200.00 </u></b></span> from <b>nelson</b> <b>lemein</b> (<span class=\"phone-number\"><u>0741642093</u></span>). On (<b>Jan 27, 2023</b> at <b>2:26 PM</b>) New BOM balance is <span class=\"money\"><b><u>Ksh 10,562.80</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, 'Jan 27, 2023', '2:26 PM', '2023-01-27 11:26:19'),
(375, NULL, NULL, NULL, 33, 34, '300.00', NULL, 'S', NULL, 'nelson', 'lemein', '0741642093', '6.00', '0.00', 'cate', 'tracy', '1234567890', '0.00', '0.60', 'TID-6832791823', '<span class=\"random-ids\"><u><b>TID-6832791823</b></u></span> Confirmed You have successfully sent <span class=\"money\"><b><u>Ksh 300.00 </u></b></span> to <b>cate tracy</b> (<span class=\"phone-number\"><u>1234567890</u></span>). On (<b>Jan 27, 2023</b> at <b>2:27 PM</b>). New BOM balance is <span class=\"money\"><b><u>Ksh 96,449.80</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, NULL, 'Jan 27, 2023', '2:27 PM', '2023-01-27 11:27:23'),
(376, NULL, NULL, NULL, 33, 34, '300.00', NULL, NULL, 'R', 'nelson', 'lemein', '0741642093', '6.00', '0.00', 'cate', 'tracy', '1234567890', '0.00', '0.60', 'TID-6832791823', NULL, '<span class=\"random-ids\"><u><b>TID-6832791823</b></u></span> Confirmed You have Received <span class=\"money\"><b><u>Ksh 300.00 </u></b></span> from <b>nelson</b> <b>lemein</b> (<span class=\"phone-number\"><u>0741642093</u></span>). On (<b>Jan 27, 2023</b> at <b>2:27 PM</b>) New BOM balance is <span class=\"money\"><b><u>Ksh 10,862.80</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, 'Jan 27, 2023', '2:27 PM', '2023-01-27 11:27:23'),
(377, NULL, NULL, NULL, 33, 34, '100.00', NULL, 'S', NULL, 'nelson', 'lemein', '0741642093', '0.00', '0.00', 'cate', 'tracy', '1234567890', '0.00', '0.00', 'TID-7146253891', '<span class=\"random-ids\"><u><b>TID-7146253891</b></u></span> Confirmed You have successfully sent <span class=\"money\"><b><u>Ksh 100.00 </u></b></span> to <b>cate tracy</b> (<span class=\"phone-number\"><u>1234567890</u></span>). On (<b>Jan 27, 2023</b> at <b>2:29 PM</b>). New BOM balance is <span class=\"money\"><b><u>Ksh 96,349.80</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, NULL, 'Jan 27, 2023', '2:29 PM', '2023-01-27 11:29:57'),
(378, NULL, NULL, NULL, 33, 34, '100.00', NULL, NULL, 'R', 'nelson', 'lemein', '0741642093', '0.00', '0.00', 'cate', 'tracy', '1234567890', '0.00', '0.00', 'TID-7146253891', NULL, '<span class=\"random-ids\"><u><b>TID-7146253891</b></u></span> Confirmed You have Received <span class=\"money\"><b><u>Ksh 100.00 </u></b></span> from <b>nelson</b> <b>lemein</b> (<span class=\"phone-number\"><u>0741642093</u></span>). On (<b>Jan 27, 2023</b> at <b>2:29 PM</b>) New BOM balance is <span class=\"money\"><b><u>Ksh 10,962.80</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, 'Jan 27, 2023', '2:29 PM', '2023-01-27 11:29:57'),
(379, NULL, NULL, NULL, 33, 34, '200.00', NULL, 'S', NULL, 'nelson', 'lemein', '0741642093', '6.00', '0.00', 'cate', 'tracy', '1234567890', '0.00', '0.60', 'TID-5942848932', '<span class=\"random-ids\"><u><b>TID-5942848932</b></u></span> Confirmed You have successfully sent <span class=\"money\"><b><u>Ksh 200.00 </u></b></span> to <b>cate tracy</b> (<span class=\"phone-number\"><u>1234567890</u></span>). On (<b>Jan 28, 2023</b> at <b>12:34 AM</b>). New BOM balance is <span class=\"money\"><b><u>Ksh 96,143.80</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, NULL, 'Jan 28, 2023', '12:34 AM', '2023-01-27 21:34:46'),
(380, NULL, NULL, NULL, 33, 34, '200.00', NULL, NULL, 'R', 'nelson', 'lemein', '0741642093', '6.00', '0.00', 'cate', 'tracy', '1234567890', '0.00', '0.60', 'TID-5942848932', NULL, '<span class=\"random-ids\"><u><b>TID-5942848932</b></u></span> Confirmed You have Received <span class=\"money\"><b><u>Ksh 200.00 </u></b></span> from <b>nelson</b> <b>lemein</b> (<span class=\"phone-number\"><u>0741642093</u></span>). On (<b>Jan 28, 2023</b> at <b>12:34 AM</b>) New BOM balance is <span class=\"money\"><b><u>Ksh 11,162.80</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, 'Jan 28, 2023', '12:34 AM', '2023-01-27 21:34:46'),
(381, NULL, NULL, NULL, 40, 33, '100.00', NULL, 'S', NULL, 'willy', 'paul', '0711223344', '0.00', '0.00', 'nelson', 'lemein', '0741642093', '0.00', '0.00', 'TID-8136753279', '<span class=\"random-ids\"><u><b>TID-8136753279</b></u></span> Confirmed You have successfully sent <span class=\"money\"><b><u>Ksh 100.00 </u></b></span> to <b>nelson lemein</b> (<span class=\"phone-number\"><u>0741642093</u></span>). On (<b>Jan 29, 2023</b> at <b>12:48 AM</b>). New BOM balance is <span class=\"money\"><b><u>Ksh 588.00</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, NULL, 'Jan 29, 2023', '12:48 AM', '2023-01-28 21:48:01'),
(382, NULL, NULL, NULL, 40, 33, '100.00', NULL, NULL, 'R', 'willy', 'paul', '0711223344', '0.00', '0.00', 'nelson', 'lemein', '0741642093', '0.00', '0.00', 'TID-8136753279', NULL, '<span class=\"random-ids\"><u><b>TID-8136753279</b></u></span> Confirmed You have Received <span class=\"money\"><b><u>Ksh 100.00 </u></b></span> from <b>willy</b> <b>paul</b> (<span class=\"phone-number\"><u>0711223344</u></span>). On (<b>Jan 29, 2023</b> at <b>12:48 AM</b>) New BOM balance is <span class=\"money\"><b><u>Ksh 96,243.80</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, 'Jan 29, 2023', '12:48 AM', '2023-01-28 21:48:01'),
(383, NULL, NULL, NULL, 40, 33, '150.00', NULL, 'S', NULL, 'willy', 'paul', '0711223344', '6.00', '0.00', 'nelson', 'lemein', '0741642093', '0.00', '0.60', 'TID-4985183594', '<span class=\"random-ids\"><u><b>TID-4985183594</b></u></span> Confirmed You have successfully sent <span class=\"money\"><b><u>Ksh 150.00 </u></b></span> to <b>nelson lemein</b> (<span class=\"phone-number\"><u>0741642093</u></span>). On (<b>Jan 29, 2023</b> at <b>12:49 AM</b>). New BOM balance is <span class=\"money\"><b><u>Ksh 432.00</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, NULL, 'Jan 29, 2023', '12:49 AM', '2023-01-28 21:49:33'),
(384, NULL, NULL, NULL, 40, 33, '150.00', NULL, NULL, 'R', 'willy', 'paul', '0711223344', '6.00', '0.00', 'nelson', 'lemein', '0741642093', '0.00', '0.60', 'TID-4985183594', NULL, '<span class=\"random-ids\"><u><b>TID-4985183594</b></u></span> Confirmed You have Received <span class=\"money\"><b><u>Ksh 150.00 </u></b></span> from <b>willy</b> <b>paul</b> (<span class=\"phone-number\"><u>0711223344</u></span>). On (<b>Jan 29, 2023</b> at <b>12:49 AM</b>) New BOM balance is <span class=\"money\"><b><u>Ksh 96,393.80</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, 'Jan 29, 2023', '12:49 AM', '2023-01-28 21:49:33'),
(385, NULL, NULL, NULL, 40, 33, '200.00', NULL, 'S', NULL, 'willy', 'paul', '0711223344', '6.00', '0.00', 'nelson', 'lemein', '0741642093', '0.00', '0.60', 'TID-5176261574', '<span class=\"random-ids\"><u><b>TID-5176261574</b></u></span> Confirmed You have successfully sent <span class=\"money\"><b><u>Ksh 200.00 </u></b></span> to <b>nelson lemein</b> (<span class=\"phone-number\"><u>0741642093</u></span>). On (<b>Jan 29, 2023</b> at <b>12:53 AM</b>). New BOM balance is <span class=\"money\"><b><u>Ksh 47,026.00</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, NULL, 'Jan 29, 2023', '12:53 AM', '2023-01-28 21:53:03'),
(386, NULL, NULL, NULL, 40, 33, '200.00', NULL, NULL, 'R', 'willy', 'paul', '0711223344', '6.00', '0.00', 'nelson', 'lemein', '0741642093', '0.00', '0.60', 'TID-5176261574', NULL, '<span class=\"random-ids\"><u><b>TID-5176261574</b></u></span> Confirmed You have Received <span class=\"money\"><b><u>Ksh 200.00 </u></b></span> from <b>willy</b> <b>paul</b> (<span class=\"phone-number\"><u>0711223344</u></span>). On (<b>Jan 29, 2023</b> at <b>12:53 AM</b>) New BOM balance is <span class=\"money\"><b><u>Ksh 96,443.80</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, 'Jan 29, 2023', '12:53 AM', '2023-01-28 21:53:03'),
(387, NULL, NULL, NULL, 40, 33, '3000.00', NULL, 'S', NULL, 'willy', 'paul', '0711223344', '51.00', '0.00', 'nelson', 'lemein', '0741642093', '0.00', '5.10', 'TID-7185692345', '<span class=\"random-ids\"><u><b>TID-7185692345</b></u></span> Confirmed You have successfully sent <span class=\"money\"><b><u>Ksh 3,000.00 </u></b></span> to <b>nelson lemein</b> (<span class=\"phone-number\"><u>0741642093</u></span>). On (<b>Jan 29, 2023</b> at <b>12:54 AM</b>). New BOM balance is <span class=\"money\"><b><u>Ksh 43,975.00</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, NULL, 'Jan 29, 2023', '12:54 AM', '2023-01-28 21:54:26'),
(388, NULL, NULL, NULL, 40, 33, '3000.00', NULL, NULL, 'R', 'willy', 'paul', '0711223344', '51.00', '0.00', 'nelson', 'lemein', '0741642093', '0.00', '5.10', 'TID-7185692345', NULL, '<span class=\"random-ids\"><u><b>TID-7185692345</b></u></span> Confirmed You have Received <span class=\"money\"><b><u>Ksh 3,000.00 </u></b></span> from <b>willy</b> <b>paul</b> (<span class=\"phone-number\"><u>0711223344</u></span>). On (<b>Jan 29, 2023</b> at <b>12:54 AM</b>) New BOM balance is <span class=\"money\"><b><u>Ksh 99,443.80</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, 'Jan 29, 2023', '12:54 AM', '2023-01-28 21:54:26'),
(389, NULL, NULL, NULL, 40, 33, '2000.00', NULL, 'S', NULL, 'willy', 'paul', '0711223344', '32.00', '0.00', 'nelson', 'lemein', '0741642093', '0.00', '3.20', 'TID-2935756349', '<span class=\"random-ids\"><u><b>TID-2935756349</b></u></span> Confirmed You have successfully sent <span class=\"money\"><b><u>Ksh 2,000.00 </u></b></span> to <b>nelson lemein</b> (<span class=\"phone-number\"><u>0741642093</u></span>). On (<b>Jan 29, 2023</b> at <b>1:10 AM</b>). New BOM balance is <span class=\"money\"><b><u>Ksh 41,943.00</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, NULL, 'Jan 29, 2023', '1:10 AM', '2023-01-28 22:10:37'),
(390, NULL, NULL, NULL, 40, 33, '2000.00', NULL, NULL, 'R', 'willy', 'paul', '0711223344', '32.00', '0.00', 'nelson', 'lemein', '0741642093', '0.00', '3.20', 'TID-2935756349', NULL, '<span class=\"random-ids\"><u><b>TID-2935756349</b></u></span> Confirmed You have Received <span class=\"money\"><b><u>Ksh 2,000.00 </u></b></span> from <b>willy</b> <b>paul</b> (<span class=\"phone-number\"><u>0711223344</u></span>). On (<b>Jan 29, 2023</b> at <b>1:10 AM</b>) New BOM balance is <span class=\"money\"><b><u>Ksh 98,443.80</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, 'Jan 29, 2023', '1:10 AM', '2023-01-28 22:10:37'),
(391, NULL, NULL, NULL, 40, 33, '350.00', NULL, 'S', NULL, 'willy', 'paul', '0711223344', '6.00', '0.00', 'nelson', 'lemein', '0741642093', '0.00', '0.60', 'TID-9276517253', '<span class=\"random-ids\"><u><b>TID-9276517253</b></u></span> Confirmed You have successfully sent <span class=\"money\"><b><u>Ksh 350.00 </u></b></span> to <b>nelson lemein</b> (<span class=\"phone-number\"><u>0741642093</u></span>). On (<b>Jan 29, 2023</b> at <b>1:11 AM</b>). New BOM balance is <span class=\"money\"><b><u>Ksh 41,587.00</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, NULL, 'Jan 29, 2023', '1:11 AM', '2023-01-28 22:11:08'),
(392, NULL, NULL, NULL, 40, 33, '350.00', NULL, NULL, 'R', 'willy', 'paul', '0711223344', '6.00', '0.00', 'nelson', 'lemein', '0741642093', '0.00', '0.60', 'TID-9276517253', NULL, '<span class=\"random-ids\"><u><b>TID-9276517253</b></u></span> Confirmed You have Received <span class=\"money\"><b><u>Ksh 350.00 </u></b></span> from <b>willy</b> <b>paul</b> (<span class=\"phone-number\"><u>0711223344</u></span>). On (<b>Jan 29, 2023</b> at <b>1:11 AM</b>) New BOM balance is <span class=\"money\"><b><u>Ksh 98,793.80</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, 'Jan 29, 2023', '1:11 AM', '2023-01-28 22:11:08'),
(393, NULL, NULL, NULL, 40, 33, '300.00', NULL, 'S', NULL, 'willy', 'paul', '0711223344', '6.00', '0.00', 'nelson', 'lemein', '0741642093', '0.00', '0.60', 'TID-1973856981', '<span class=\"random-ids\"><u><b>TID-1973856981</b></u></span> Confirmed You have successfully sent <span class=\"money\"><b><u>Ksh 300.00 </u></b></span> to <b>nelson lemein</b> (<span class=\"phone-number\"><u>0741642093</u></span>). On (<b>Jan 29, 2023</b> at <b>1:11 AM</b>). New BOM balance is <span class=\"money\"><b><u>Ksh 41,281.00</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, NULL, 'Jan 29, 2023', '1:11 AM', '2023-01-28 22:11:31'),
(394, NULL, NULL, NULL, 40, 33, '300.00', NULL, NULL, 'R', 'willy', 'paul', '0711223344', '6.00', '0.00', 'nelson', 'lemein', '0741642093', '0.00', '0.60', 'TID-1973856981', NULL, '<span class=\"random-ids\"><u><b>TID-1973856981</b></u></span> Confirmed You have Received <span class=\"money\"><b><u>Ksh 300.00 </u></b></span> from <b>willy</b> <b>paul</b> (<span class=\"phone-number\"><u>0711223344</u></span>). On (<b>Jan 29, 2023</b> at <b>1:11 AM</b>) New BOM balance is <span class=\"money\"><b><u>Ksh 99,093.80</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, 'Jan 29, 2023', '1:11 AM', '2023-01-28 22:11:31'),
(395, NULL, NULL, NULL, 40, 33, '340.00', NULL, 'S', NULL, 'willy', 'paul', '0711223344', '6.00', '0.00', 'nelson', 'lemein', '0741642093', '0.00', '0.60', 'TID-7431247563', '<span class=\"random-ids\"><u><b>TID-7431247563</b></u></span> Confirmed You have successfully sent <span class=\"money\"><b><u>Ksh 340.00 </u></b></span> to <b>nelson lemein</b> (<span class=\"phone-number\"><u>0741642093</u></span>). On (<b>Jan 29, 2023</b> at <b>1:11 AM</b>). New BOM balance is <span class=\"money\"><b><u>Ksh 40,935.00</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, NULL, 'Jan 29, 2023', '1:11 AM', '2023-01-28 22:11:50'),
(396, NULL, NULL, NULL, 40, 33, '340.00', NULL, NULL, 'R', 'willy', 'paul', '0711223344', '6.00', '0.00', 'nelson', 'lemein', '0741642093', '0.00', '0.60', 'TID-7431247563', NULL, '<span class=\"random-ids\"><u><b>TID-7431247563</b></u></span> Confirmed You have Received <span class=\"money\"><b><u>Ksh 340.00 </u></b></span> from <b>willy</b> <b>paul</b> (<span class=\"phone-number\"><u>0711223344</u></span>). On (<b>Jan 29, 2023</b> at <b>1:11 AM</b>) New BOM balance is <span class=\"money\"><b><u>Ksh 99,433.80</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, 'Jan 29, 2023', '1:11 AM', '2023-01-28 22:11:50'),
(397, NULL, NULL, NULL, 33, 39, '390.00', NULL, 'S', NULL, 'nelson', 'lemein', '0741642093', '6.00', '0.00', 'denos', 'lenos', '0112345678', '0.00', '0.60', 'TID-5627468452', '<span class=\"random-ids\"><u><b>TID-5627468452</b></u></span> Confirmed You have successfully sent <span class=\"money\"><b><u>Ksh 390.00 </u></b></span> to <b>denos lenos</b> (<span class=\"phone-number\"><u>0112345678</u></span>). On (<b>Jan 29, 2023</b> at <b>7:41 AM</b>). New BOM balance is <span class=\"money\"><b><u>Ksh 99,037.80</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, NULL, 'Jan 29, 2023', '7:41 AM', '2023-01-29 04:41:03'),
(398, NULL, NULL, NULL, 33, 39, '390.00', NULL, NULL, 'R', 'nelson', 'lemein', '0741642093', '6.00', '0.00', 'denos', 'lenos', '0112345678', '0.00', '0.60', 'TID-5627468452', NULL, '<span class=\"random-ids\"><u><b>TID-5627468452</b></u></span> Confirmed You have Received <span class=\"money\"><b><u>Ksh 390.00 </u></b></span> from <b>nelson</b> <b>lemein</b> (<span class=\"phone-number\"><u>0741642093</u></span>). On (<b>Jan 29, 2023</b> at <b>7:41 AM</b>) New BOM balance is <span class=\"money\"><b><u>Ksh 814.00</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, 'Jan 29, 2023', '7:41 AM', '2023-01-29 04:41:03'),
(399, NULL, NULL, NULL, 33, 39, '2600.00', NULL, 'S', NULL, 'nelson', 'lemein', '0741642093', '51.00', '0.00', 'denos', 'lenos', '0112345678', '0.00', '5.10', 'TID-7416362415', '<span class=\"random-ids\"><u><b>TID-7416362415</b></u></span> Confirmed You have successfully sent <span class=\"money\"><b><u>Ksh 2,600.00 </u></b></span> to <b>denos lenos</b> (<span class=\"phone-number\"><u>0112345678</u></span>). On (<b>Jan 29, 2023</b> at <b>7:41 AM</b>). New BOM balance is <span class=\"money\"><b><u>Ksh 96,386.80</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, NULL, 'Jan 29, 2023', '7:41 AM', '2023-01-29 04:41:28'),
(400, NULL, NULL, NULL, 33, 39, '2600.00', NULL, NULL, 'R', 'nelson', 'lemein', '0741642093', '51.00', '0.00', 'denos', 'lenos', '0112345678', '0.00', '5.10', 'TID-7416362415', NULL, '<span class=\"random-ids\"><u><b>TID-7416362415</b></u></span> Confirmed You have Received <span class=\"money\"><b><u>Ksh 2,600.00 </u></b></span> from <b>nelson</b> <b>lemein</b> (<span class=\"phone-number\"><u>0741642093</u></span>). On (<b>Jan 29, 2023</b> at <b>7:41 AM</b>) New BOM balance is <span class=\"money\"><b><u>Ksh 3,414.00</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, 'Jan 29, 2023', '7:41 AM', '2023-01-29 04:41:28'),
(401, NULL, NULL, NULL, 39, 33, '1600.00', NULL, 'S', NULL, 'denos', 'lenos', '0112345678', '32.00', '0.00', 'nelson', 'lemein', '0741642093', '0.00', '3.20', 'TID-6928791756', '<span class=\"random-ids\"><u><b>TID-6928791756</b></u></span> Confirmed You have successfully sent <span class=\"money\"><b><u>Ksh 1,600.00 </u></b></span> to <b>nelson lemein</b> (<span class=\"phone-number\"><u>0741642093</u></span>). On (<b>Jan 29, 2023</b> at <b>7:43 AM</b>). New BOM balance is <span class=\"money\"><b><u>Ksh 1,782.00</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, NULL, 'Jan 29, 2023', '7:43 AM', '2023-01-29 04:43:48'),
(402, NULL, NULL, NULL, 39, 33, '1600.00', NULL, NULL, 'R', 'denos', 'lenos', '0112345678', '32.00', '0.00', 'nelson', 'lemein', '0741642093', '0.00', '3.20', 'TID-6928791756', NULL, '<span class=\"random-ids\"><u><b>TID-6928791756</b></u></span> Confirmed You have Received <span class=\"money\"><b><u>Ksh 1,600.00 </u></b></span> from <b>denos</b> <b>lenos</b> (<span class=\"phone-number\"><u>0112345678</u></span>). On (<b>Jan 29, 2023</b> at <b>7:43 AM</b>) New BOM balance is <span class=\"money\"><b><u>Ksh 97,986.80</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, 'Jan 29, 2023', '7:43 AM', '2023-01-29 04:43:48'),
(403, NULL, NULL, NULL, 39, 33, '450.00', NULL, 'S', NULL, 'denos', 'lenos', '0112345678', '6.00', '0.00', 'nelson', 'lemein', '0741642093', '0.00', '0.60', 'TID-2145375912', '<span class=\"random-ids\"><u><b>TID-2145375912</b></u></span> Confirmed You have successfully sent <span class=\"money\"><b><u>Ksh 450.00 </u></b></span> to <b>nelson lemein</b> (<span class=\"phone-number\"><u>0741642093</u></span>). On (<b>Jan 29, 2023</b> at <b>7:45 AM</b>). New BOM balance is <span class=\"money\"><b><u>Ksh 1,326.00</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, NULL, 'Jan 29, 2023', '7:45 AM', '2023-01-29 04:45:32'),
(404, NULL, NULL, NULL, 39, 33, '450.00', NULL, NULL, 'R', 'denos', 'lenos', '0112345678', '6.00', '0.00', 'nelson', 'lemein', '0741642093', '0.00', '0.60', 'TID-2145375912', NULL, '<span class=\"random-ids\"><u><b>TID-2145375912</b></u></span> Confirmed You have Received <span class=\"money\"><b><u>Ksh 450.00 </u></b></span> from <b>denos</b> <b>lenos</b> (<span class=\"phone-number\"><u>0112345678</u></span>). On (<b>Jan 29, 2023</b> at <b>7:45 AM</b>) New BOM balance is <span class=\"money\"><b><u>Ksh 98,436.80</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, 'Jan 29, 2023', '7:45 AM', '2023-01-29 04:45:32'),
(405, NULL, NULL, NULL, 39, 33, '700.00', NULL, 'S', NULL, 'denos', 'lenos', '0112345678', '12.00', '0.00', 'nelson', 'lemein', '0741642093', '0.00', '1.20', 'TID-1649589431', '<span class=\"random-ids\"><u><b>TID-1649589431</b></u></span> Confirmed You have successfully sent <span class=\"money\"><b><u>Ksh 700.00 </u></b></span> to <b>nelson lemein</b> (<span class=\"phone-number\"><u>0741642093</u></span>). On (<b>Jan 29, 2023</b> at <b>8:06 AM</b>). New BOM balance is <span class=\"money\"><b><u>Ksh 614.00</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, NULL, 'Jan 29, 2023', '8:06 AM', '2023-01-29 05:06:23'),
(406, NULL, NULL, NULL, 39, 33, '700.00', NULL, NULL, 'R', 'denos', 'lenos', '0112345678', '12.00', '0.00', 'nelson', 'lemein', '0741642093', '0.00', '1.20', 'TID-1649589431', NULL, '<span class=\"random-ids\"><u><b>TID-1649589431</b></u></span> Confirmed You have Received <span class=\"money\"><b><u>Ksh 700.00 </u></b></span> from <b>denos</b> <b>lenos</b> (<span class=\"phone-number\"><u>0112345678</u></span>). On (<b>Jan 29, 2023</b> at <b>8:06 AM</b>) New BOM balance is <span class=\"money\"><b><u>Ksh 99,136.80</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, 'Jan 29, 2023', '8:06 AM', '2023-01-29 05:06:23'),
(407, NULL, NULL, NULL, 34, 40, '250.00', NULL, NULL, 'R', 'cate', 'tracy', '1234567890', '6.00', '0.00', 'willy', 'paul', '0711223344', '0.00', '0.60', 'TID-2643872358', NULL, '<span class=\"random-ids\"><u><b>TID-2643872358</b></u></span> Confirmed You have Received <span class=\"money\"><b><u>Ksh 250.00 </u></b></span> from <b>cate</b> <b>tracy</b> (<span class=\"phone-number\"><u>1234567890</u></span>). On (<b>Jan 29, 2023</b> at <b>8:22 AM</b>) New BOM balance is <span class=\"money\"><b><u>Ksh 41,185.00</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, 'Jan 29, 2023', '8:22 AM', '2023-01-29 05:22:20'),
(408, NULL, NULL, NULL, 34, 40, '250.00', NULL, 'S', NULL, 'cate', 'tracy', '1234567890', '6.00', '0.00', 'willy', 'paul', '0711223344', '0.00', '0.60', 'TID-2643872358', '<span class=\"random-ids\"><u><b>TID-2643872358</b></u></span> Confirmed You have successfully sent <span class=\"money\"><b><u>Ksh 250.00 </u></b></span> to <b>willy paul</b> (<span class=\"phone-number\"><u>0711223344</u></span>). On (<b>Jan 29, 2023</b> at <b>8:22 AM</b>). New BOM balance is <span class=\"money\"><b><u>Ksh 10,906.80</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, NULL, 'Jan 29, 2023', '8:22 AM', '2023-01-29 05:22:20'),
(409, NULL, NULL, NULL, 34, 39, '350.00', NULL, 'S', NULL, 'cate', 'tracy', '1234567890', '6.00', '0.00', 'denos', 'lenos', '0112345678', '0.00', '0.60', 'TID-7391256197', '<span class=\"random-ids\"><u><b>TID-7391256197</b></u></span> Confirmed You have successfully sent <span class=\"money\"><b><u>Ksh 350.00 </u></b></span> to <b>denos lenos</b> (<span class=\"phone-number\"><u>0112345678</u></span>). On (<b>Jan 29, 2023</b> at <b>8:22 AM</b>). New BOM balance is <span class=\"money\"><b><u>Ksh 10,550.80</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, NULL, 'Jan 29, 2023', '8:22 AM', '2023-01-29 05:22:52'),
(410, NULL, NULL, NULL, 34, 39, '350.00', NULL, NULL, 'R', 'cate', 'tracy', '1234567890', '6.00', '0.00', 'denos', 'lenos', '0112345678', '0.00', '0.60', 'TID-7391256197', NULL, '<span class=\"random-ids\"><u><b>TID-7391256197</b></u></span> Confirmed You have Received <span class=\"money\"><b><u>Ksh 350.00 </u></b></span> from <b>cate</b> <b>tracy</b> (<span class=\"phone-number\"><u>1234567890</u></span>). On (<b>Jan 29, 2023</b> at <b>8:22 AM</b>) New BOM balance is <span class=\"money\"><b><u>Ksh 964.00</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, 'Jan 29, 2023', '8:22 AM', '2023-01-29 05:22:52'),
(411, NULL, NULL, NULL, 34, 33, '550.00', NULL, NULL, 'R', 'cate', 'tracy', '1234567890', '12.00', '0.00', 'nelson', 'lemein', '0741642093', '0.00', '1.20', 'TID-7145684192', NULL, '<span class=\"random-ids\"><u><b>TID-7145684192</b></u></span> Confirmed You have Received <span class=\"money\"><b><u>Ksh 550.00 </u></b></span> from <b>cate</b> <b>tracy</b> (<span class=\"phone-number\"><u>1234567890</u></span>). On (<b>Jan 29, 2023</b> at <b>8:23 AM</b>) New BOM balance is <span class=\"money\"><b><u>Ksh 99,686.80</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, 'Jan 29, 2023', '8:23 AM', '2023-01-29 05:23:36'),
(412, NULL, NULL, NULL, 34, 33, '550.00', NULL, 'S', NULL, 'cate', 'tracy', '1234567890', '12.00', '0.00', 'nelson', 'lemein', '0741642093', '0.00', '1.20', 'TID-7145684192', '<span class=\"random-ids\"><u><b>TID-7145684192</b></u></span> Confirmed You have successfully sent <span class=\"money\"><b><u>Ksh 550.00 </u></b></span> to <b>nelson lemein</b> (<span class=\"phone-number\"><u>0741642093</u></span>). On (<b>Jan 29, 2023</b> at <b>8:23 AM</b>). New BOM balance is <span class=\"money\"><b><u>Ksh 9,988.80</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, NULL, 'Jan 29, 2023', '8:23 AM', '2023-01-29 05:23:36'),
(413, NULL, NULL, NULL, 34, 33, '900.00', NULL, 'S', NULL, 'cate', 'tracy', '1234567890', '12.00', '0.00', 'nelson', 'lemein', '0741642093', '0.00', '1.20', 'TID-7853654932', '<span class=\"random-ids\"><u><b>TID-7853654932</b></u></span> Confirmed You have successfully sent <span class=\"money\"><b><u>Ksh 900.00 </u></b></span> to <b>nelson lemein</b> (<span class=\"phone-number\"><u>0741642093</u></span>). On (<b>Jan 29, 2023</b> at <b>8:28 AM</b>). New BOM balance is <span class=\"money\"><b><u>Ksh 9,076.80</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, NULL, 'Jan 29, 2023', '8:28 AM', '2023-01-29 05:28:37'),
(414, NULL, NULL, NULL, 34, 33, '900.00', NULL, NULL, 'R', 'cate', 'tracy', '1234567890', '12.00', '0.00', 'nelson', 'lemein', '0741642093', '0.00', '1.20', 'TID-7853654932', NULL, '<span class=\"random-ids\"><u><b>TID-7853654932</b></u></span> Confirmed You have Received <span class=\"money\"><b><u>Ksh 900.00 </u></b></span> from <b>cate</b> <b>tracy</b> (<span class=\"phone-number\"><u>1234567890</u></span>). On (<b>Jan 29, 2023</b> at <b>8:28 AM</b>) New BOM balance is <span class=\"money\"><b><u>Ksh 100,586.80</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, 'Jan 29, 2023', '8:28 AM', '2023-01-29 05:28:37'),
(415, NULL, NULL, NULL, 33, 39, '120.00', NULL, 'S', NULL, 'nelson', 'lemein', '0741642093', '6.00', '0.00', 'denos', 'lenos', '0112345678', '0.00', '0.60', 'TID-2674915729', '<span class=\"random-ids\"><u><b>TID-2674915729</b></u></span> Confirmed You have successfully sent <span class=\"money\"><b><u>Ksh 120.00 </u></b></span> to <b>denos lenos</b> (<span class=\"phone-number\"><u>0112345678</u></span>). On (<b>Jan 29, 2023</b> at <b>9:17 AM</b>). New BOM balance is <span class=\"money\"><b><u>Ksh 100,460.80</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, NULL, 'Jan 29, 2023', '9:17 AM', '2023-01-29 06:17:40'),
(416, NULL, NULL, NULL, 33, 39, '120.00', NULL, NULL, 'R', 'nelson', 'lemein', '0741642093', '6.00', '0.00', 'denos', 'lenos', '0112345678', '0.00', '0.60', 'TID-2674915729', NULL, '<span class=\"random-ids\"><u><b>TID-2674915729</b></u></span> Confirmed You have Received <span class=\"money\"><b><u>Ksh 120.00 </u></b></span> from <b>nelson</b> <b>lemein</b> (<span class=\"phone-number\"><u>0741642093</u></span>). On (<b>Jan 29, 2023</b> at <b>9:17 AM</b>) New BOM balance is <span class=\"money\"><b><u>Ksh 1,084.00</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, 'Jan 29, 2023', '9:17 AM', '2023-01-29 06:17:40'),
(417, NULL, NULL, NULL, 33, 39, '200.00', NULL, NULL, 'R', 'nelson', 'lemein', '0741642093', '6.00', '0.00', 'denos', 'lenos', '0112345678', '0.00', '0.60', 'TID-1832952467', NULL, '<span class=\"random-ids\"><u><b>TID-1832952467</b></u></span> Confirmed You have Received <span class=\"money\"><b><u>Ksh 200.00 </u></b></span> from <b>nelson</b> <b>lemein</b> (<span class=\"phone-number\"><u>0741642093</u></span>). On (<b>Jan 29, 2023</b> at <b>9:18 AM</b>) New BOM balance is <span class=\"money\"><b><u>Ksh 1,284.00</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, 'Jan 29, 2023', '9:18 AM', '2023-01-29 06:18:31'),
(418, NULL, NULL, NULL, 33, 39, '200.00', NULL, 'S', NULL, 'nelson', 'lemein', '0741642093', '6.00', '0.00', 'denos', 'lenos', '0112345678', '0.00', '0.60', 'TID-1832952467', '<span class=\"random-ids\"><u><b>TID-1832952467</b></u></span> Confirmed You have successfully sent <span class=\"money\"><b><u>Ksh 200.00 </u></b></span> to <b>denos lenos</b> (<span class=\"phone-number\"><u>0112345678</u></span>). On (<b>Jan 29, 2023</b> at <b>9:18 AM</b>). New BOM balance is <span class=\"money\"><b><u>Ksh 100,254.80</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, NULL, 'Jan 29, 2023', '9:18 AM', '2023-01-29 06:18:31'),
(419, NULL, NULL, NULL, 33, 34, '2000.00', NULL, 'S', NULL, 'nelson', 'lemein', '0741642093', '32.00', '0.00', 'cate', 'tracy', '1234567890', '0.00', '3.20', 'TID-9654167458', '<span class=\"random-ids\"><u><b>TID-9654167458</b></u></span> Confirmed You have successfully sent <span class=\"money\"><b><u>Ksh 2,000.00 </u></b></span> to <b>cate tracy</b> (<span class=\"phone-number\"><u>1234567890</u></span>). On (<b>Jan 29, 2023</b> at <b>2:56 PM</b>). New BOM balance is <span class=\"money\"><b><u>Ksh 98,222.80</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, NULL, 'Jan 29, 2023', '2:56 PM', '2023-01-29 11:56:34'),
(420, NULL, NULL, NULL, 33, 34, '2000.00', NULL, NULL, 'R', 'nelson', 'lemein', '0741642093', '32.00', '0.00', 'cate', 'tracy', '1234567890', '0.00', '3.20', 'TID-9654167458', NULL, '<span class=\"random-ids\"><u><b>TID-9654167458</b></u></span> Confirmed You have Received <span class=\"money\"><b><u>Ksh 2,000.00 </u></b></span> from <b>nelson</b> <b>lemein</b> (<span class=\"phone-number\"><u>0741642093</u></span>). On (<b>Jan 29, 2023</b> at <b>2:56 PM</b>) New BOM balance is <span class=\"money\"><b><u>Ksh 11,076.80</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, 'Jan 29, 2023', '2:56 PM', '2023-01-29 11:56:34');

-- --------------------------------------------------------

--
-- Table structure for table `argents`
--

CREATE TABLE `argents` (
  `id` int(11) NOT NULL,
  `transactions_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `users_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `banks`
--

CREATE TABLE `banks` (
  `id` int(11) NOT NULL,
  `transactions_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `id` int(11) NOT NULL,
  `transactions_id` int(11) DEFAULT NULL,
  `banks_id` int(11) DEFAULT NULL,
  `agents_id` int(11) DEFAULT NULL,
  `users_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `company_deposited_to_argent`
--

CREATE TABLE `company_deposited_to_argent` (
  `id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `argents_id` int(11) NOT NULL,
  `company_name` varchar(30) NOT NULL,
  `argent_name` varchar(30) NOT NULL,
  `company_number` int(11) NOT NULL,
  `argent_number` int(11) NOT NULL,
  `quantity_company_diposited` decimal(10,2) NOT NULL DEFAULT 0.00,
  `transaction_cost` decimal(10,2) NOT NULL,
  `quantity_argent_received` decimal(10,2) NOT NULL,
  `time_stamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `hash` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `company_income`
--

CREATE TABLE `company_income` (
  `id` int(11) NOT NULL,
  `sender_id` int(11) DEFAULT NULL,
  `transaction_cost` float(10,2) DEFAULT 0.00,
  `income` float(10,2) DEFAULT 0.00,
  `date` varchar(20) DEFAULT NULL,
  `time` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `error_messages`
--

CREATE TABLE `error_messages` (
  `id` int(11) NOT NULL,
  `sender_id` int(11) DEFAULT NULL,
  `transaction_id` varchar(20) DEFAULT NULL,
  `error_message` varchar(250) DEFAULT NULL,
  `date` varchar(20) DEFAULT NULL,
  `time` varchar(20) DEFAULT NULL,
  `date_time` varchar(35) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `in_wallet`
--

CREATE TABLE `in_wallet` (
  `id` int(11) NOT NULL,
  `recipient_id` int(11) DEFAULT NULL,
  `transaction_cost` float(10,2) DEFAULT 0.00,
  `wallet_income` float(10,2) DEFAULT 0.00,
  `date` varchar(20) DEFAULT NULL,
  `time` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `in_wallet`
--

INSERT INTO `in_wallet` (`id`, `recipient_id`, `transaction_cost`, `wallet_income`, `date`, `time`) VALUES
(1, NULL, 6.00, 0.60, 'Jul 9, 2022', '10:43 AM'),
(2, NULL, 6.00, 0.60, 'Jul 9, 2022', '11:23 AM'),
(3, NULL, 51.00, 5.10, 'Jul 9, 2022', '11:34 AM'),
(4, 34, 6.00, 0.60, 'Jul 10, 2022', '6:33 PM'),
(5, 34, 6.00, 0.60, 'Jul 10, 2022', '6:36 PM'),
(6, 34, 22.00, 2.20, 'Jul 10, 2022', '6:40 PM'),
(7, 34, 0.00, 0.00, 'Jul 10, 2022', '6:40 PM'),
(8, 34, 32.00, 3.20, 'Jul 10, 2022', '6:41 PM'),
(9, 33, 51.00, 5.10, 'Jul 10, 2022', '6:43 PM'),
(10, 34, 6.00, 0.60, 'Jul 10, 2022', '6:47 PM'),
(11, 34, 6.00, 0.60, 'Jul 10, 2022', '6:50 PM'),
(12, 34, 0.00, 0.00, 'Jul 10, 2022', '6:51 PM'),
(13, 34, 6.00, 0.60, 'Jul 10, 2022', '6:52 PM'),
(14, 34, 6.00, 0.60, 'Jul 10, 2022', '7:08 PM'),
(15, 34, 12.00, 1.20, 'Jul 10, 2022', '7:13 PM'),
(16, 34, 6.00, 0.60, 'Jul 10, 2022', '7:21 PM'),
(17, 34, 6.00, 0.60, 'Jul 10, 2022', '7:48 PM'),
(18, 34, 32.00, 3.20, 'Jul 10, 2022', '7:54 PM'),
(19, 34, 6.00, 0.60, 'Jul 10, 2022', '8:06 PM'),
(20, 34, 32.00, 3.20, 'Nov 1, 2022', '6:51 PM'),
(21, 33, 6.00, 0.60, 'Dec 12, 2022', '11:11 PM'),
(22, 33, 12.00, 1.20, 'Dec 12, 2022', '11:14 PM'),
(23, 33, 6.00, 0.60, 'Dec 31, 2022', '1:15 PM'),
(24, 33, 102.00, 10.20, 'Dec 31, 2022', '1:17 PM'),
(25, 34, 0.00, 0.00, 'Jan 1, 2023', '3:49 AM'),
(26, 34, 0.00, 0.00, 'Jan 1, 2023', '1:47 PM'),
(27, 34, 0.00, 0.00, 'Jan 1, 2023', '1:48 PM'),
(28, 33, 87.00, 8.70, 'Jan 1, 2023', '3:42 PM'),
(29, 34, 6.00, 0.60, 'Jan 1, 2023', '8:05 PM'),
(30, 33, 22.00, 2.20, 'Jan 1, 2023', '9:21 PM'),
(31, 34, 6.00, 0.60, 'Jan 4, 2023', '7:49 PM'),
(32, 34, 6.00, 0.60, 'Jan 5, 2023', '1:13 AM'),
(33, 34, 12.00, 1.20, 'Jan 9, 2023', '6:43 AM'),
(34, 34, 6.00, 0.60, 'Jan 9, 2023', '5:13 PM'),
(35, 34, 0.00, 0.00, 'Jan 9, 2023', '5:20 PM'),
(36, 34, 6.00, 0.60, 'Jan 9, 2023', '5:49 PM'),
(37, 33, 0.00, 0.00, 'Jan 9, 2023', '5:51 PM'),
(38, 34, 6.00, 0.60, 'Jan 9, 2023', '5:57 PM'),
(39, 34, 0.00, 0.00, 'Jan 9, 2023', '5:58 PM'),
(40, 34, 6.00, 0.60, 'Jan 9, 2023', '6:01 PM'),
(41, 33, 0.00, 0.00, 'Jan 9, 2023', '6:02 PM'),
(42, 33, 6.00, 0.60, 'Jan 9, 2023', '6:06 PM'),
(43, 33, 6.00, 0.60, 'Jan 9, 2023', '6:10 PM'),
(44, 34, 6.00, 0.60, 'Jan 9, 2023', '6:12 PM'),
(45, 33, 6.00, 0.60, 'Jan 9, 2023', '6:14 PM'),
(46, 34, 12.00, 1.20, 'Jan 9, 2023', '6:16 PM'),
(47, 33, 12.00, 1.20, 'Jan 9, 2023', '6:17 PM'),
(48, 33, 12.00, 1.20, 'Jan 9, 2023', '6:21 PM'),
(49, 34, 6.00, 0.60, 'Jan 18, 2023', '1:10 AM'),
(50, 34, 6.00, 0.60, 'Jan 24, 2023', '11:18 PM'),
(51, 34, 6.00, 0.60, 'Jan 24, 2023', '11:25 PM'),
(52, 33, 6.00, 0.60, 'Jan 25, 2023', '3:16 AM'),
(53, 33, 22.00, 2.20, 'Jan 25, 2023', '8:13 PM'),
(54, 34, 6.00, 0.60, 'Jan 25, 2023', '8:28 PM'),
(55, 34, 0.00, 0.00, 'Jan 25, 2023', '8:37 PM'),
(56, 34, 6.00, 0.60, 'Jan 25, 2023', '10:36 PM'),
(58, 33, 6.00, 0.60, 'Jan 25, 2023', '10:48 PM'),
(59, 40, 12.00, 1.20, 'Jan 25, 2023', '10:49 PM'),
(60, 33, 6.00, 0.60, 'Jan 25, 2023', '11:00 PM'),
(61, 39, 12.00, 1.20, 'Jan 26, 2023', '12:32 AM'),
(62, 39, 0.00, 0.00, 'Jan 26, 2023', '1:04 AM'),
(63, 33, 6.00, 0.60, 'Jan 26, 2023', '1:21 AM'),
(64, 34, 6.00, 0.60, 'Jan 26, 2023', '1:25 AM'),
(65, 33, 87.00, 8.70, 'Jan 26, 2023', '1:41 AM'),
(66, 33, 55.00, 5.50, 'Jan 26, 2023', '1:43 AM'),
(67, 33, 75.00, 7.50, 'Jan 26, 2023', '1:45 AM'),
(68, 34, 6.00, 0.60, 'Jan 27, 2023', '1:56 PM'),
(69, 34, 6.00, 0.60, 'Jan 27, 2023', '2:26 PM'),
(70, 34, 6.00, 0.60, 'Jan 27, 2023', '2:27 PM'),
(71, 34, 0.00, 0.00, 'Jan 27, 2023', '2:29 PM'),
(72, 34, 6.00, 0.60, 'Jan 28, 2023', '12:34 AM'),
(73, 33, 0.00, 0.00, 'Jan 29, 2023', '12:48 AM'),
(74, 33, 6.00, 0.60, 'Jan 29, 2023', '12:49 AM'),
(75, 33, 6.00, 0.60, 'Jan 29, 2023', '12:53 AM'),
(76, 33, 51.00, 5.10, 'Jan 29, 2023', '12:54 AM'),
(77, 33, 32.00, 3.20, 'Jan 29, 2023', '1:10 AM'),
(78, 33, 6.00, 0.60, 'Jan 29, 2023', '1:11 AM'),
(79, 33, 6.00, 0.60, 'Jan 29, 2023', '1:11 AM'),
(80, 33, 6.00, 0.60, 'Jan 29, 2023', '1:11 AM'),
(81, 39, 6.00, 0.60, 'Jan 29, 2023', '7:41 AM'),
(82, 39, 51.00, 5.10, 'Jan 29, 2023', '7:41 AM'),
(83, 33, 32.00, 3.20, 'Jan 29, 2023', '7:43 AM'),
(84, 33, 6.00, 0.60, 'Jan 29, 2023', '7:45 AM'),
(85, 33, 12.00, 1.20, 'Jan 29, 2023', '8:06 AM'),
(86, 40, 6.00, 0.60, 'Jan 29, 2023', '8:22 AM'),
(87, 39, 6.00, 0.60, 'Jan 29, 2023', '8:22 AM'),
(88, 33, 12.00, 1.20, 'Jan 29, 2023', '8:23 AM'),
(89, 33, 12.00, 1.20, 'Jan 29, 2023', '8:28 AM'),
(90, 39, 6.00, 0.60, 'Jan 29, 2023', '9:17 AM'),
(91, 39, 6.00, 0.60, 'Jan 29, 2023', '9:18 AM'),
(92, 34, 32.00, 3.20, 'Jan 29, 2023', '2:56 PM');

-- --------------------------------------------------------

--
-- Table structure for table `local_user`
--

CREATE TABLE `local_user` (
  `id` int(11) NOT NULL,
  `local_user_id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `mobile` varchar(14) NOT NULL,
  `email` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `country` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `recipient_id` int(11) DEFAULT NULL,
  `transaction_id` varchar(20) DEFAULT NULL,
  `success_message` text DEFAULT NULL,
  `recipient_success` varchar(250) DEFAULT NULL,
  `warning_message` text DEFAULT NULL,
  `error_message` text DEFAULT NULL,
  `pending_message` text DEFAULT NULL,
  `time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `success_messages`
--

CREATE TABLE `success_messages` (
  `id` int(11) NOT NULL,
  `sender_id` int(11) DEFAULT NULL,
  `recipient_id` int(11) DEFAULT NULL,
  `transaction_id` varchar(20) DEFAULT NULL,
  `sender_success_message` text DEFAULT NULL,
  `recipient_success_message` text DEFAULT NULL,
  `date` varchar(20) DEFAULT NULL,
  `time` varchar(20) DEFAULT NULL,
  `date_time` varchar(35) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `total_company_income`
--

CREATE TABLE `total_company_income` (
  `id` int(11) NOT NULL,
  `company_name` varchar(20) DEFAULT NULL,
  `total_income` float(10,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `total_wallet_income`
--

CREATE TABLE `total_wallet_income` (
  `id` int(11) NOT NULL,
  `recipient_id` int(11) DEFAULT NULL,
  `total_wallet_income` float(10,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `banks_id` int(11) DEFAULT NULL,
  `agents_id` int(11) DEFAULT NULL,
  `users_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `transactions_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `id_number` varchar(100) DEFAULT NULL,
  `mobile` varchar(14) DEFAULT NULL,
  `country` varchar(30) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `password` varchar(250) DEFAULT NULL,
  `is_local_user` varchar(10) DEFAULT NULL,
  `is_agent` varchar(10) DEFAULT NULL,
  `is_company` varchar(10) DEFAULT NULL,
  `is_bank` varchar(10) DEFAULT NULL,
  `public_id` varchar(14) DEFAULT NULL,
  `balance` decimal(13,2) NOT NULL DEFAULT 0.00,
  `show_balance` tinyint(1) NOT NULL DEFAULT 1,
  `income` decimal(13,2) NOT NULL DEFAULT 0.00,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `transactions_id`, `company_id`, `agent_id`, `first_name`, `last_name`, `id_number`, `mobile`, `country`, `email`, `password`, `is_local_user`, `is_agent`, `is_company`, `is_bank`, `public_id`, `balance`, `show_balance`, `income`, `date`) VALUES
(33, NULL, NULL, NULL, 'nelson', 'lemein', '225468566588', '0741642093', NULL, 'nelson@gmail.com', '$2a$12$1jIX4M6qHi1WFTAX0MhGfO27QHaKWrkCZuIa3ZWqCQ6nV9OyUedLO', 'yes', NULL, NULL, NULL, '926135478', '98222.80', 1, '79.90', '2021-10-13 20:41:47'),
(34, NULL, NULL, NULL, 'cate', 'tracy', '3434244212', '1234567890', NULL, 'tracy@gmail.com', '$2a$12$zGRI9ShPEu9lpzcEtpI0/uFkP.gt7TQh18KYeHYDRMyi9WgrL5u0.', 'yes', NULL, NULL, NULL, '862435917', '11076.80', 1, '36.60', '2021-10-13 20:45:50'),
(39, NULL, NULL, NULL, 'denos', 'lenos', '12345678', '0112345678', NULL, 'nn@mail.com', '$2a$12$9gqJNxwB1RKYf7XasLhvLeWhQDuoUznYO.VML5JVyelpyTj6GIv1G', 'yes', NULL, NULL, NULL, '456317829', '1284.00', 1, '8.70', '2021-10-24 14:31:33'),
(40, NULL, NULL, NULL, 'willy', 'paul', '12323236', '0711223344', NULL, 'willy@gmail.com', '$2a$12$HUtxYkF2dVOsdkd1eY62guPYvaMP6L7moPJY4sh1Fl5gvtz6NcBge', 'yes', NULL, NULL, NULL, '324589617', '41185.00', 1, '2.40', '2022-11-05 17:01:53'),
(41, NULL, NULL, NULL, 'dani', 'alaves', '12332154', '1212343454', NULL, 'dan@gmail.com', '$2a$12$XYA4EjB0kXm1lnq9lpBjkuZaF7HMELMFUETN.xSm0bEd8rcdrWEQW', 'yes', NULL, NULL, NULL, '518934627', '0.00', 1, '0.00', '2023-01-04 21:09:20'),
(42, NULL, NULL, NULL, 'Ester', 'Wamboi', '12312312', '0712343456', NULL, 'wambo@gmail.com', '$2a$12$fjJMTRCRl7Wkr9vv.PcJzO3C97xyXtzPCkRlAcMs5jv0dANrVHcl.', 'yes', NULL, NULL, NULL, '285169743', '0.00', 1, '0.00', '2023-01-28 19:48:45'),
(43, NULL, NULL, NULL, 'Peris', 'Wira', '11223344', '0798765432', NULL, 'wira@gmail.com', '$2a$12$f.1t49KsUnLT1NGQ4rHvqu7Qx/EeUM2AYjdVISC0rc0602G/LqHDm', NULL, NULL, NULL, 'yes', '472689153', '0.00', 1, '0.00', '2023-01-28 19:55:09'),
(44, NULL, NULL, NULL, 'Brian', 'Kamau', '11223342', '0798765765', NULL, 'brian@gmail.com', '$2a$12$kDMrVtckV88D0XQsdA7W3OFX6531q9EUGYAqU0psMbTBHhvJtm.Am', NULL, NULL, 'yes', NULL, '194853267', '0.00', 1, '0.00', '2023-01-28 19:57:23'),
(45, NULL, NULL, NULL, 'Anthony', 'Mwangi', '11223343', '0798765743', NULL, 'mwangi@gmail.com', '$2a$12$IDwcdOVmekJGhCWXH3TP.u3leA2BnzPl0KgpCYuXJ0Bi2qxjn5I.e', NULL, 'yes', NULL, NULL, '631952748', '0.00', 1, '0.00', '2023-01-28 19:58:35');

-- --------------------------------------------------------

--
-- Table structure for table `warning_messages`
--

CREATE TABLE `warning_messages` (
  `id` int(11) NOT NULL,
  `sender_id` int(11) DEFAULT NULL,
  `transaction_id` varchar(20) DEFAULT NULL,
  `warning_message` varchar(250) DEFAULT NULL,
  `date` varchar(20) DEFAULT NULL,
  `time` varchar(20) DEFAULT NULL,
  `date_time` varchar(35) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agents`
--
ALTER TABLE `agents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_id` (`transactions_id`),
  ADD KEY `company_id` (`company_id`),
  ADD KEY `users_id` (`users_id`) USING BTREE;

--
-- Indexes for table `all_transactions`
--
ALTER TABLE `all_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`),
  ADD KEY `bank_id` (`bank_id`),
  ADD KEY `agent_id` (`agent_id`),
  ADD KEY `sender_id` (`sender_id`),
  ADD KEY `recipient_id` (`recipient_id`);

--
-- Indexes for table `argents`
--
ALTER TABLE `argents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banks`
--
ALTER TABLE `banks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_id` (`transactions_id`),
  ADD KEY `company_id` (`company_id`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_id` (`transactions_id`),
  ADD KEY `banks_id` (`banks_id`),
  ADD KEY `agents_id` (`agents_id`),
  ADD KEY `users_id` (`users_id`);

--
-- Indexes for table `company_deposited_to_argent`
--
ALTER TABLE `company_deposited_to_argent`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `company_income`
--
ALTER TABLE `company_income`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sender_id` (`sender_id`);

--
-- Indexes for table `error_messages`
--
ALTER TABLE `error_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sender_id` (`sender_id`);

--
-- Indexes for table `in_wallet`
--
ALTER TABLE `in_wallet`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recipient_id` (`recipient_id`);

--
-- Indexes for table `local_user`
--
ALTER TABLE `local_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `recipient_id` (`recipient_id`);

--
-- Indexes for table `success_messages`
--
ALTER TABLE `success_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sender_id` (`sender_id`),
  ADD KEY `recipient_id` (`recipient_id`);

--
-- Indexes for table `total_company_income`
--
ALTER TABLE `total_company_income`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `total_wallet_income`
--
ALTER TABLE `total_wallet_income`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recipient_id` (`recipient_id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`),
  ADD KEY `banks_id` (`banks_id`),
  ADD KEY `agents_id` (`agents_id`),
  ADD KEY `users_id` (`users_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_id` (`transactions_id`),
  ADD KEY `company_id` (`company_id`),
  ADD KEY `agents_id` (`agent_id`);

--
-- Indexes for table `warning_messages`
--
ALTER TABLE `warning_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sender_id` (`sender_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `agents`
--
ALTER TABLE `agents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `all_transactions`
--
ALTER TABLE `all_transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=421;

--
-- AUTO_INCREMENT for table `argents`
--
ALTER TABLE `argents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `banks`
--
ALTER TABLE `banks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `company_deposited_to_argent`
--
ALTER TABLE `company_deposited_to_argent`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `company_income`
--
ALTER TABLE `company_income`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `error_messages`
--
ALTER TABLE `error_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `in_wallet`
--
ALTER TABLE `in_wallet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT for table `local_user`
--
ALTER TABLE `local_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `success_messages`
--
ALTER TABLE `success_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `total_company_income`
--
ALTER TABLE `total_company_income`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `total_wallet_income`
--
ALTER TABLE `total_wallet_income`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `warning_messages`
--
ALTER TABLE `warning_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `agents`
--
ALTER TABLE `agents`
  ADD CONSTRAINT `agents_ibfk_1` FOREIGN KEY (`transactions_id`) REFERENCES `transactions` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `agents_ibfk_2` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `agents_ibfk_3` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `all_transactions`
--
ALTER TABLE `all_transactions`
  ADD CONSTRAINT `all_transactions_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `all_transactions_ibfk_2` FOREIGN KEY (`bank_id`) REFERENCES `banks` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `all_transactions_ibfk_3` FOREIGN KEY (`agent_id`) REFERENCES `agents` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `all_transactions_ibfk_4` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `all_transactions_ibfk_5` FOREIGN KEY (`recipient_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `banks`
--
ALTER TABLE `banks`
  ADD CONSTRAINT `banks_ibfk_1` FOREIGN KEY (`transactions_id`) REFERENCES `transactions` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `banks_ibfk_2` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `company`
--
ALTER TABLE `company`
  ADD CONSTRAINT `company_ibfk_1` FOREIGN KEY (`transactions_id`) REFERENCES `transactions` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `company_ibfk_2` FOREIGN KEY (`banks_id`) REFERENCES `banks` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `company_ibfk_3` FOREIGN KEY (`agents_id`) REFERENCES `agents` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `company_ibfk_4` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `company_income`
--
ALTER TABLE `company_income`
  ADD CONSTRAINT `company_income_ibfk_1` FOREIGN KEY (`sender_id`) REFERENCES `all_transactions` (`sender_id`) ON DELETE SET NULL;

--
-- Constraints for table `error_messages`
--
ALTER TABLE `error_messages`
  ADD CONSTRAINT `error_messages_ibfk_1` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `in_wallet`
--
ALTER TABLE `in_wallet`
  ADD CONSTRAINT `in_wallet_ibfk_1` FOREIGN KEY (`recipient_id`) REFERENCES `all_transactions` (`recipient_id`) ON DELETE SET NULL;

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`recipient_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `success_messages`
--
ALTER TABLE `success_messages`
  ADD CONSTRAINT `success_messages_ibfk_1` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `success_messages_ibfk_2` FOREIGN KEY (`recipient_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `total_wallet_income`
--
ALTER TABLE `total_wallet_income`
  ADD CONSTRAINT `total_wallet_income_ibfk_1` FOREIGN KEY (`recipient_id`) REFERENCES `in_wallet` (`recipient_id`) ON DELETE SET NULL;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`banks_id`) REFERENCES `banks` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `transactions_ibfk_3` FOREIGN KEY (`agents_id`) REFERENCES `agents` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `transactions_ibfk_4` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`transactions_id`) REFERENCES `transactions` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `users_ibfk_2` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `users_ibfk_3` FOREIGN KEY (`agent_id`) REFERENCES `agents` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `warning_messages`
--
ALTER TABLE `warning_messages`
  ADD CONSTRAINT `warning_messages_ibfk_1` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
