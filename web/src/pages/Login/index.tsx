import React, { useState } from 'react'
import { useMutation } from '@apollo/client'
import { useHistory } from 'react-router-dom'
import { Container, Dimmer, Loader, Segment, Header } from 'semantic-ui-react'
import { FormikHelpers } from 'formik'

import validationSchema from './loginValidationSchema'
import LogInValues from '../../shared/loginValues.interface'
import LogInForm from './components/LoginForm'

import { loader } from 'graphql.macro';
const LOGIN_MUTATION = loader('./login_mutation.graphql');


export default function LogIn() {
    const [logIn, { loading, error }] = useMutation(LOGIN_MUTATION)
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
        history.push('/')
    }

    return (
        <>
            <Container style={{ margin: 'auto', height: '90vh', display: 'flex', flexDirection: 'column', justifyContent: 'center', width: '400px' }}>
                <Header as='h2' icon='pin' content='Login' />
                <Dimmer.Dimmable as={Segment} dimmed={loading}>
                    <Dimmer active={loading} inverted>
                        <Loader>Loading</Loader>
                    </Dimmer>
                    <LogInForm
                        initialValues={initialValues}
                        validationSchema={validationSchema}
                        onSubmit={onSubmit}
                    />
                </Dimmer.Dimmable>
            </Container>
        </>
    );
}
