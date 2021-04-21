import React from 'react';
import Client from './apollo_client';
import Routes from './routes'
import {DialogProvider} from './components/MyDialog/MyDialogContext'

function App() {
  return (
    <Client>
      <DialogProvider>
        <Routes />
      </DialogProvider>      
    </Client>
  );
}

export default App;
