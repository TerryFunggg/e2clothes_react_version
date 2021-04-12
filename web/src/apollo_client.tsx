import { ApolloClient, ApolloProvider, InMemoryCache, HttpLink } from '@apollo/client';
import { setContext } from 'apollo-link-context'
import React from 'react';

const httpLink = new HttpLink({ uri: 'http://localhost:4000' })
const context = setContext(async (req, { headers }) => {
    // TODO: get Token

    return {
        ...headers,
        headers: {

        }
    }
})

const client = new ApolloClient({
    link: (httpLink as any),
    cache: new InMemoryCache()
})

interface ClientProps {
    children: React.ReactNode
}

export default function Client({ children }: ClientProps) {
    return (
        <ApolloProvider client={client}>
            {children}
        </ApolloProvider>
    )
}
