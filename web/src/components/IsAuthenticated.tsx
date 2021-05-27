import React from "react";
import { gql, useQuery } from "@apollo/client";
import { Redirect } from "react-router";
import { setIsLogged } from "../reducers/isLogged";
import { useAppDispatch } from "../hooks";
/*
 * IsAuthenticated class use to check the user auth token
   and will set the isLogged to ture if token is valid
 * It will check every single times when user open the web application
 */

interface Props {
  children: React.ReactNode;
}

const ME_QUERY = gql`
  {
    me {
      id
      role
    }
  }
`;

export default function IsAuthenticated({ children }: Props) {
  const { loading, error, data } = useQuery(ME_QUERY);
  const dispatch = useAppDispatch();

  if (data) dispatch(setIsLogged(true));
  return <>{children}</>;
}
