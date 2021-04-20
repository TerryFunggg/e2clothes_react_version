import React, { useState } from 'react'
import { useMutation, useApolloClient } from '@apollo/client'
import { useHistory } from 'react-router-dom'
import { FormikHelpers } from 'formik'

import validationSchema from './loginValidationSchema'
import { LogInValues } from '../../shared/types.interface'
import LogInForm from './components/LoginForm'

import { setIsLogged, selectIsLogged } from '../../reducers/isLogged'
import { useAppDispatch, useAppSelector } from '../../hooks'

import { loader } from 'graphql.macro';
const LOGIN_MUTATION = loader('./login_mutation.graphql');


export default function LogIn() {
    const [logIn, { loading, error }] = useMutation(LOGIN_MUTATION)
    const isLoggedSelector = useAppSelector(selectIsLogged);
    const dispatch = useAppDispatch();
    const client = useApolloClient()
    const history = useHistory();


    const initialValues: LogInValues = {
        email: '',
        password: '',
    }

    const onSubmit = async (values: LogInValues, { setSubmitting }: FormikHelpers<LogInValues>) => {
        setSubmitting(true)
        const response = await logIn({
            variables: {
                user: values
            }
        })
        localStorage.setItem('token', response.data.logIn)
        dispatch(setIsLogged(true))
        history.push('/')
    }


    return (
        <>
            <h2>Login</h2>
            {error ? (<p>Please check you email and password</p>) : ''}
            <LogInForm
                initialValues={initialValues}
                validationSchema={validationSchema}
                onSubmit={onSubmit}
            />
        </>
    );
}
