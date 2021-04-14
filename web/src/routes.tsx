import { BrowserRouter as Router, Route, Switch } from 'react-router-dom'
import Landing from './pages/Landing';
import SignUp from './pages/SignUp/';
import LogIn from './pages/Login/'

function Routes() {
  return (
    <Router>
      <Switch>
        <Route path="/signUp">
          <SignUp />
        </Route>
        <Route path="/logIn">
          <LogIn />
        </Route>
        <Route path="/">
          <Landing />
        </Route>
      </Switch>
    </Router>
  );
}

export default Routes;
