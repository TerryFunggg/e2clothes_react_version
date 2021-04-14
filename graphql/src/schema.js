const { gql } = require('apollo-server');

module.exports = gql`
type Query {
    users:[User!]!
    user(id:ID!):User
    me:User
}

type Mutation {
    signUp(user: SignUpInput!): String!
    logIn(user: LogInInput!): String!
}

type User {
    id: ID
    first_name: String
    last_name: String
    user_name: String
    email: String
    phone: String
    role: String
    avatar: String
}

input SignUpInput {
    email: String!
    user_name: String!
    first_name: String!
    last_name: String!
    password: String!
    phone: String!
}

input LogInInput {
    email: String!
    password: String!
}
`
