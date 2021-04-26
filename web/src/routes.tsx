import { BrowserRouter as Router, Route, Switch } from "react-router-dom";
import IsAuthenticated from "./components/IsAuthenticated";
import Landing from "./pages/Landing";
import SignUp from "./pages/SignUp/";
import LogIn from "./pages/Login/";

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
        <IsAuthenticated>
          <Route path="/">
            <Landing />
          </Route>
        </IsAuthenticated>
      </Switch>
    </Router>
  );
}

export default Routes;
