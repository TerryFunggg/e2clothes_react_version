require('dotenv').config();
const fetch = require('node-fetch');

const baseURL = process.env.RAILS_URL
const baseApiURL = baseURL + '/api';

const fetchFromRails = (url) => {
    return new Promise((resolve, reject) => {
        fetch(`${baseApiURL}/${url}`)
            .then(res => resolve(res.json()))
            .catch(e => reject(e));
    })
}

module.exports = {
    Query: {
        users: async () => {
            return await fetchFromRails('users');
        },
        user: async (parent, args) => {
            return await fetchFromRails(`users/${args.id}`);
        }
    },

    Mutation: {
        signUp: async (_, args) => {
            const user = args.user;
            const data = await fetch(`${baseURL}/signup`, {
                method: "POST",
                mode: 'cors',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(user)
            });
            const token = await data.json();
            return token["auth_token"]
        }
    }
}
