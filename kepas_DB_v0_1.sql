-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 02, 2023 at 12:47 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kepas_DB_v0.1`
--

-- --------------------------------------------------------

--
-- Table structure for table `50793553d5229621cbf9e241c529125c1b7c3723bff47eea888062007add5aa7`
--

CREATE TABLE `50793553d5229621cbf9e241c529125c1b7c3723bff47eea888062007add5aa7` (
  `id` int(11) NOT NULL,
  `transactions_id` int(11) DEFAULT NULL,
  `banks_id` int(11) DEFAULT NULL,
  `agents_id` int(11) DEFAULT NULL,
  `users_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `agents`
--

CREATE TABLE `agents` (
  `id` int(11) NOT NULL,
  `agent_number` mediumint(255) DEFAULT NULL,
  `agent_name` varchar(40) DEFAULT NULL,
  `agent_owner_full_names` varchar(100) DEFAULT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `agent_phone` varchar(14) DEFAULT NULL,
  `agent_email` varchar(250) DEFAULT NULL,
  `agent_password` varchar(250) DEFAULT NULL,
  `agent_total_bal` decimal(13,2) DEFAULT 0.00,
  `agent_total_income` decimal(13,2) DEFAULT 0.00,
  `is_local_user` varchar(10) DEFAULT NULL,
  `is_agent` varchar(10) DEFAULT NULL,
  `is_company` varchar(10) DEFAULT NULL,
  `is_bank` varchar(10) DEFAULT NULL,
  `time` datetime NOT NULL DEFAULT current_timestamp(),
  `transactions_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `users_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `agents`
--

INSERT INTO `agents` (`id`, `agent_number`, `agent_name`, `agent_owner_full_names`, `agent_id`, `agent_phone`, `agent_email`, `agent_password`, `agent_total_bal`, `agent_total_income`, `is_local_user`, `is_agent`, `is_company`, `is_bank`, `time`, `transactions_id`, `company_id`, `users_id`) VALUES
(21, 2718549, 'nelson-lemein-Giraffe-2718', 'nelson lemein', 33436166, '0113913631', 'me@gmail.com', '$2a$12$lk2KdfbbpfbNog8EHGQr5OE3ZNpN568KBEJUH/E3uByEgvesxCTL6', 30200.00, 11.10, NULL, NULL, NULL, NULL, '2023-05-31 20:54:08', NULL, NULL, NULL);

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
  `agent_name` varchar(100) DEFAULT NULL,
  `agent_number` bigint(100) DEFAULT NULL,
  `agent_mobile` varchar(100) DEFAULT NULL,
  `agent_income` decimal(13,2) NOT NULL DEFAULT 0.00,
  `agent_success_message` longtext DEFAULT NULL,
  `current_date` varchar(30) DEFAULT NULL,
  `current_time` varchar(30) DEFAULT NULL,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `all_transactions`
--

INSERT INTO `all_transactions` (`id`, `company_id`, `bank_id`, `agent_id`, `sender_id`, `recipient_id`, `amount`, `mode`, `sender_mode`, `recipient_mode`, `sender_first_name`, `sender_last_name`, `sender_mobile`, `sender_transaction_cost`, `sender_income`, `recipient_first_name`, `recipient_last_name`, `recipient_mobile`, `recipient_transaction_cost`, `recipient_income`, `transaction_id`, `sender_success_message`, `recipient_success_message`, `pending_message`, `warning_message`, `error_message`, `agent_name`, `agent_number`, `agent_mobile`, `agent_income`, `agent_success_message`, `current_date`, `current_time`, `date_time`) VALUES
(475, NULL, NULL, 19, 33, NULL, 130.00, 'S', NULL, NULL, 'nelson', 'lemein', '0741642093', 6.00, 0.00, NULL, NULL, NULL, 0.00, 0.00, 'TID-8934669328', '<span class=\"random-ids\"><u><b>TID-8934669328</b></u></span> Confirmed You have successfully withdraw <span class=\"money\"><b><u>Ksh 130.00 </u></b></span> from <b>nelson-lemein-tiger4238</b> (<span class=\"phone-number\"><u>4238619</u></span>). On (<b>May 24, 2023</b> at <b>10:58 PM</b>). New BOM balance is <span class=\"money\"><b><u>Ksh 994,580.00</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, NULL, 'nelson-lemein-tiger4238', 4238619, '07123456789', 0.00, NULL, 'May 24, 2023', '10:58 PM', '2023-05-24 19:58:51'),
(476, NULL, NULL, 19, 33, NULL, 130.00, 'R', NULL, NULL, 'nelson', 'lemein', '0741642093', 6.00, 0.00, NULL, NULL, NULL, 0.00, 0.00, 'TID-8934669328', NULL, NULL, NULL, NULL, NULL, 'nelson-lemein-tiger4238', 4238619, '07123456789', 0.60, '<span class=\"random-ids\"><u><b>TID-8934669328</b></u></span> Confirmed You Received <span class=\"money\"><b><u>Ksh 130.00 </u></b></span> from <b>nelson</b> <b>lemein</b> (<span class=\"phone-number\"><u>0741642093</u></span>). On (<b>May 24, 2023</b> at <b>10:58 PM</b>) New agent balance is <span class=\"money\"><b><u>Ksh 4,890.00</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', 'May 24, 2023', '10:58 PM', '2023-05-24 19:58:51'),
(477, NULL, NULL, NULL, 33, 34, 150.00, NULL, NULL, 'R', 'nelson', 'lemein', '0741642093', 6.00, 0.00, 'cate', 'tracy', '1234567890', 0.00, 0.60, 'TID-3674963458', NULL, '<span class=\"random-ids\"><u><b>TID-3674963458</b></u></span> Confirmed You have Received <span class=\"money\"><b><u>Ksh 150.00 </u></b></span> from <b>nelson</b> <b>lemein</b> (<span class=\"phone-number\"><u>0741642093</u></span>). On (<b>May 24, 2023</b> at <b>11:11 PM</b>) New BOM balance is <span class=\"money\"><b><u>Ksh 11,181.80</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, 'May 24, 2023', '11:11 PM', '2023-05-24 20:11:36'),
(478, NULL, NULL, NULL, 33, 34, 150.00, NULL, 'S', NULL, 'nelson', 'lemein', '0741642093', 6.00, 0.00, 'cate', 'tracy', '1234567890', 0.00, 0.60, 'TID-3674963458', '<span class=\"random-ids\"><u><b>TID-3674963458</b></u></span> Confirmed You have successfully sent <span class=\"money\"><b><u>Ksh 150.00 </u></b></span> to <b>cate tracy</b> (<span class=\"phone-number\"><u>1234567890</u></span>). On (<b>May 24, 2023</b> at <b>11:11 PM</b>). New BOM balance is <span class=\"money\"><b><u>Ksh 994,424.00</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, 'May 24, 2023', '11:11 PM', '2023-05-24 20:11:36'),
(479, NULL, NULL, NULL, 33, NULL, 0.00, 'E', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, NULL, NULL, NULL, 0.00, 0.00, 'TID-8492779265', NULL, NULL, NULL, NULL, '<span class=\"random-ids\"><u><b>TID-8492779265</b></u></span> Failed. You can not send money to your own number! Your number is <span class=\"phone-number\"><u>0741642093</u></span> And recipient number is <span class=\"phone-number\"><u>0741642093</u></span>. Please Check the number And Try Again', NULL, NULL, NULL, 0.00, NULL, 'May 24, 2023', '11:13 PM', '2023-05-24 20:13:52'),
(480, NULL, NULL, NULL, 33, NULL, 0.00, 'W', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, NULL, NULL, NULL, 0.00, 0.00, 'TID-7458395824', NULL, NULL, NULL, '<span class=\"random-ids\"><u><b>TID-7458395824</b></u></span> Failed. You can not send funds less than <span class=\"money\"><b><u>Ksh 5.00</u></b></span> Current balance is <span class=\"money\"><b><u> Ksh 994,424.00</u></b></span> Please top up and try again.', NULL, NULL, NULL, NULL, 0.00, NULL, 'May 24, 2023', '11:14 PM', '2023-05-24 20:14:47'),
(481, NULL, NULL, NULL, 33, NULL, 0.00, 'W', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, NULL, NULL, NULL, 0.00, 0.00, 'TID-3794124813', NULL, NULL, NULL, '<span class=\"random-ids\"><u><b>TID-3794124813</b></u></span> Failed. You do not have sufficient funds to send <span class=\"money\"><b><u>Ksh 2,000,000,000.00</u></b></span> Your balance is <span class=\"money\"><b><u>Ksh 994,424.00</u></b></span> You should pay a transaction fee of <span class=\"money\"><b><u>Ksh 1,665.00</u></b></span> Please top up <span class=\"money\"><b><u>Ksh 1,999,007,241.00</u></b></span> and Try Again', NULL, NULL, NULL, NULL, 0.00, NULL, 'May 24, 2023', '11:15 PM', '2023-05-24 20:15:55'),
(482, NULL, NULL, NULL, 33, 39, 120.00, NULL, 'S', NULL, 'nelson', 'lemein', '0741642093', 6.00, 0.00, 'denos', 'lenos', '0112345678', 0.00, 0.60, 'TID-9381621739', '<span class=\"random-ids\"><u><b>TID-9381621739</b></u></span> Confirmed You have successfully sent <span class=\"money\"><b><u>Ksh 120.00 </u></b></span> to <b>denos lenos</b> (<span class=\"phone-number\"><u>0112345678</u></span>). On (<b>May 24, 2023</b> at <b>11:17 PM</b>). New BOM balance is <span class=\"money\"><b><u>Ksh 994,298.00</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, 'May 24, 2023', '11:17 PM', '2023-05-24 20:17:19'),
(483, NULL, NULL, NULL, 33, 39, 120.00, NULL, NULL, 'R', 'nelson', 'lemein', '0741642093', 6.00, 0.00, 'denos', 'lenos', '0112345678', 0.00, 0.60, 'TID-9381621739', NULL, '<span class=\"random-ids\"><u><b>TID-9381621739</b></u></span> Confirmed You have Received <span class=\"money\"><b><u>Ksh 120.00 </u></b></span> from <b>nelson</b> <b>lemein</b> (<span class=\"phone-number\"><u>0741642093</u></span>). On (<b>May 24, 2023</b> at <b>11:17 PM</b>) New BOM balance is <span class=\"money\"><b><u>Ksh 1,413.00</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, 'May 24, 2023', '11:17 PM', '2023-05-24 20:17:19'),
(484, NULL, NULL, NULL, 48, NULL, 0.00, 'W', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, NULL, NULL, NULL, 0.00, 0.00, 'TID-2831771682', NULL, NULL, NULL, '<span class=\"random-ids\"><u><b>TID-2831771682</b></u></span> Failed. You do not have sufficient funds to send <span class=\"money\"><b><u>Ksh 20.00</u></b></span> Your balance is <span class=\"money\"><b><u>Ksh 0.00</u></b></span> You should pay a transaction fee of <span class=\"money\"><b><u>Ksh 0.00</u></b></span> Please top up <span class=\"money\"><b><u>Ksh 20.00</u></b></span> and Try Again', NULL, NULL, NULL, NULL, 0.00, NULL, 'May 26, 2023', '11:39 PM', '2023-05-26 20:39:28'),
(485, NULL, NULL, NULL, 48, NULL, 0.00, 'W', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, NULL, NULL, NULL, 0.00, 0.00, 'TID-1587931756', NULL, NULL, NULL, '<span class=\"random-ids\"><u><b>TID-1587931756</b></u></span> Failed. You can not withdraw funds less than <span class=\"money\"><b><u>Ksh 50.00</u></b></span> Current balance is <span class=\"money\"><b><u> Ksh 0.00</u></b></span> Please try again.', NULL, NULL, NULL, NULL, 0.00, NULL, 'May 26, 2023', '11:41 PM', '2023-05-26 20:41:12'),
(486, NULL, NULL, NULL, 48, NULL, 0.00, 'W', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, NULL, NULL, NULL, 0.00, 0.00, 'TID-7863251642', NULL, NULL, NULL, '<span class=\"random-ids\"><u><b>TID-7863251642</b></u></span> Failed. You do not have sufficient funds to withdraw <span class=\"money\"><b><u>Ksh 200.00</u></b></span> Your balance is <span class=\"money\"><b><u>Ksh 0.00</u></b></span> You should pay a transaction fee of <span class=\"money\"><b><u>Ksh 6.00</u></b></span> Please top up <span class=\"money\"><b><u>Ksh 206.00</u></b></span> and Try Again', NULL, NULL, NULL, NULL, 0.00, NULL, 'May 26, 2023', '11:42 PM', '2023-05-26 20:42:36'),
(487, NULL, NULL, 19, 33, NULL, 250.00, 'S', NULL, NULL, 'nelson', 'lemein', '0741642093', 6.00, 0.00, NULL, NULL, NULL, 0.00, 0.00, 'TID-8135797583', '<span class=\"random-ids\"><u><b>TID-8135797583</b></u></span> Confirmed You have successfully withdraw <span class=\"money\"><b><u>Ksh 250.00 </u></b></span> from <b>nelson-lemein-tiger4238</b> (<span class=\"phone-number\"><u>4238619</u></span>). On (<b>May 27, 2023</b> at <b>1:29 AM</b>). New BOM balance is <span class=\"money\"><b><u>Ksh 994,042.00</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', NULL, NULL, NULL, NULL, 'nelson-lemein-tiger4238', 4238619, '07123456789', 0.00, NULL, 'May 27, 2023', '1:29 AM', '2023-05-26 22:29:38'),
(488, NULL, NULL, 19, 33, NULL, 250.00, 'R', NULL, NULL, 'nelson', 'lemein', '0741642093', 6.00, 0.00, NULL, NULL, NULL, 0.00, 0.00, 'TID-8135797583', NULL, NULL, NULL, NULL, NULL, 'nelson-lemein-tiger4238', 4238619, '07123456789', 0.60, '<span class=\"random-ids\"><u><b>TID-8135797583</b></u></span> Confirmed You Received <span class=\"money\"><b><u>Ksh 250.00 </u></b></span> from <b>nelson</b> <b>lemein</b> (<span class=\"phone-number\"><u>0741642093</u></span>). On (<b>May 27, 2023</b> at <b>1:29 AM</b>) New agent balance is <span class=\"money\"><b><u>Ksh 5,140.00</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.', 'May 27, 2023', '1:29 AM', '2023-05-26 22:29:38'),
(489, NULL, NULL, NULL, 33, NULL, 0.00, 'E', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, NULL, NULL, NULL, 0.00, 0.00, 'TID-6349571349', NULL, NULL, NULL, NULL, '<span class=\"random-ids\"><u><b>TID-6349571349</b></u></span> Failed. Please check agent number <span class=\"phone-number\"><u><b>122222</b></u></span> does not exist!', NULL, NULL, NULL, 0.00, NULL, 'May 27, 2023', '3:04 PM', '2023-05-27 12:04:38'),
(490, NULL, NULL, NULL, 33, NULL, 0.00, 'W', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, NULL, NULL, NULL, 0.00, 0.00, 'TID-3854189357', NULL, NULL, NULL, '<span class=\"random-ids\"><u><b>TID-3854189357</b></u></span> Failed. You can not withdraw funds less than <span class=\"money\"><b><u>Ksh 50.00</u></b></span> Current balance is <span class=\"money\"><b><u> Ksh 994,042.00</u></b></span> Please try again.', NULL, NULL, NULL, NULL, 0.00, NULL, 'May 27, 2023', '3:05 PM', '2023-05-27 12:05:25'),
(491, NULL, NULL, NULL, 33, NULL, 0.00, 'W', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, NULL, NULL, NULL, 0.00, 0.00, 'TID-3169813679', NULL, NULL, NULL, '<span class=\"random-ids\"><u><b>TID-3169813679</b></u></span> Warning! You entered a wrong password', NULL, NULL, NULL, NULL, 0.00, NULL, 'May 27, 2023', '3:06 PM', '2023-05-27 12:06:35'),
(492, NULL, NULL, 19, 33, NULL, 49.99, 'S', NULL, NULL, 'nelson', 'lemein', '0741642093', 10.00, 0.00, NULL, NULL, NULL, 0.00, 0.00, 'TID-1592623517', '<span class=\"random-ids\"><u><b>TID-1592623517</b></u></span> Confirmed You have successfully withdraw <span class=\"money\"><b><u>Ksh 49.99 </u></b></span> from <b>nelson-lemein-tiger4238</b> (<span class=\"phone-number\"><u>4238619</u></span>). On (<b>May 27, 2023</b> at <b>3:07 PM</b>). New KEPAS balance is <span class=\"money\"><b><u>Ksh 993,982.01</u></b></span>. Thank you for choosing our platform. KEPAS, YOUR MONEY FREEDOM.', NULL, NULL, NULL, NULL, 'nelson-lemein-tiger4238', 4238619, '07123456789', 0.00, NULL, 'May 27, 2023', '3:07 PM', '2023-05-27 12:07:29'),
(493, NULL, NULL, 19, 33, NULL, 49.99, 'R', NULL, NULL, 'nelson', 'lemein', '0741642093', 10.00, 0.00, NULL, NULL, NULL, 0.00, 0.00, 'TID-1592623517', NULL, NULL, NULL, NULL, NULL, 'nelson-lemein-tiger4238', 4238619, '07123456789', 1.00, '<span class=\"random-ids\"><u><b>TID-1592623517</b></u></span> Confirmed You Received <span class=\"money\"><b><u>Ksh 49.99 </u></b></span> from <b>nelson</b> <b>lemein</b> (<span class=\"phone-number\"><u>0741642093</u></span>). On (<b>May 27, 2023</b> at <b>3:07 PM</b>) New agent balance is <span class=\"money\"><b><u>Ksh 5,189.99</u></b></span>. Thank you for choosing our platform. KEPAS, YOUR MONEY FREEDOM.', 'May 27, 2023', '3:07 PM', '2023-05-27 12:07:29'),
(494, NULL, NULL, 19, 33, NULL, 49.40, 'S', NULL, NULL, 'nelson', 'lemein', '0741642093', 10.00, 0.00, NULL, NULL, NULL, 0.00, 0.00, 'TID-7938479842', '<span class=\"random-ids\"><u><b>TID-7938479842</b></u></span> Confirmed You have successfully withdraw <span class=\"money\"><b><u>Ksh 49.40 </u></b></span> from <b>nelson-lemein-tiger4238</b> (<span class=\"phone-number\"><u>4238619</u></span>). On (<b>May 27, 2023</b> at <b>3:08 PM</b>). New KEPAS balance is <span class=\"money\"><b><u>Ksh 993,922.61</u></b></span>. Thank you for choosing our platform. KEPAS, YOUR MONEY FREEDOM.', NULL, NULL, NULL, NULL, 'nelson-lemein-tiger4238', 4238619, '07123456789', 0.00, NULL, 'May 27, 2023', '3:08 PM', '2023-05-27 12:08:39'),
(495, NULL, NULL, 19, 33, NULL, 49.40, 'R', NULL, NULL, 'nelson', 'lemein', '0741642093', 10.00, 0.00, NULL, NULL, NULL, 0.00, 0.00, 'TID-7938479842', NULL, NULL, NULL, NULL, NULL, 'nelson-lemein-tiger4238', 4238619, '07123456789', 1.00, '<span class=\"random-ids\"><u><b>TID-7938479842</b></u></span> Confirmed You Received <span class=\"money\"><b><u>Ksh 49.40 </u></b></span> from <b>nelson</b> <b>lemein</b> (<span class=\"phone-number\"><u>0741642093</u></span>). On (<b>May 27, 2023</b> at <b>3:08 PM</b>) New agent balance is <span class=\"money\"><b><u>Ksh 5,239.39</u></b></span>. Thank you for choosing our platform. KEPAS, YOUR MONEY FREEDOM.', 'May 27, 2023', '3:08 PM', '2023-05-27 12:08:39'),
(496, NULL, NULL, NULL, 33, NULL, 0.00, 'W', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, NULL, NULL, NULL, 0.00, 0.00, 'TID-4183913578', NULL, NULL, NULL, '<span class=\"random-ids\"><u><b>TID-4183913578</b></u></span> Failed. You can not withdraw funds less than <span class=\"money\"><b><u>Ksh 50.00</u></b></span> Current balance is <span class=\"money\"><b><u> Ksh 993,922.61</u></b></span> Please try again.', NULL, NULL, NULL, NULL, 0.00, NULL, 'May 27, 2023', '3:25 PM', '2023-05-27 12:25:54'),
(497, NULL, NULL, NULL, 33, NULL, 0.00, 'W', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, NULL, NULL, NULL, 0.00, 0.00, 'TID-6327118265', NULL, NULL, NULL, '<span class=\"random-ids\"><u><b>TID-6327118265</b></u></span> Failed. You can not withdraw funds less than <span class=\"money\"><b><u>Ksh 50.00</u></b></span> Current balance is <span class=\"money\"><b><u> Ksh 993,922.61</u></b></span> Please try again.', NULL, NULL, NULL, NULL, 0.00, NULL, 'May 27, 2023', '3:26 PM', '2023-05-27 12:26:22'),
(498, NULL, NULL, 19, 33, NULL, 49.10, 'S', NULL, NULL, 'nelson', 'lemein', '0741642093', 10.00, 0.00, NULL, NULL, NULL, 0.00, 0.00, 'TID-3759463857', '<span class=\"random-ids\"><u><b>TID-3759463857</b></u></span> Confirmed You have successfully withdraw <span class=\"money\"><b><u>Ksh 49.10 </u></b></span> from <b>nelson-lemein-tiger4238</b> (<span class=\"phone-number\"><u>4238619</u></span>). On (<b>May 27, 2023</b> at <b>3:26 PM</b>). New KEPAS balance is <span class=\"money\"><b><u>Ksh 993,863.51</u></b></span>. Thank you for choosing our platform. KEPAS, YOUR MONEY FREEDOM.', NULL, NULL, NULL, NULL, 'nelson-lemein-tiger4238', 4238619, '07123456789', 0.00, NULL, 'May 27, 2023', '3:26 PM', '2023-05-27 12:26:43'),
(499, NULL, NULL, 19, 33, NULL, 49.10, 'R', NULL, NULL, 'nelson', 'lemein', '0741642093', 10.00, 0.00, NULL, NULL, NULL, 0.00, 0.00, 'TID-3759463857', NULL, NULL, NULL, NULL, NULL, 'nelson-lemein-tiger4238', 4238619, '07123456789', 1.00, '<span class=\"random-ids\"><u><b>TID-3759463857</b></u></span> Confirmed You Received <span class=\"money\"><b><u>Ksh 49.10 </u></b></span> from <b>nelson</b> <b>lemein</b> (<span class=\"phone-number\"><u>0741642093</u></span>). On (<b>May 27, 2023</b> at <b>3:26 PM</b>) New agent balance is <span class=\"money\"><b><u>Ksh 5,288.49</u></b></span>. Thank you for choosing our platform. KEPAS, YOUR MONEY FREEDOM.', 'May 27, 2023', '3:26 PM', '2023-05-27 12:26:43'),
(500, NULL, NULL, NULL, 33, NULL, 0.00, 'W', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, NULL, NULL, NULL, 0.00, 0.00, 'TID-2791562814', NULL, NULL, NULL, '<span class=\"random-ids\"><u><b>TID-2791562814</b></u></span> Failed. You can not withdraw funds less than <span class=\"money\"><b><u>Ksh 50.00</u></b></span> Current balance is <span class=\"money\"><b><u> Ksh 993,863.51</u></b></span> Please try again.', NULL, NULL, NULL, NULL, 0.00, NULL, 'May 27, 2023', '3:30 PM', '2023-05-27 12:30:12'),
(501, NULL, NULL, 19, 33, NULL, 50.00, 'S', NULL, NULL, 'nelson', 'lemein', '0741642093', 10.00, 0.00, NULL, NULL, NULL, 0.00, 0.00, 'TID-6183921693', '<span class=\"random-ids\"><u><b>TID-6183921693</b></u></span> Confirmed You have successfully withdraw <span class=\"money\"><b><u>Ksh 50.00 </u></b></span> from <b>nelson-lemein-tiger4238</b> (<span class=\"phone-number\"><u>4238619</u></span>). On (<b>May 27, 2023</b> at <b>3:31 PM</b>). New KEPAS balance is <span class=\"money\"><b><u>Ksh 993,803.51</u></b></span>. Thank you for choosing our platform. KEPAS, YOUR MONEY FREEDOM.', NULL, NULL, NULL, NULL, 'nelson-lemein-tiger4238', 4238619, '07123456789', 0.00, NULL, 'May 27, 2023', '3:31 PM', '2023-05-27 12:31:07'),
(502, NULL, NULL, 19, 33, NULL, 50.00, 'R', NULL, NULL, 'nelson', 'lemein', '0741642093', 10.00, 0.00, NULL, NULL, NULL, 0.00, 0.00, 'TID-6183921693', NULL, NULL, NULL, NULL, NULL, 'nelson-lemein-tiger4238', 4238619, '07123456789', 1.00, '<span class=\"random-ids\"><u><b>TID-6183921693</b></u></span> Confirmed You Received <span class=\"money\"><b><u>Ksh 50.00 </u></b></span> from <b>nelson</b> <b>lemein</b> (<span class=\"phone-number\"><u>0741642093</u></span>). On (<b>May 27, 2023</b> at <b>3:31 PM</b>) New agent balance is <span class=\"money\"><b><u>Ksh 5,338.49</u></b></span>. Thank you for choosing our platform. KEPAS, YOUR MONEY FREEDOM.', 'May 27, 2023', '3:31 PM', '2023-05-27 12:31:07'),
(503, NULL, NULL, NULL, 33, NULL, 0.00, 'E', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, NULL, NULL, NULL, 0.00, 0.00, 'TID-4823156324', NULL, NULL, NULL, NULL, '<span class=\"random-ids\"><u><b>TID-4823156324</b></u></span> Failed. There Is No user with the number <span class=\"phone-number\"><u><b>074164209355</b></u></span> Please check the number and try again', NULL, NULL, NULL, 0.00, NULL, 'May 29, 2023', '2:36 PM', '2023-05-29 11:36:05'),
(504, NULL, NULL, NULL, 33, NULL, 0.00, 'E', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, NULL, NULL, NULL, 0.00, 0.00, 'TID-8317514569', NULL, NULL, NULL, NULL, '<span class=\"random-ids\"><u><b>TID-8317514569</b></u></span> Failed. Please check agent number <span class=\"phone-number\"><u><b>1234</b></u></span> does not exist!', NULL, NULL, NULL, 0.00, NULL, 'May 29, 2023', '10:53 PM', '2023-05-29 19:53:19'),
(505, NULL, NULL, NULL, 33, NULL, 0.00, 'E', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, NULL, NULL, NULL, 0.00, 0.00, 'TID-5437895631', NULL, NULL, NULL, NULL, '<span class=\"random-ids\"><u><b>TID-5437895631</b></u></span> Failed. Please check agent number <span class=\"phone-number\"><u><b>1234</b></u></span> does not exist!', NULL, NULL, NULL, 0.00, NULL, 'May 30, 2023', '12:19 AM', '2023-05-29 21:19:41'),
(506, NULL, NULL, NULL, 33, NULL, 0.00, 'E', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, NULL, NULL, NULL, 0.00, 0.00, 'TID-4891646958', NULL, NULL, NULL, NULL, '<span class=\"random-ids\"><u><b>TID-4891646958</b></u></span> Failed. Please check agent number <span class=\"phone-number\"><u><b>1</b></u></span> does not exist!', NULL, NULL, NULL, 0.00, NULL, 'May 30, 2023', '12:24 AM', '2023-05-29 21:24:54'),
(507, NULL, NULL, NULL, 33, NULL, 0.00, 'E', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, NULL, NULL, NULL, 0.00, 0.00, 'TID-4916896732', NULL, NULL, NULL, NULL, '<span class=\"random-ids\"><u><b>TID-4916896732</b></u></span> Failed. Please check agent number <span class=\"phone-number\"><u><b>1</b></u></span> does not exist!', NULL, NULL, NULL, 0.00, NULL, 'May 30, 2023', '12:50 AM', '2023-05-29 21:50:24'),
(508, NULL, NULL, NULL, 33, NULL, 0.00, 'W', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, NULL, NULL, NULL, 0.00, 0.00, 'TID-1738523465', NULL, NULL, NULL, '<span class=\"random-ids\"><u><b>TID-1738523465</b></u></span> Failed. You can not withdraw funds less than <span class=\"money\"><b><u>Ksh 50.00</u></b></span> Current balance is <span class=\"money\"><b><u> Ksh 993,803.51</u></b></span> Please try again.', NULL, NULL, NULL, NULL, 0.00, NULL, 'May 30, 2023', '1:04 AM', '2023-05-29 22:04:36'),
(509, NULL, NULL, 19, 33, NULL, 200.00, 'S', NULL, NULL, 'nelson', 'lemein', '0741642093', 6.00, 0.00, NULL, NULL, NULL, 0.00, 0.00, 'TID-4819648791', '<span class=\"random-ids\"><u><b>TID-4819648791</b></u></span> Confirmed You have successfully withdraw <span class=\"money\"><b><u>Ksh 200.00 </u></b></span> from <b>nelson-lemein-tiger4238</b> (<span class=\"phone-number\"><u>4238619</u></span>). On (<b>May 30, 2023</b> at <b>1:05 AM</b>). New KEPAS balance is <span class=\"money\"><b><u>Ksh 993,597.51</u></b></span>. Thank you for choosing our platform. KEPAS, YOUR MONEY FREEDOM.', NULL, NULL, NULL, NULL, 'nelson-lemein-tiger4238', 4238619, '07123456789', 0.00, NULL, 'May 30, 2023', '1:05 AM', '2023-05-29 22:05:21'),
(510, NULL, NULL, 19, 33, NULL, 200.00, 'R', NULL, NULL, 'nelson', 'lemein', '0741642093', 6.00, 0.00, NULL, NULL, NULL, 0.00, 0.00, 'TID-4819648791', NULL, NULL, NULL, NULL, NULL, 'nelson-lemein-tiger4238', 4238619, '07123456789', 0.60, '<span class=\"random-ids\"><u><b>TID-4819648791</b></u></span> Confirmed You Received <span class=\"money\"><b><u>Ksh 200.00 </u></b></span> from <b>nelson</b> <b>lemein</b> (<span class=\"phone-number\"><u>0741642093</u></span>). On (<b>May 30, 2023</b> at <b>1:05 AM</b>) New agent balance is <span class=\"money\"><b><u>Ksh 5,538.49</u></b></span>. Thank you for choosing our platform. KEPAS, YOUR MONEY FREEDOM.', 'May 30, 2023', '1:05 AM', '2023-05-29 22:05:21'),
(511, NULL, NULL, NULL, 33, NULL, 0.00, 'E', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, NULL, NULL, NULL, 0.00, 0.00, 'TID-1692873142', NULL, NULL, NULL, NULL, '<span class=\"random-ids\"><u><b>TID-1692873142</b></u></span> Failed. Please check agent number <span class=\"phone-number\"><u><b>423861</b></u></span> does not exist!', NULL, NULL, NULL, 0.00, NULL, 'May 30, 2023', '2:09 PM', '2023-05-30 11:09:54'),
(512, NULL, NULL, NULL, 33, NULL, 0.00, 'W', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, NULL, NULL, NULL, 0.00, 0.00, 'TID-1643562318', NULL, NULL, NULL, '<span class=\"random-ids\"><u><b>TID-1643562318</b></u></span> Warning! You entered a wrong password', NULL, NULL, NULL, NULL, 0.00, NULL, 'May 30, 2023', '2:50 PM', '2023-05-30 11:50:44'),
(513, NULL, NULL, 19, 33, NULL, 1200.00, 'S', NULL, NULL, 'nelson', 'lemein', '0741642093', 22.00, 0.00, NULL, NULL, NULL, 0.00, 0.00, 'TID-5618443215', '<span class=\"random-ids\"><u><b>TID-5618443215</b></u></span> Confirmed You have successfully withdraw <span class=\"money\"><b><u>Ksh 1,200.00 </u></b></span> from <b>nelson-lemein-tiger4238</b> (<span class=\"phone-number\"><u>4238619</u></span>). On (<b>May 30, 2023</b> at <b>2:51 PM</b>). New KEPAS balance is <span class=\"money\"><b><u>Ksh 992,375.51</u></b></span>. Thank you for choosing our platform. KEPAS, YOUR MONEY FREEDOM.', NULL, NULL, NULL, NULL, 'nelson-lemein-tiger4238', 4238619, '07123456789', 0.00, NULL, 'May 30, 2023', '2:51 PM', '2023-05-30 11:51:37'),
(514, NULL, NULL, 19, 33, NULL, 1200.00, 'R', NULL, NULL, 'nelson', 'lemein', '0741642093', 22.00, 0.00, NULL, NULL, NULL, 0.00, 0.00, 'TID-5618443215', NULL, NULL, NULL, NULL, NULL, 'nelson-lemein-tiger4238', 4238619, '07123456789', 2.20, '<span class=\"random-ids\"><u><b>TID-5618443215</b></u></span> Confirmed You Received <span class=\"money\"><b><u>Ksh 1,200.00 </u></b></span> from <b>nelson</b> <b>lemein</b> (<span class=\"phone-number\"><u>0741642093</u></span>). On (<b>May 30, 2023</b> at <b>2:51 PM</b>) New agent balance is <span class=\"money\"><b><u>Ksh 6,738.49</u></b></span>. Thank you for choosing our platform. KEPAS, YOUR MONEY FREEDOM.', 'May 30, 2023', '2:51 PM', '2023-05-30 11:51:37'),
(515, NULL, NULL, 19, 33, NULL, 200.00, 'S', NULL, NULL, 'nelson', 'lemein', '0741642093', 6.00, 0.00, NULL, NULL, NULL, 0.00, 0.00, 'TID-1547221547', '<span class=\"random-ids\"><u><b>TID-1547221547</b></u></span> Confirmed You have successfully withdraw <span class=\"money\"><b><u>Ksh 200.00 </u></b></span> from <b>nelson-lemein-tiger4238</b> (<span class=\"phone-number\"><u>4238619</u></span>). On (<b>May 30, 2023</b> at <b>4:15 PM</b>). New KEPAS balance is <span class=\"money\"><b><u>Ksh 992,169.51</u></b></span>. Thank you for choosing our platform. KEPAS, YOUR MONEY FREEDOM.', NULL, NULL, NULL, NULL, 'nelson-lemein-tiger4238', 4238619, '07123456789', 0.00, NULL, 'May 30, 2023', '4:15 PM', '2023-05-30 13:15:58'),
(516, NULL, NULL, 19, 33, NULL, 200.00, 'R', NULL, NULL, 'nelson', 'lemein', '0741642093', 6.00, 0.00, NULL, NULL, NULL, 0.00, 0.00, 'TID-1547221547', NULL, NULL, NULL, NULL, NULL, 'nelson-lemein-tiger4238', 4238619, '07123456789', 0.60, '<span class=\"random-ids\"><u><b>TID-1547221547</b></u></span> Confirmed You Received <span class=\"money\"><b><u>Ksh 200.00 </u></b></span> from <b>nelson</b> <b>lemein</b> (<span class=\"phone-number\"><u>0741642093</u></span>). On (<b>May 30, 2023</b> at <b>4:15 PM</b>) New agent balance is <span class=\"money\"><b><u>Ksh 6,938.49</u></b></span>. Thank you for choosing our platform. KEPAS, YOUR MONEY FREEDOM.', 'May 30, 2023', '4:15 PM', '2023-05-30 13:15:58'),
(517, NULL, NULL, 19, 33, NULL, 30000.00, 'S', NULL, NULL, 'nelson', 'lemein', '0741642093', 105.00, 0.00, NULL, NULL, NULL, 0.00, 0.00, 'TID-2489195284', '<span class=\"random-ids\"><u><b>TID-2489195284</b></u></span> Confirmed You have successfully withdraw <span class=\"money\"><b><u>Ksh 30,000.00 </u></b></span> from <b>nelson-lemein-tiger4238</b> (<span class=\"phone-number\"><u>4238619</u></span>). On (<b>May 30, 2023</b> at <b>4:48 PM</b>). New KEPAS balance is <span class=\"money\"><b><u>Ksh 962,064.51</u></b></span>. Thank you for choosing our platform. KEPAS, YOUR MONEY FREEDOM.', NULL, NULL, NULL, NULL, 'nelson-lemein-tiger4238', 4238619, '07123456789', 0.00, NULL, 'May 30, 2023', '4:48 PM', '2023-05-30 13:48:39'),
(518, NULL, NULL, 19, 33, NULL, 30000.00, 'R', NULL, NULL, 'nelson', 'lemein', '0741642093', 105.00, 0.00, NULL, NULL, NULL, 0.00, 0.00, 'TID-2489195284', NULL, NULL, NULL, NULL, NULL, 'nelson-lemein-tiger4238', 4238619, '07123456789', 10.50, '<span class=\"random-ids\"><u><b>TID-2489195284</b></u></span> Confirmed You Received <span class=\"money\"><b><u>Ksh 30,000.00 </u></b></span> from <b>nelson</b> <b>lemein</b> (<span class=\"phone-number\"><u>0741642093</u></span>). On (<b>May 30, 2023</b> at <b>4:48 PM</b>) New agent balance is <span class=\"money\"><b><u>Ksh 36,938.49</u></b></span>. Thank you for choosing our platform. KEPAS, YOUR MONEY FREEDOM.', 'May 30, 2023', '4:48 PM', '2023-05-30 13:48:39'),
(519, NULL, NULL, 20, 34, NULL, 3000.00, 'S', NULL, NULL, 'cate', 'tracy', '1234567890', 51.00, 0.00, NULL, NULL, NULL, 0.00, 0.00, 'TID-2843121869', '<span class=\"random-ids\"><u><b>TID-2843121869</b></u></span> Confirmed You have successfully withdraw <span class=\"money\"><b><u>Ksh 3,000.00 </u></b></span> from <b>patrick-julaton-tiger5472</b> (<span class=\"phone-number\"><u>5472138</u></span>). On (<b>May 30, 2023</b> at <b>9:26 PM</b>). New KEPAS balance is <span class=\"money\"><b><u>Ksh 8,130.80</u></b></span>. Thank you for choosing our platform. KEPAS, YOUR MONEY FREEDOM.', NULL, NULL, NULL, NULL, 'patrick-julaton-tiger5472', 5472138, '0712123434', 0.00, NULL, 'May 30, 2023', '9:26 PM', '2023-05-30 18:26:32'),
(520, NULL, NULL, 20, 34, NULL, 3000.00, 'R', NULL, NULL, 'cate', 'tracy', '1234567890', 51.00, 0.00, NULL, NULL, NULL, 0.00, 0.00, 'TID-2843121869', NULL, NULL, NULL, NULL, NULL, 'patrick-julaton-tiger5472', 5472138, '0712123434', 5.10, '<span class=\"random-ids\"><u><b>TID-2843121869</b></u></span> Confirmed You Received <span class=\"money\"><b><u>Ksh 3,000.00 </u></b></span> from <b>cate</b> <b>tracy</b> (<span class=\"phone-number\"><u>1234567890</u></span>). On (<b>May 30, 2023</b> at <b>9:26 PM</b>) New agent balance is <span class=\"money\"><b><u>Ksh 3,000.00</u></b></span>. Thank you for choosing our platform. KEPAS, YOUR MONEY FREEDOM.', 'May 30, 2023', '9:26 PM', '2023-05-30 18:26:32'),
(521, NULL, NULL, NULL, 33, NULL, 0.00, 'E', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, NULL, NULL, NULL, 0.00, 0.00, 'TID-6941521493', NULL, NULL, NULL, NULL, '<span class=\"random-ids\"><u><b>TID-6941521493</b></u></span> Failed. Please check agent number <span class=\"phone-number\"><u><b>74754</b></u></span> does not exist!', NULL, NULL, NULL, 0.00, NULL, 'May 30, 2023', '11:46 PM', '2023-05-30 20:46:42'),
(522, NULL, NULL, 21, 33, NULL, 30000.00, 'S', NULL, NULL, 'nelson', 'lemein', '0741642093', 105.00, 0.00, NULL, NULL, NULL, 0.00, 0.00, 'TID-2837531972', '<span class=\"random-ids\"><u><b>TID-2837531972</b></u></span> Confirmed You have successfully withdraw <span class=\"money\"><b><u>Ksh 30,000.00 </u></b></span> from <b>nelson-lemein-Giraffe-2718</b> (<span class=\"phone-number\"><u>2718549</u></span>). On (<b>May 31, 2023</b> at <b>9:57 PM</b>). New KEPAS balance is <span class=\"money\"><b><u>Ksh 931,959.51</u></b></span>. Thank you for choosing our platform. KEPAS, YOUR MONEY FREEDOM.', NULL, NULL, NULL, NULL, 'nelson-lemein-Giraffe-2718', 2718549, '0113913631', 0.00, NULL, 'May 31, 2023', '9:57 PM', '2023-05-31 18:57:44'),
(523, NULL, NULL, 21, 33, NULL, 30000.00, 'R', NULL, NULL, 'nelson', 'lemein', '0741642093', 105.00, 0.00, NULL, NULL, NULL, 0.00, 0.00, 'TID-2837531972', NULL, NULL, NULL, NULL, NULL, 'nelson-lemein-Giraffe-2718', 2718549, '0113913631', 10.50, '<span class=\"random-ids\"><u><b>TID-2837531972</b></u></span> Confirmed You Received <span class=\"money\"><b><u>Ksh 30,000.00 </u></b></span> from <b>nelson</b> <b>lemein</b> (<span class=\"phone-number\"><u>0741642093</u></span>). On (<b>May 31, 2023</b> at <b>9:57 PM</b>) New agent balance is <span class=\"money\"><b><u>Ksh 30,000.00</u></b></span>. Thank you for choosing our platform. KEPAS, YOUR MONEY FREEDOM.', 'May 31, 2023', '9:57 PM', '2023-05-31 18:57:44'),
(524, NULL, NULL, NULL, 40, NULL, 0.00, 'W', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, NULL, NULL, NULL, 0.00, 0.00, 'TID-2174665281', NULL, NULL, NULL, '<span class=\"random-ids\"><u><b>TID-2174665281</b></u></span> Failed. You do not have sufficient funds to withdraw <span class=\"money\"><b><u>Ksh 41,235.00</u></b></span> Your balance is <span class=\"money\"><b><u>Ksh 41,235.00</u></b></span> You should pay a transaction fee of <span class=\"money\"><b><u>Ksh 105.00</u></b></span> Please top up <span class=\"money\"><b><u>Ksh 105.00</u></b></span> and Try Again', NULL, NULL, NULL, NULL, 0.00, NULL, 'May 31, 2023', '10:40 PM', '2023-05-31 19:40:14'),
(525, NULL, NULL, NULL, 33, NULL, 0.00, 'E', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, NULL, NULL, NULL, 0.00, 0.00, 'TID-3216471683', NULL, NULL, NULL, NULL, '<span class=\"random-ids\"><u><b>TID-3216471683</b></u></span> Failed. Please check agent number <span class=\"phone-number\"><u><b>660606001000</b></u></span> does not exist!', NULL, NULL, NULL, 0.00, NULL, 'Jun 1, 2023', '11:01 AM', '2023-06-01 08:01:25'),
(526, NULL, NULL, 21, 33, NULL, 200.00, 'S', NULL, NULL, 'nelson', 'lemein', '0741642093', 6.00, 0.00, NULL, NULL, NULL, 0.00, 0.00, 'TID-2791651826', '<span class=\"random-ids\"><u><b>TID-2791651826</b></u></span> Confirmed You have successfully withdraw <span class=\"money\"><b><u>Ksh 200.00 </u></b></span> from <b>nelson-lemein-Giraffe-2718</b> (<span class=\"phone-number\"><u>2718549</u></span>). On (<b>Jun 1, 2023</b> at <b>9:49 PM</b>). New KEPAS balance is <span class=\"money\"><b><u>Ksh 931,753.51</u></b></span>. Thank you for choosing our platform. KEPAS, YOUR MONEY FREEDOM.', NULL, NULL, NULL, NULL, 'nelson-lemein-Giraffe-2718', 2718549, '0113913631', 0.00, NULL, 'Jun 1, 2023', '9:49 PM', '2023-06-01 18:49:54'),
(527, NULL, NULL, 21, 33, NULL, 200.00, 'R', NULL, NULL, 'nelson', 'lemein', '0741642093', 6.00, 0.00, NULL, NULL, NULL, 0.00, 0.00, 'TID-2791651826', NULL, NULL, NULL, NULL, NULL, 'nelson-lemein-Giraffe-2718', 2718549, '0113913631', 0.60, '<span class=\"random-ids\"><u><b>TID-2791651826</b></u></span> Confirmed You Received <span class=\"money\"><b><u>Ksh 200.00 </u></b></span> from <b>nelson</b> <b>lemein</b> (<span class=\"phone-number\"><u>0741642093</u></span>). On (<b>Jun 1, 2023</b> at <b>9:49 PM</b>) New agent balance is <span class=\"money\"><b><u>Ksh 30,200.00</u></b></span>. Thank you for choosing our platform. KEPAS, YOUR MONEY FREEDOM.', 'Jun 1, 2023', '9:49 PM', '2023-06-01 18:49:54');

-- --------------------------------------------------------

--
-- Table structure for table `argents`
--

CREATE TABLE `argents` (
  `id` int(11) NOT NULL,
  `transactions_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `users_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `banks`
--

CREATE TABLE `banks` (
  `id` int(11) NOT NULL,
  `transactions_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(92, 34, 32.00, 3.20, 'Jan 29, 2023', '2:56 PM'),
(93, 34, 0.00, 0.00, 'Apr 28, 2023', '6:32 PM'),
(94, 40, 0.00, 0.00, 'Apr 28, 2023', '7:00 PM'),
(95, 34, 0.00, 0.00, 'Apr 30, 2023', '9:46 AM'),
(96, 33, 6.00, 0.60, 'May 17, 2023', '8:31 PM'),
(97, 39, 0.00, 0.00, 'May 21, 2023', '4:14 PM'),
(98, 34, 6.00, 0.60, 'May 24, 2023', '11:11 PM');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `myTable`
--

CREATE TABLE `myTable` (
  `id` int(11) NOT NULL,
  `transactions_id` int(11) DEFAULT NULL,
  `banks_id` int(11) DEFAULT NULL,
  `agents_id` int(11) DEFAULT NULL,
  `users_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pending_messages`
--

CREATE TABLE `pending_messages` (
  `id` int(11) NOT NULL,
  `transaction_id` varchar(20) DEFAULT NULL,
  `sender_id` int(11) DEFAULT NULL,
  `recipient_id` int(11) DEFAULT NULL,
  `sender_success_message` longtext DEFAULT NULL,
  `recipient_success_message` longtext DEFAULT NULL,
  `sender_pending_message` longtext DEFAULT NULL,
  `recipient_pending_message` longtext DEFAULT NULL,
  `time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `total_company_income`
--

CREATE TABLE `total_company_income` (
  `id` int(11) NOT NULL,
  `company_name` varchar(20) DEFAULT NULL,
  `total_income` float(10,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `total_wallet_income`
--

CREATE TABLE `total_wallet_income` (
  `id` int(11) NOT NULL,
  `recipient_id` int(11) DEFAULT NULL,
  `total_wallet_income` float(10,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `transactions_id`, `company_id`, `agent_id`, `first_name`, `last_name`, `id_number`, `mobile`, `country`, `email`, `password`, `is_local_user`, `is_agent`, `is_company`, `is_bank`, `public_id`, `balance`, `show_balance`, `income`, `date`) VALUES
(33, NULL, NULL, NULL, 'nelson', 'lemein', '225468566588', '0741642093', NULL, 'nelson@gmail.com', '$2a$12$1jIX4M6qHi1WFTAX0MhGfO27QHaKWrkCZuIa3ZWqCQ6nV9OyUedLO', 'yes', NULL, NULL, NULL, '926135478', 931753.51, 1, 80.50, '2021-10-13 20:41:47'),
(34, NULL, NULL, NULL, 'cate', 'tracy', '3434244212', '1234567890', NULL, 'tracy@gmail.com', '$2a$12$zGRI9ShPEu9lpzcEtpI0/uFkP.gt7TQh18KYeHYDRMyi9WgrL5u0.', 'yes', NULL, NULL, NULL, '862435917', 8130.80, 1, 37.20, '2021-10-13 20:45:50'),
(39, NULL, NULL, NULL, 'denos', 'lenos', '12345678', '0112345678', NULL, 'nn@mail.com', '$2a$12$9gqJNxwB1RKYf7XasLhvLeWhQDuoUznYO.VML5JVyelpyTj6GIv1G', 'yes', NULL, NULL, NULL, '456317829', 1413.00, 1, 9.30, '2021-10-24 14:31:33'),
(40, NULL, NULL, NULL, 'willy', 'paul', '12323236', '0711223344', NULL, 'willy@gmail.com', '$2a$12$HUtxYkF2dVOsdkd1eY62guPYvaMP6L7moPJY4sh1Fl5gvtz6NcBge', 'yes', NULL, NULL, NULL, '324589617', 41235.00, 1, 2.40, '2022-11-05 17:01:53'),
(41, NULL, NULL, NULL, 'dani', 'alaves', '12332154', '1212343454', NULL, 'dan@gmail.com', '$2a$12$XYA4EjB0kXm1lnq9lpBjkuZaF7HMELMFUETN.xSm0bEd8rcdrWEQW', 'yes', NULL, NULL, NULL, '518934627', 0.00, 1, 0.00, '2023-01-04 21:09:20'),
(42, NULL, NULL, NULL, 'Ester', 'Wamboi', '12312312', '0712343456', NULL, 'wambo@gmail.com', '$2a$12$fjJMTRCRl7Wkr9vv.PcJzO3C97xyXtzPCkRlAcMs5jv0dANrVHcl.', 'yes', NULL, NULL, NULL, '285169743', 0.00, 1, 0.00, '2023-01-28 19:48:45'),
(43, NULL, NULL, NULL, 'Peris', 'Wira', '11223344', '0798765432', NULL, 'wira@gmail.com', '$2a$12$f.1t49KsUnLT1NGQ4rHvqu7Qx/EeUM2AYjdVISC0rc0602G/LqHDm', NULL, NULL, NULL, 'yes', '472689153', 0.00, 1, 0.00, '2023-01-28 19:55:09'),
(44, NULL, NULL, NULL, 'Brian', 'Kamau', '11223342', '0798765765', NULL, 'brian@gmail.com', '$2a$12$kDMrVtckV88D0XQsdA7W3OFX6531q9EUGYAqU0psMbTBHhvJtm.Am', NULL, NULL, 'yes', NULL, '194853267', 0.00, 1, 0.00, '2023-01-28 19:57:23'),
(45, NULL, NULL, NULL, 'Anthony', 'Mwangi', '11223343', '0798765743', NULL, 'mwangi@gmail.com', '$2a$12$IDwcdOVmekJGhCWXH3TP.u3leA2BnzPl0KgpCYuXJ0Bi2qxjn5I.e', NULL, 'yes', NULL, NULL, '631952748', 0.00, 1, 0.00, '2023-01-28 19:58:35'),
(46, NULL, NULL, NULL, 'nelly', 'lemmy', '33436166', '07123456789', NULL, 'nelsonlemmy61@gmail.com', '$2a$12$VQR3iaK/VlepjZ5LjijDOeoeRTT0/EsGA8w.oFWKmds/LfVf20aUe', 'yes', NULL, NULL, NULL, '879354126', 0.00, 1, 0.00, '2023-04-25 22:15:50'),
(47, NULL, NULL, NULL, 'albert', 'tait', '12345678', '0712341234', NULL, 'doe@gmail.com', '$2a$12$M4fplCPFCrZmQyZcmspeaO7nAjTMEWymxb.YoXa3aLjThRuLsk9yu', 'yes', NULL, NULL, NULL, '815794326', 0.00, 1, 0.00, '2023-04-29 17:08:54'),
(48, NULL, NULL, NULL, 'Patrick', 'Julaton', '33436266', '07073456789', NULL, 'julaton@gmail.com', '$2a$12$M.1JXIzeerOul1eievybseuIljlM3UUEd7fFxkeQ.h5/Q2wUS5g..', 'yes', NULL, NULL, NULL, '976345281', 0.00, 1, 0.00, '2023-05-26 22:26:27');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `50793553d5229621cbf9e241c529125c1b7c3723bff47eea888062007add5aa7`
--
ALTER TABLE `50793553d5229621cbf9e241c529125c1b7c3723bff47eea888062007add5aa7`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `agents`
--
ALTER TABLE `agents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `agents_ibfk_1` (`transactions_id`),
  ADD KEY `agents_ibfk_2` (`company_id`),
  ADD KEY `agents_ibfk_3` (`users_id`);

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
-- Indexes for table `myTable`
--
ALTER TABLE `myTable`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pending_messages`
--
ALTER TABLE `pending_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`sender_id`),
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `all_transactions`
--
ALTER TABLE `all_transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=528;

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
COMMIT;

--
-- AUTO_INCREMENT for table `in_wallet`
--
ALTER TABLE `in_wallet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
