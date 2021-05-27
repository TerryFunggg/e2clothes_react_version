import React, { useState, useContext } from "react";
import { gql, useMutation, useApolloClient } from "@apollo/client";
import { useHistory } from "react-router-dom";
import { FormikHelpers } from "formik";
import validate from "./validate";
import { LogInValues } from "../../shared/types.interface";
import LogInForm from "./components/LoginForm";
import { AlertContext } from "../../components/MyAlert/MyAlertContext";

import { setIsLogged, selectIsLogged } from "../../reducers/isLogged";
import { useAppDispatch, useAppSelector } from "../../hooks";

import { loader } from "graphql.macro";
//const LOGIN_MUTATION = loader("./login_mutation.graphql");

const LOGIN_MUTATION = gql`
  mutation($email: String!, $password: String!) {
    signInUser(input: { email: $email, password: $password }) {
      token
    }
  }
`;

export default function LogIn() {
  const [logIn, { loading, error }] = useMutation(LOGIN_MUTATION);
  const isLoggedSelector = useAppSelector(selectIsLogged);
  const dispatch = useAppDispatch();
  const client = useApolloClient();
  const { handleAlert } = useContext(AlertContext);
  const history = useHistory();

  const initialValues: LogInValues = {
    email: "",
    password: "",
  };

  const onSubmit = async (
    values: LogInValues,
    { setSubmitting }: FormikHelpers<LogInValues>
  ) => {
    setSubmitting(true);
    try {
      const response = await logIn({
        variables: {
          email: values.email,
          password: values.password,
        },
      });
      console.log(response);
      localStorage.setItem("token", response.data.signInUser.token);
      dispatch(setIsLogged(true));
      history.push("/");
    } catch (e) {
      console.log(e);
      handleAlert({
        color: "red",
        message: "Please check your email or password",
      });
    }
  };

  return (
    <div className="flex justify-center items-center h-screen">
      <div>
        <LogInForm
          initialValues={initialValues}
          validationSchema={validate}
          onSubmit={onSubmit}
        />
      </div>
    </div>
  );
}
