// frontend/src/components/AssetList.js

import React, { useState, useEffect } from 'react';
import axios from 'axios';

// Obtenha o URL base da API da variável de ambiente
const API_BASE_URL = process.env.REACT_APP_API_BASE_URL;

function AssetList() {
  const [assets, setAssets] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    const fetchAssets = async () => {
      try {
        const response = await axios.get(`${API_BASE_URL}/assets`); // Usar a variável de ambiente
        setAssets(response.data);
      } catch (err) {
        setError(err);
      } finally {
        setLoading(false);
      }
    };

    fetchAssets();
  }, []);

  // ... (o restante do componente AssetList) ...
}

export default AssetList;