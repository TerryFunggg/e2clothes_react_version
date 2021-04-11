const {gql} = require('apollo-server');

module.exports = gql`
type Query {
    users:[User!]!
    user(id:ID!):User
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
`