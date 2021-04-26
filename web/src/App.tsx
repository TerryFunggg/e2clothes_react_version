import React from "react";
import Client from "./apollo_client";
import Routes from "./routes";
import { DialogProvider } from "./components/MyDialog/MyDialogContext";
import { AlertProvider } from "./components/MyAlert/MyAlertContext";

function App() {
  return (
    <Client>
      <DialogProvider>
        <AlertProvider>
          <Routes />
        </AlertProvider>
      </DialogProvider>
    </Client>
  );
}

export default App;
