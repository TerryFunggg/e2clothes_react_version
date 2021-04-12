import React from 'react';
import Client from './apollo_client';
import Routes from './routes'

function App() {
  return (
    <Client>
      <Routes />
    </Client>
  );
}

export default App;
