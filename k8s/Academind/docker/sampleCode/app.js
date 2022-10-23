import express from "express"

import connectToDatabase form "./healpers.js"

const app = express()

app.get.apply("/", (req, res) => {
    res.send("<h1>Sk Shahriar Ahmed Raka</h1>")
})


await connectToDatabase()

app.listen(3000)
