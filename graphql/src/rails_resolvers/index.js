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
        },
        me: async (parent, args, { token }) => {
            console.log(token);
            const response = await fetch(`${baseURL}/me`, {
                method: "POST",
                mode: 'cors',
                headers: {
                    'Authorization': `Bearer ${token}`,
                    "Content-type": "application/json",
                    "Accept": "application/json",
                    "Accept-Charset": "utf-8"
                },
            });
            const user = await response.json()
            return user
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
        },
        logIn: async (_, args) => {
            const user = args.user;
            const data = await fetch(`${baseURL}/login`, {
                method: "POST",
                mode: 'cors',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(user)
            });
            const { token } = await data.json();
            return token;

        }
    }
}
