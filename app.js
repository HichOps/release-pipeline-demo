const express = require('express');
const app = express();
const port = process.env.PORT || 3000;

// Tes routes ici, par exemple :
app.get('/api/data', (req, res) => {
  res.status(200).json({ message: 'Données récupérées avec succès' });
});

// Démarrer le serveur seulement si ce n'est pas en mode test
if (process.env.NODE_ENV !== 'test') {
  app.listen(port, () => {
    console.log(`Serveur en écoute sur http://localhost:${port}`);
  });
}

module.exports = app; // Permet de tester l'application sans démarrer le serveur
