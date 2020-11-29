const { Router } = require('express');
const router = Router();

const faker = require('faker');

const Prospecto = require('../models/Prospecto');



router.post('/api/prospectos/create', async(req,res, next) =>{
    const prospecto = new Prospecto(req.body);
    console.log(prospecto);
    try {
        await prospecto.save();
        res.json({ message: 'Prospecto creado' });
    } catch (error) {
        res.json({ message: error.message});
    }
});

router.get('/api/prospectos/', async (req, res) => {
    const prosp = await Prospecto.find();
    res.json({ prosp });
})

router.get('/api/prospectos/:id', async (req, res) => {
    const prosp = await Prospecto.findById(req.params.id);
    console.log(prosp);
    res.json({"Resultado": "Consulta de prospecto"});
    // res.json({ prosp });
})

router.put('/api/prospectos/:id', async (req, res) => {
    const prosp = await Prospecto.findByIdAndUpdate(req.params.id, req.body);
    console.log(prosp);
    res.json({"Resultado": "Prospecto Actualizado"});
    // res.json({ prosp });
})

router.delete('/api/prospectos/:id', async (req,res) =>{
    const props = await Prospecto.findOneAndDelete(req.params.id);
    res.json({message: "Prospecto Eliminado"})
});

module.exports = router;