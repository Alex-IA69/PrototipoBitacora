import React, { useState, useEffect } from 'react';
import axios from 'axios';

const App = () => {
  const handleGet = () => {
    axios.get('/sesiones')
      .then(response => {
        console.log(response.data);
      })
      .catch(error => {
        console.error(error);
      });
  };

  const handlePost = () => {
    const datetime = new Date(); // Fecha y Hora actual
    const postData = {
      cantParticipantes : 5,
      nombreAct : 'Actividad de Prueba',
      nombreEspacio : 'Espacio Meiquer',
      fecha : datetime.toISOString()
    };

    axios.post('/sesiones', postData)
      .then(response => {
        console.log(response.data);
      })
      .catch(error => {
        console.error(error);
      });
  };

  const handlePatch = () => {
    axios.patch('/sesiones/4')
      .then(response => {
        console.log(response.data);
      })
      .catch(error => {
        console.error(error);
      });
  };

  const handleDelete = () => {
    axios.delete('/sesiones/5')
      .then(response => {
        console.log(response.data);
      })
      .catch(error => {
        console.error(error);
      });
  };

  return (
    <div>
      <h1>API Buttons</h1>
      <button onClick={handleGet}>Get Data</button>
      <button onClick={handlePost}>Create Data</button>
      <button onClick={handlePatch}>Update Data</button>
      <button onClick={handleDelete}>Delete Data</button>
    </div>
  );
};

export default App;