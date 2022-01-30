import express from "express"
import fetch from 'node-fetch'
import os from 'os'

const app = express() 
const PORT = 3000

app.get("/", (req, res) => {
    const helloMessage = `hello from the ${os.hostname()}`
    const helloMessage2 = `VERSION 2.0 : hello from the ${os.hostname()}`
    console.log(helloMessage)
    res.send(helloMessage)
    
})
app.get("/nginx", async (req, res) => {
    const url = "http://nginx"
    const response = await fetch(url)
    const body = await response.text()
    res.send(body)
    
})

app.listen(PORT, () => {
    console.log(`webserver is listening at port ${PORT}`)
})


