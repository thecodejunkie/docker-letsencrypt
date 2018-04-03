const express = require('express');
const server = express();

server.use(express.static('challenges'));
server.listen(80);
