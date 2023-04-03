import http from 'http';

/** @type {string} */
const hostname = 'localhost';

/** @type {number} */
const port = 3000;

const server = http.createServer((req, res) => {
  res.statusCode = 200;
  res.setHeader('Content-Type', 'text/plain; charset=utf-8');
  res.end('¡Hola Mundo!');
});

server.listen(port, hostname, () => {
  // eslint-disable-next-line no-console
  console.log(`El servidor se está ejecutando en http://${hostname}:${port}/`);
});
