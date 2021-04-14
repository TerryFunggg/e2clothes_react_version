import React, { useState } from 'react'
import { gql, useMutation } from '@apollo/client'
import * as Yup from 'yup'
import { validateSchema } from 'graphql'
import { Link, useHistory } from 'react-router-dom'
import { Form, Input, Button } from 'formik-semantic-ui'
import { Container, Dimmer, Loader, Segment, Form as SForm, Checkbox, Header } from 'semantic-ui-react'
import { FormikHelpers } from 'formik'

import SignUpValues from '../shared/signUpValues.interface'
import SignUpForm from '../components/SignUpForm'

const SIGNUP_MUTATION = gql`
  mutation signUp($user: SignUpInput!){
    signUp(user: $user)
  }
`


export default function SignUp() {
    const [signUp, { loading, error }] = useMutation(SIGNUP_MUTATION)
    const history = useHistory();

    const initValue: SignUpValues = {
        email: '',
        phone: '',
        user_name: '',
        password: '',
        first_name: '',
        last_name: '',
        comfirmPassword: ''
    }

    const validationSchema = Yup.object({
        email: Yup.string().email('Invalid email address').required("Email Required"),
        user_name: Yup.string().max(15, "Must be 15 characters or less").required('User name Required'),
        first_name: Yup.string().max(20, 'Must be 20 characters or less').required("First name Required"),
        last_name: Yup.string().max(20, 'Must be 20 characters or less').required("Last name Required"),
        password: Yup.string().max(30, "Must be 30 characters or less").required('Password Required'),
        confirmPassword: Yup.string().oneOf([Yup.ref("password")], "Passwords must match"),
    })

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
            <Container style={{ margin: 'auto', height: '90vh', display: 'flex', flexDirection: 'column', justifyContent: 'center' }}>
                <Header as='h2' icon='pin' content='SignUp' />
                <Dimmer.Dimmable as={Segment} dimmed={loading}>
                    <Dimmer active={loading} inverted>
                        <Loader>Loading</Loader>
                    </Dimmer>
                    <SignUpForm
                        initialValues={initValue}
                        validationSchema={validationSchema}
                        onSubmit={onSubmit}
                    />
                </Dimmer.Dimmable>
            </Container>
        </>
    );
}
