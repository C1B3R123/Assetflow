// frontend/src/App.js

import React from 'react';
import './App.css';
import AssetList from './components/AssetList'; // Importe o componente

function App() {
  return (
    <div className="App">
      <header className="App-header">
        <h1>AssetFlow - Gerenciamento de Ativos</h1>
      </header>
      <main>
        <p>Bem-vindo ao AssetFlow! Aqui você gerenciará seus ativos.</p>
        <AssetList /> {/* Adicione o componente de lista */}
      </main>
    </div>
  );
}

export default App;