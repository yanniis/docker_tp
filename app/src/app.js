const express = require('express');
const mysql = require('mysql2');
const app = express();

const port = 4743;

const db = mysql.createConnection({
  host: 'mysql', // alias dans db_network
  user: 'user',
  password: 'userpassword',
  database: 'testdb'
});

db.connect(err => {
  if (err) {
    console.error('Erreur de connexion à MySQL:', err);
    return;
  }
  console.log('Connecté à MySQL');
});

app.get('/health', (req, res) => {
  res.status(200).json({ status: 'healthy' });
});

app.get('/data', (req, res) => {
  db.query('SELECT * FROM test_table', (err, results) => {
    if (err) {
      console.error('Erreur SQL:', err);
      return res.status(500).json({ error: 'Erreur lors de la récupération des données' });
    }
    res.json(results);
  });
});

app.listen(port, () => {
  console.log(`App listening on port ${port}`);
});
