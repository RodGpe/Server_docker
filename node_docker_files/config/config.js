//estas variables de entorno estan definidas en el .yml
module.exports ={
    MONGO_IP : process.env.MONGO_IP || "mongo", //el doble pipe es por si existe la variable de entorno
    MONGO_PORT: process.env.MONGO_PORT || 27017,
    MONGO_USER: process.env.MONGO_USER,
    MONGO_PASSWORD: process.env.MONGO_PASSWORD
}