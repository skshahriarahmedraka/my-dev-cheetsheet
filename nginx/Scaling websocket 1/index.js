const http= require("http");
const WebSocketServer = require("websocket").server
const httpServer = http.createServer();

const websocketServer = new WebSocketServer({
    httpServer: httpServer
})

const PORT = process.argv[2] || 8080;
let connnection = null;
httpServer.listen(PORT, () => {console.log(`listening on port ${PORT}`)})


websocketServer.on("request", (request) => {
    connection = request.accept(null, request.origin)
    connection.on("message", (data) => {
        console.log(`I Received a message on port${PORT} : ${data.utf8Data}`)
        connection.send(`hey client, I received your message: ${data.utf8Data} on port ${PORT}`)
    })
})

// From Browser 
// let ws = new WebSocket("ws://127.0.0.1:8080") 
//ws.onmessage=e=> console.log(e.data) 
// ws.send("hello")

