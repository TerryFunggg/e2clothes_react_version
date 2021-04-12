import React from 'react';
import { BrowserRouter as Router, Route, Switch } from 'react-router-dom'
import Landing from './pages/Landing';

function App() {
  return (
    <Router>
      <Switch>
        <Route path="/">
          <Landing />
        </Route>
      </Switch>
    </Router>
  );
}

export default App;
