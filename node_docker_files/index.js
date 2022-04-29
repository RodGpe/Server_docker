const express = require("express")
const mongoose = require("mongoose");
//const { MONGO_USER, MONGO_PASSWORD, MONGO_IP, MONGO_PORT } = require("./config/config");


const app = express()

// const mongoURL = `mongodb://${MONGO_USER}:${MONGO_PASSWORD}@${MONGO_IP}:${MONGO_PORT}/?authSource=admin`
// 
// const connectWithRetry = () => {
//     mongoose
//         .connect(mongoURL) //mongo_host esta defino en el archivo yml
//         .then(() => console.log("sí se pudo conectar a la base de datos"))
//         .catch((e) => {
//             console.log(e)
//             setTimeout(connectWithRetry, 5000)
//         });
// }
// 
// connectWithRetry();
// 


app.get("/", (req, res) => {
    res.append('Set-Cookie', 'Cookie=Monster; Path=/; HttpOnly')
    res.append('Set-Cookie', 'Autenticacion=1928; Path=/; HttpOnly')
    res.send("<h2>La solicitud fue procesada por reverse-proxy NGINX y la pasó a un proceso de Node.js corriendo Express</h2>");
});

app.get("/examen/", (req, res) => {
    res.send("<h1>Mensaje de examen</h1>");
});

app.get("/examen/respuestas", (req, res) => {
    res.send("<h1>Las respuestas del examen están en tu corazón</h1>");
});
app.get("/examen/dns", (req, res) => {
    res.send("<h1>Resolución DNS host bidi.unam.mx 132.248.9.341</h1>");
});

app.get("/examen/encabezados", (req, res) => {
    res.send("<h1>encabezado1:host</h1><h1>encabezado2:xss</h1><h1>encabezado3:off by 1</h1><h1>encabezado4:owasp</h1><h1>encabezado5:SANS</h1>");
});

app.get("/examen/codigos", (req, res) => {
    res.send("<h1>codigos 200, 300, 202, 508, 404</>");
});

app.get("/examen/status", (req, res) => {
    res.status(500).send("<h1>Solicitud procesada con normalidad pero con un codigo distinto al 200<h1/>");
});
//const port = process.env.PORT || 3000;
const port = 3000;

app.listen(port, () => console.log(`listening on port ${port}`))
