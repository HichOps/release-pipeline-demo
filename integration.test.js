const request = require('supertest');
const app = require('./app.js'); // Ton fichier d'application Express

describe('GET /api/data', () => {
  let server;

  beforeAll(() => {
    // Définir un port différent pour éviter les conflits
    process.env.PORT = 3001;

    // Démarrer le serveur avant tous les tests
    server = app.listen(process.env.PORT);
  });

  afterAll(async () => {
    // Fermer le serveur après tous les tests de manière asynchrone
    await new Promise(resolve => server.close(resolve));
  });

  it('devrait renvoyer un statut 200', async () => {
    const response = await request(app).get('/api/data');
    expect(response.status).toBe(200);
  });
});
