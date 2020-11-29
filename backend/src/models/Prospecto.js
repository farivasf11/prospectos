const  {Schema, model} = require('mongoose');

const prospectoSchema = new Schema({
    nombre: {type: String, required: true},
    apellidoPaterno: String,
    apellidoMaterno: String,
    calle: String,
    numero: String,
    colonia: String,
    codigoPostal: Number,
    rfc: String,
    telefono: Number,
    correo: String,
    documentos: {type: String},
    estado: {type: String, default: 'Enviado'}
});

module.exports = model('Prospecto', prospectoSchema);