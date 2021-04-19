import * as React from 'react'
import { Admin, Resource, ListGuesser, EditGuesser, fetchUtils } from 'react-admin';
import jsonServerProvider from 'ra-data-json-server'
import authProvider from './authProvider'

import Dashboard from './Dashboard'

import AddressIcon from '@material-ui/icons/House'
import UserIcon from '@material-ui/icons/Group'

import {
  AddressCreate,
  AddressEdit,
  AddressList,
  UserList,
} from './components/index.js'

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
  return (
    <Admin dashboard={Dashboard} dataProvider={dataProvider} authProvider={authProvider}>
      <Resource name="users" list={UserList} icon={UserIcon} />
      <Resource name="addresses" list={AddressList} edit={AddressEdit} create={AddressCreate} icon={AddressIcon} />
    </Admin>
  );
}

export default App;
