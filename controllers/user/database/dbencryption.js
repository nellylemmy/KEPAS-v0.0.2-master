const crypto = require('crypto');
const dbConnection = require("../../../utils/dbConnection");

const algorithm = 'aes-192-cbc';
const password = '793553d5229621cbf9e241c529125c1b7c3723bff47eea888062007add5aa7';
const encryptionKey = crypto.scryptSync(password, 'GfG', 24)
const iv = Buffer.alloc(16, 3);

function encryptTableName(tableName) {
    const cipher = crypto.createCipheriv(algorithm, encryptionKey, iv);
    let encrypted = cipher.update(tableName, 'utf8', 'hex');
    encrypted += cipher.final('hex');
    return encrypted;
  }
  
  function decryptTableName(encryptedTableName) {
    const decipher = crypto.createDecipheriv(algorithm, encryptionKey, iv);
    let decrypted = decipher.update(encryptedTableName, 'hex', 'utf8');
    decrypted += decipher.final('utf8');
    return decrypted;
  }

  // Example usage
let userTableName = 'users_data_set_1_table';

const encryptedTableName = encryptTableName(userTableName);
const decryptedTableName = decryptTableName(encryptedTableName);


// console.log(`the encrypted user table is ${encryptedTableName}`);
// console.log(`the decrypted user table is ${decryptedTableName}`);

dbConnection.execute(`CREATE TABLE IF NOT EXISTS ${encryptedTableName} (
\`id\` int(11) PRIMARY KEY NOT NULL,
\`transactions_id\` int(11) DEFAULT NULL,
\`banks_id\` int(11) DEFAULT NULL,
\`agents_id\` int(11) DEFAULT NULL,
\`users_id\` int(11) DEFAULT NULL
)`);