require('dotenv').config();
const fetch = require('node-fetch');

const baseURL = process.env.RAILS_URL
const baseApiURL = baseURL + '/api';

const api = {}


api.get = (url, token) => {
  return new Promise((resolve, reject) => {
    fetch(`${baseApiURL}/${url}`, {
      method: "GET",
      mode: 'cors',
      headers: {
        'Authorization': token ? `Bearer ${token}` : '',
        "Content-type": "application/json",
        "Accept": "application/json",
        "Accept-Charset": "utf-8"
      },
    })
      .then(res => resolve(res.json()))
      .catch(e => reject(e));
  })
}


api.post = (url, body = {}, token, isApi = true) => {
  return new Promise((resolve, reject) => {
    fetch(isApi ? `${baseApiURL}/${url}` : `${baseURL}/${url}`, {
      method: "POST",
      mode: 'cors',
      headers: {
        'Authorization': token ? `Bearer ${token}` : '',
        "Content-type": "application/json",
        "Accept": "application/json",
        "Accept-Charset": "utf-8"
      },
      body: JSON.stringify(body)
    })
      .then(res => resolve(res.json()))
      .catch(e => reject(e));
  })
}

module.exports = api
