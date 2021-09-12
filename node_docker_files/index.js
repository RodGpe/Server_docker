const express = require("express")

const app = express()

app.get("/", (req, res) => {
    res.send("<h2>La solicitud fue procesada por un reverse proxy nginx y la pasó a un proceso de node.js corriendo Express</h2>");
});

const port = process.env.PORT || 3000;

app.listen(port, () => console.log(`listening on port ${port}`))
