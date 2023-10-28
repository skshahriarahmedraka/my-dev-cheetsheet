import express from "express"
import os from 'os'

const app = express() 
const PORT = 3000

app.get("/", (req, res) => {
    const helloMessage = `hello from the ${os.hostname()}`
    const helloMessage2 = `VERSION 2.0 : hello from the ${os.hostname()}`
    console.log(helloMessage)
    res.send(helloMessage)
    
})

app.listen(PORT, () => {
    console.log(`VERSION 2: webserver is listening at port ${PORT}`)
})


