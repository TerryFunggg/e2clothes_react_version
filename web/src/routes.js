import React from 'react'
import { BrowserRouter as Router, Route, Switch } from 'react-router-dom'

import Landing from './pages/Landing'
import NavBar from './components/NavBar'

export default function Routes() {
  return (
    <Router>
      <Switch>
        <NavBar>
          <Route path="/">
            <Landing />
          </Route>
        </NavBar>
      </Switch>
    </Router >
  )
}
