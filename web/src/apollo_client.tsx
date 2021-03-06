import {
  ApolloClient,
  ApolloProvider,
  InMemoryCache,
  HttpLink,
} from "@apollo/client";
import { setContext } from "apollo-link-context";
import React from "react";

const httpLink = new HttpLink({ uri: "http://localhost:3000/graphql" });
const context = setContext(async (req, { headers }) => {
  return {
    ...headers,
    headers: {
      Authorization: localStorage.getItem("token") || "",
    },
  };
});

const link = context.concat(httpLink as any);
const client = new ApolloClient({
  link: link as any,
  cache: new InMemoryCache(),
});

interface ClientProps {
  children: React.ReactNode;
}

export default function Client({ children }: ClientProps) {
  return <ApolloProvider client={client}>{children}</ApolloProvider>;
}
