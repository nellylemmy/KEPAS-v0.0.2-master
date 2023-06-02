const mysql = require('mysql2');

let dbConnection = mysql.createPool({
    port: 3406,
    host:'127.0.0.1',   // host name
    user: 'root',      // database username
    password: '',      // database password
    database: 'kepas_DB_v0.1'// database Name
});

    // suspended
    // domant
    // active
    // freezed
    // Excelent
    // Good

    
/*
    CREATE ALL TABLES .
*/


// dbConnection.query('CREATE TABLE IF NOT EXISTS `agents` (`id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,`agent_number` mediumint(255) DEFAULT NULL,`agent_name` varchar(40) DEFAULT NULL,`agent_owner_full_names` varchar(100) DEFAULT NULL,`agent_id` int(11) DEFAULT NULL,`agent_phone` varchar(14) DEFAULT NULL,`agent_email` varchar(250) DEFAULT NULL,`agent_password` varchar(250) DEFAULT NULL,`agent_total_bal` decimal(13,2) DEFAULT 0.00,`agent_total_income` decimal(13,2) DEFAULT 0.00,`is_local_user` varchar(10) DEFAULT NULL,`is_agent` varchar(10) DEFAULT NULL,`is_company` varchar(10) DEFAULT NULL,`is_bank` varchar(10) DEFAULT NULL,`time` datetime NOT NULL DEFAULT current_timestamp(),`transactions_id` int(11) DEFAULT NULL,`company_id` int(11) DEFAULT NULL,`users_id` int(11) DEFAULT NULL, FOREIGN KEY (`transactions_id`) REFERENCES `transactions` (`id`) ON DELETE SET NULL, FOREIGN KEY (`company_id`) REFERENCES `company` (`id`) ON DELETE SET NULL, FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE SET NULL)');

// dbConnection.execute('ALTER TABLE `agents`MODIFY `id` int(11) NOT NULL AUTO_INCREMENT');


// dbConnection.query('CREATE TABLE IF NOT EXISTS `all_transactions` (`id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,`company_id` int(11) DEFAULT NULL,`bank_id` int(11) DEFAULT NULL,`agent_id` int(11) DEFAULT NULL,`sender_id` int(11) DEFAULT NULL,`recipient_id` int(11) DEFAULT NULL,`amount` decimal(13,2) DEFAULT 0.00,`mode` varchar(10) DEFAULT NULL,`sender_mode` varchar(10) DEFAULT NULL,`recipient_mode` varchar(10) DEFAULT NULL,`sender_first_name` varchar(30) DEFAULT NULL,`sender_last_name` varchar(30) DEFAULT NULL,`sender_mobile` varchar(15) DEFAULT NULL,`sender_transaction_cost` decimal(13,2) DEFAULT 0.00,`sender_income` decimal(13,2) DEFAULT 0.00,`recipient_first_name` varchar(30) DEFAULT NULL,`recipient_last_name` varchar(30) DEFAULT NULL,`recipient_mobile` varchar(15) DEFAULT NULL,`recipient_transaction_cost` decimal(13,2) DEFAULT 0.00,`recipient_income` decimal(13,2) DEFAULT 0.00,`transaction_id` varchar(30) DEFAULT NULL,`sender_success_message` longtext DEFAULT NULL,`recipient_success_message` longtext DEFAULT NULL,`pending_message` longtext DEFAULT NULL,`warning_message` longtext DEFAULT NULL,`error_message` longtext DEFAULT NULL,`current_date` varchar(30) DEFAULT NULL,`current_time` varchar(30) DEFAULT NULL,FOREIGN KEY (`company_id`) REFERENCES `company` (`id`) ON DELETE SET NULL, FOREIGN KEY (`bank_id`) REFERENCES `banks` (`id`) ON DELETE SET NULL, FOREIGN KEY (`agent_id`) REFERENCES `agents` (`id`) ON DELETE SET NULL, FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`) ON DELETE SET NULL, FOREIGN KEY (`recipient_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,`date_time` timestamp NOT NULL DEFAULT current_timestamp())');

// dbConnection.query('ALTER TABLE `all_transactions`MODIFY `id` int(11) NOT NULL AUTO_INCREMENT')




// Table structure for table `users`

// dbConnection.query('CREATE TABLE IF NOT EXISTS users (`id` int(11) NOT NULL,`transactions_id` int(11) DEFAULT NULL,`company_id` int(11) DEFAULT NULL,`agent_id` int(11) DEFAULT NULL,`first_name` varchar(100) DEFAULT NULL,`last_name` varchar(100) DEFAULT NULL,`id_number` varchar(100) DEFAULT NULL,`mobile` varchar(14) DEFAULT NULL,`country` varchar(30) DEFAULT NULL,`email` varchar(200) DEFAULT NULL,`password` varchar(250) DEFAULT NULL,`is_local_user` varchar(10) DEFAULT NULL,`is_agent` varchar(10) DEFAULT NULL,`is_company` varchar(10) DEFAULT NULL,`is_bank` varchar(10) DEFAULT NULL,`public_id` varchar(14) DEFAULT NULL,`balance` decimal(10,2) NOT NULL DEFAULT 0.00,`income` decimal(10,2) NOT NULL DEFAULT 0.00,`date` datetime NOT NULL DEFAULT current_timestamp())')

// =============== END OF users table ================= //

// Table structure for table `all_transactions`

// dbConnection.query(' CREATE TABLE IF NOT EXISTS all_transactions (`id` int(11) PRIMARY KEY NOT NULL, `company_id` int(11) DEFAULT NULL,`bank_id` int(11) DEFAULT NULL,`agent_id` int(11) DEFAULT NULL,`sender_id` int(11) DEFAULT NULL,`recipient_id` int(11) DEFAULT NULL,`amount` float DEFAULT NULL,`mode` varchar(10) DEFAULT NULL,`sender_mode` varchar(10) DEFAULT NULL,`recipient_mode` varchar(10) DEFAULT NULL,`sender_first_name` varchar(30) DEFAULT NULL,`sender_last_name` varchar(30) DEFAULT NULL,`sender_mobile` varchar(15) DEFAULT NULL,`sender_transaction_cost` varchar(20) DEFAULT NULL,`sender_income` varchar(30) DEFAULT NULL,`recipient_first_name` varchar(30) DEFAULT NULL,`recipient_last_name` varchar(30) DEFAULT NULL,`recipient_mobile` varchar(15) DEFAULT NULL,`recipient_transaction_cost` varchar(20) DEFAULT NULL,`recipient_income` varchar(30) DEFAULT NULL,`transaction_id` varchar(30) DEFAULT NULL,`sender_success_message` varchar(255) DEFAULT NULL,`recipient_success_message` varchar(255) DEFAULT NULL,`pending_message` varchar(255) DEFAULT NULL,`warning_message` longtext DEFAULT NULL,`error_message` varchar(255) DEFAULT NULL,`current_date` varchar(30) DEFAULT NULL,`current_time` varchar(30) DEFAULT NULL,`date_time` timestamp NOT NULL DEFAULT current_timestamp())')



// =============== END OF all_transactions table ================= //

// Table structure for table `company_income`

// dbConnection.query('CREATE TABLE IF NOT EXISTS company_income (`id` int(11) PRIMARY KEY NOT NULL,`sender_id` int(11) NULL,`transaction_cost` float(10,2) NULL DEFAULT 0.00,`income` float(10,2) NULL DEFAULT 0.00,`date` varchar(20) NULL,`time` varchar(20) NULL)')

// =============== END OF company_income table ================= //

// Table structure for table `in_wallet`

// dbConnection.query('CREATE TABLE IF NOT EXISTS in_wallet (`id` int(11) PRIMARY KEY NOT NULL,`recipient_id` int(11) NULL,`transaction_cost` float(10,2) NULL DEFAULT 0.00,`wallet_income` float(10,2) NULL DEFAULT 0.00,`date` varchar(20) NULL,`time` varchar(20) NULL)')

// =============== END OF in_wallet table ================= //

// Table structure for table `local_user`

// dbConnection.query('CREATE TABLE IF NOT EXISTS local_user (`id` int(11) PRIMARY KEY NOT NULL,`local_user_id` int(11) NOT NULL,`first_name` varchar(100) NOT NULL,`last_name` varchar(100) NOT NULL,`mobile` varchar(14) NOT NULL,`email` varchar(250) NOT NULL,`password` varchar(250) NOT NULL,`country` varchar(50) NOT NULL)')

// =============== END OF local_user table ================= //

// Table structure for table `total_company_income`

// dbConnection.query('CREATE TABLE IF NOT EXISTS total_company_income (`id` int(11) PRIMARY KEY NOT NULL,`company_name` varchar(20) DEFAULT NULL,`total_income` float(10,2) NULL DEFAULT 0.00)')

// =============== END OF local_user table ================= //

// Table structure for table `total_wallet_income`

// dbConnection.query('CREATE TABLE IF NOT EXISTS total_wallet_income (`id` int(11) PRIMARY KEY NOT NULL,`recipient_id` int(11) NULL,`total_wallet_income` float(10,2) NULL DEFAULT 0.00)')

// =========== END OF total_wallet_income table ============= //

// Table structure for table `agents`

// dbConnection.query('CREATE TABLE IF NOT EXISTS agents (`id` int(11) PRIMARY KEY NOT NULL,`transactions_id` int(11) DEFAULT NULL,`company_id` int(11) DEFAULT NULL,`users_id` int(11) DEFAULT NULL,`agent_id` int(11) NOT NULL,`number` mediumint(15) NOT NULL,`name` varchar(40) NOT NULL,`phone` varchar(14) NOT NULL,`country` varchar(40) NOT NULL,`email` varchar(250) NOT NULL,`password` varchar(250) NOT NULL)')

// =============== END OF agents table ================= //

// Table structure for table `banks`

// dbConnection.query('CREATE TABLE IF NOT EXISTS banks (`id` int(11) PRIMARY KEY NOT NULL,`transactions_id` int(11) DEFAULT NULL,`company_id` int(11) DEFAULT NULL)')

// =============== END OF banks table ================= //

// Table structure for table `company`

// dbConnection.query('CREATE TABLE IF NOT EXISTS company (`id` int(11) PRIMARY KEY NOT NULL,`transactions_id` int(11) DEFAULT NULL,`banks_id` int(11) DEFAULT NULL,`agents_id` int(11) DEFAULT NULL,`users_id` int(11) DEFAULT NULL)')

// =============== END OF company table ================= //

// Table structure for table `transactions`

// dbConnection.query('CREATE TABLE IF NOT EXISTS transactions (`id` int(11) PRIMARY KEY NOT NULL,`company_id` int(11) DEFAULT NULL,`banks_id` int(11) DEFAULT NULL,`agents_id` int(11) DEFAULT NULL,`users_id` int(11) DEFAULT NULL)')



// =============== END OF transactions table ================= //

// dbConnection.query('ALTER TABLE `users`ADD FOREIGN KEY (`transactions_id`) REFERENCES `transactions` (`id`) ON DELETE SET NULL,ADD FOREIGN KEY (`company_id`) REFERENCES `company` (`id`) ON DELETE SET NULL,ADD FOREIGN KEY (`agent_id`) REFERENCES `agents` (`id`) ON DELETE SET NULL')

// dbConnection.query('ALTER TABLE `all_transactions`ADD FOREIGN KEY (`company_id`) REFERENCES `company` (`id`) ON DELETE SET NULL,ADD FOREIGN KEY (`bank_id`) REFERENCES `banks` (`id`) ON DELETE SET NULL,ADD FOREIGN KEY (`agent_id`) REFERENCES `agents` (`id`) ON DELETE SET NULL,ADD FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,ADD FOREIGN KEY (`recipient_id`) REFERENCES `users` (`id`) ON DELETE SET NULL')

// dbConnection.query('ALTER TABLE `transactions`ADD FOREIGN KEY (`company_id`) REFERENCES `company` (`id`) ON DELETE SET NULL,ADD FOREIGN KEY (`banks_id`) REFERENCES `banks` (`id`) ON DELETE SET NULL,ADD FOREIGN KEY (`agents_id`) REFERENCES `agents` (`id`) ON DELETE SET NULL,ADD FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE SET NULL')

// dbConnection.query('CREATE TABLE IF NOT EXISTS example_table (`id` int(11) PRIMARY KEY NOT NULL,`transactions_id` int(11) DEFAULT NULL,`banks_id` int(11) DEFAULT NULL,`agents_id` int(11) DEFAULT NULL,`users_id` int(11) DEFAULT NULL)');

module.exports = dbConnection.promise();