import * as React from 'react'
import { Admin, Resource, ListGuesser, EditGuesser, fetchUtils } from 'react-admin';
import jsonServerProvider from 'ra-data-json-server'
import authProvider from './authProvider'

import Dashboard from './Dashboard'

import AddressIcon from '@material-ui/icons/House'
import UserIcon from '@material-ui/icons/Group'

import * as resources from './components/index.js'

const httpClient = (url, options = {}) => {
  if (!options.headers) {
    options.headers = new Headers({ Accept: 'application/json' });
  }
  // Get token if user login
  const token = localStorage.getItem('auth_token').toString()

  if (token) {
    options.headers.set('Authorization', `Bearer ${token}`);
  }
  return fetchUtils.fetchJson(url, options);
};

const dataProvider = jsonServerProvider('http://localhost:3000/api', httpClient)
function App() {
  // auto resources register
  const resourceComponents = []
  Object.keys(resources).map(resource => {
    // Get resource object which export from 'component/index.js', eg. users, addresses....
    const res = resources[resource];
    // Upper first letter, eg. users => Users
    const prefix = resource.charAt(0).toUpperCase() + resource.slice(1)
    // Get each resource jsx component, like UsersList, UserEdit....
    const [list, edit, create] = [res[`${prefix}List`], res[`${prefix}Edit`], res[`${prefix}Create`]]
    resourceComponents.push(<Resource key={resource} name={resource} list={list} edit={edit} create={create} />)
  })


  return (
    <Admin dashboard={Dashboard} dataProvider={dataProvider} authProvider={authProvider}>
      {(resourceComponents)}
    </Admin>
  );
}

export default App;
