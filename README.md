# Kenya Payment Service (KEPAS-v0.02)

## Start by clonning

<b><i>NB</i> Make sure you have node and git installed</b>

1. <code>git clone https://github.com/nellylemmy/KEPAS-v0.0.2-master.git</code>

2. <code>npm install</code>

### Languages And Tools 
1. Javascript
2. EJS
3. Node JS
4. Express
5. CSS3
6. MySql2
7. BcryptJs
8. Crypto-js
9. Currency.js
10. Express-session
11. Express-validator
12. Fonts


[DOWNLOAD AND INSTALL XAMPP](https://www.apachefriends.org/download.html):
### Start sql and apache server from XAMPP Control panel
Create a new database and call it <b>kepas_DB_V0.1</b>. Click the kepas database from [phpmyadmin](http://localhost/phpmyadmin/index.php) and navigate to [SQL](http://localhost/phpmyadmin/index.php?route=/server/sql) Then copy everything from [kepas_DB_V0.1.sql](kepas_DB_V0.1.sql) and paste it to the textarea and hit Go

<b>To start the app just open a terminal and cd in to the project folder, then run <em><code>npm start</code></em></b>
<hr>

## Users table
#### example of users data in table

|**id**|**transactions_id**|**company_id**|**agent_id**|**first_name**|**last_name**|**phone**|
| ---| --------------- | ---------- | ----------| ---------- | --------- | ------------ |
| 1  | TID-677745334   |NULL        |   62      |   Nelson   |  Lemein   | 072534892095 |
| 2  | TID-456438263   |30          |   NULL    |   John     |  Doe      | 079201863723 |
| 3  | TID-009827389   |560         |   NULL    |   Brian    |  Lee      | 072565437829 |
| 4  | TID-774573346   |NULL        |   33      |   Mary     |  Anthony  | 077556634291 |
| 5  | TID-457943579   |12          |   NULL    |   Gerald    |  Travis   | 071009736228 |
                                   
