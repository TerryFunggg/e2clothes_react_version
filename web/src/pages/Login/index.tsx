import React, { useState, useContext } from "react";
import { useMutation, useApolloClient } from "@apollo/client";
import { useHistory } from "react-router-dom";
import { FormikHelpers } from "formik";
import validate from "./validate";
import { LogInValues } from "../../shared/types.interface";
import LogInForm from "./components/LoginForm";
import { AlertContext } from "../../components/MyAlert/MyAlertContext";

import { setIsLogged, selectIsLogged } from "../../reducers/isLogged";
import { useAppDispatch, useAppSelector } from "../../hooks";

import { loader } from "graphql.macro";
const LOGIN_MUTATION = loader("./login_mutation.graphql");

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
          user: values,
        },
      });
      localStorage.setItem("token", response.data.logIn);
      dispatch(setIsLogged(true));
      history.push("/");
    } catch (e) {
      handleAlert({ color: "red", message: e.message });
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
