import React, { useState } from 'react'
import { useMutation } from '@apollo/client'
import { useHistory } from 'react-router-dom'
import { FormikHelpers } from 'formik'

import validationSchema from './signUpValidationSchema'
import { SignUpValues } from '../../shared/types.interface'
import SignUpForm from './components/SignUpForm'

import { loader } from 'graphql.macro';
const SIGNUP_MUTATION = loader('./signup_mutation.graphql');


export default function SignUp() {
    const [signUp, { loading, error }] = useMutation(SIGNUP_MUTATION)
    const history = useHistory();


    const initialValues: SignUpValues = {
        user_name: '',
        first_name: '',
        last_name: '',
        email: '',
        phone: '',
        password: '',
        confirmPassword: ""
    }

    const onSubmit = async (values: SignUpValues, { setSubmitting }: FormikHelpers<SignUpValues>) => {
        setSubmitting(true)
        const response = await signUp({
            variables: {
                user: {
                    email: values.email,
                    first_name: values.first_name,
                    last_name: values.last_name,
                    user_name: values.user_name,
                    phone: values.phone,
                    password: values.password,
                }
            }
        })
        localStorage.setItem('token', response.data.signUp)
        history.push('/')
    }

    return (
        <>

            <h2>SignUp</h2>
            {error ? (<p>Please check your info</p>) : ''}
            <SignUpForm
                initialValues={initialValues}
                validationSchema={validationSchema}
                onSubmit={onSubmit}
            />
        </>
    );
}
