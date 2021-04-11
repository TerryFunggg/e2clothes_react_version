require('dotenv').config();
const fetch = require('node-fetch');

const baseURL = process.env.RAILS_URL + '/api';

const fetchFromRails = (url) => {
    return new Promise((resolve, reject) =>{
        fetch(`${baseURL}/${url}`)
        .then(res => resolve(res.json()))
        .catch(e => reject(e));
    })
}

module.exports = {
    Query:{
        users: async () => {
            return await fetchFromRails('users');
        }, 
        user: async (parent, args) => {
            return await fetchFromRails(`users/${args.id}`);
        }
    }
}