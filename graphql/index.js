require('dotenv').config();
const { ApolloServer } = require('apollo-server');

const resolvers = require('./src/rails_resolvers');
const typeDefs = require('./src/schema');

const server = new ApolloServer({
    typeDefs,
    resolvers
});

server.listen().then(({ url }) => {
    console.log(`🚀  Server ready at ${url}`);
})
