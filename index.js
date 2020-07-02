const http = require('http');
const express = require('express');
const socketio = require('socket.io');
const { MongoClient } = require('mongodb');
const axios = require('axios');
const path = require('path');

const client = MongoClient('mongodb://localhost:27017', { useNewUrlParser: true });

const app = express();
const server = http.createServer(app);
const io = socketio(server);

server.listen(3002, () => {
    console.log('Webserver is ready');
});

app.use(express.static(path.join(__dirname)));

io.on('connection', socket => {
    
});