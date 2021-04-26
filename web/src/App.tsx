import React from "react";
import Client from "./apollo_client";
import Routes from "./routes";
import IsAuthenticated from "./components/IsAuthenticated";
import { DialogProvider } from "./components/MyDialog/MyDialogContext";

function App() {
  return (
    <Client>
      <IsAuthenticated>
        <DialogProvider>
          <Routes />
        </DialogProvider>
      </IsAuthenticated>
    </Client>
  );
}

export default App;
