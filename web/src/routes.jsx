import { BrowserRouter as Router, Route, Switch } from 'react-router-dom'
import Landing from './pages/Landing';
import SignUpUser from './pages/SignUpUser';

function Routes() {
  return (
    <Router>
      <Switch>
        <Route path="/signin/user">
          <SignUpUser />
        </Route>
        <Route path="/">
          <Landing />
        </Route>
      </Switch>
    </Router>
  );
}

export default Routes;
