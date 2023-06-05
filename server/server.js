const express = require('express')
const mysql = require('mysql');
const app = express()

// Conexión a la base de datos utilizando MySQL

const connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'bitacora',
  });

connection.connect((err) => {
    if (err) {
      console.error('Error, no se pudo conectar a la base de datos: ', err);
      return;
    }
    console.log('Conectado a la base de datos');
  });

// Definición de APIs

app.get('/:table/:field?', (req, res) => {
    const {table, field} = req.params;

    let query = `SELECT ${field || '*'} FROM ${table}`;
  
    connection.query(query, (err, results) => {
      if (err) {
        console.error('Error ejecutando siguiente query: ', err);
        // Query mal redactado / tabla no existe
        res.status(500).json({ error: 'Error ejecutando query' }); 
        return;
      }

      if (results.length === 0) {
        // Tabla existe, no tiene datos
        res.status(200).json({ message: 'No hay datos en la tabla o campo' }); 
        return;
      }
  
      if (results.length > 0) { 
        // Tabla existe, tiene datos
        res.json(results);
        return;
      }
  
      res.status(404).json({ error: 'No se encontro la tabla o campo' });
    });
  });

app.post('/:table', (req, res) => {
    const table = req.params.table;
    // Datos para el post como body de un request
    const fields = req.body; 
  
    // Campos y valores dinámicos
    const fieldNames = fields.map(field => field.name);
    const fieldValues = fields.map(field => field.value);
  
    const placeholders = fieldNames.map(() => '?').join(', ');
  
    // Construir el query en base a los datos dinámicos
    const query = `INSERT INTO ${table} (${fieldNames.join(', ')}) VALUES (${placeholders})`;
  
    connection.query(query, fieldValues, (err, result) => {
      if (err) {
        console.error('Error ejecutando siguiente query: ', err);
        res.status(500).json({ error: 'Error ejecutando query' });
        return;
      }
  
      // Creación exitosa de query
      res.status(201).json({ message: 'Registro creado exitosamente' });
    });
  });

app.delete('/:table/:id', (req, res) => {
    const {table, id} = req.params;
  
    // Eliminar sesion por id
    // Solo se elimina la sesión de la tabla sesiones y las demás tablas igual eliminan los registros
    const query = `DELETE FROM ${table} WHERE idSesion = ?`;
    connection.query(query, [id], (err, result) => {
        if (err) {
            console.error('Error ejecutando siguiente query: ', err);
            res.status(500).json({ error: 'Error ejecutando query' });
            return;
        }
  
      if (result.affectedRows === 0) {
        // Si no se afectaron filas, no existe esa id
        res.status(404).json({ error: 'Sesion no encontrada' });
        return;
      }
  
      // Sesion eliminada con éxito
      res.status(200).json({ message: 'Sesion eliminada exitosamente' });
    });
  });

app.patch('/:table/:id', (req, res) => {
    const {table, id} = req.params;
    const fieldsToUpdate = req.body;
  
    // Recibe dinámicamente campos que se actualizan de :table
    const setClause = Object.keys(fieldsToUpdate).map(field => `${field} = ?`).join(', ');
  
    // Combinamos los valores a actualizar
    const fieldValues = [...Object.values(fieldsToUpdate), id];

    // Construimos el query
    const query = `UPDATE ${table} SET ${setClause} WHERE idSesion = ?`;
  
    // Ejecuta el query para los campos correspondientes
    connection.query(query, fieldValues, (err, result) => {
      if (err) {
        console.error('Error ejecutando siguiente query: ', err);
        res.status(500).json({ error: 'Error ejecutando query' });
        return;
      }
  
      if (result.affectedRows === 0) {
        // Si no se afectaron filas, no existe esa id
        res.status(404).json({ error: 'Sesion no encontrada' });
        return;
      }
  
      // Sesion actualizada con éxito
      res.status(200).json({ message: 'Sesion actualizada exitosamente' });
    });
  });

app.listen(3000, () => {console.log("Server iniciado en 3000")})