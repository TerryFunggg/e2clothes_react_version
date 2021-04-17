require('dotenv').config();
const fetch = require('node-fetch');
const { get, post } = require('../services/rails_api')
const { ApolloError } = require('apollo-server-errors');


module.exports = {
    Query: {
        users: async (parent, args, { token }) => {
            return await get('users', token)
                .catch(e => { throw new ApolloError(e) });
        },
        user: async (parent, args, { token }) => {
            return await get(`users/${args.id}`, token)
                .catch(e => { throw new ApolloError(e) });
        },
        me: async (parent, args, { token }) => {
            console.log(token);
            const user = await post(`me`, {}, token, false);
            if (!user.message) {
                console.log(user);
                return user
            }
            return {}
        }
    },

    Mutation: {
        signUp: async (_, args) => {
            const user = args.user;
            const data = await post(`signup`, user, '', false);
            console.log(data);
            if (data.auth_token) {
                return data.auth_token
            }
            throw new ApolloError(data.message)
        },
        logIn: async (_, args) => {
            const user = args.user;
            const data = await post(`login`, user, '', false);
            if (data.token) {
                return data.token;
            }
            throw new ApolloError(data.message, 401)
        }
    }
}
