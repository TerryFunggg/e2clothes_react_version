import React, { useState } from 'react'
import { gql, useMutation } from '@apollo/client'
import * as Yup from 'yup'
import { validateSchema } from 'graphql'
import { Link, useHistory } from 'react-router-dom'
import { Form, Input, Button } from 'formik-semantic-ui'
import { Container, Dimmer, Loader, Segment, Form as SForm, Checkbox, Header } from 'semantic-ui-react'
import { FormikHelpers } from 'formik'

const SIGNUP_MUTATION = gql`
  mutation signUp($user: SignUpInput!){
    signUp(user: $user){
      token
    }
  }
`

interface SignUpValues {
    email: string,
    user_name: string,
    first_name: string,
    last_name: string,
    password: string,
    phone: string,
    comfirmPassword: string
}

export default function SignUp() {
    const [dimmerActive, setDimmerActive] = useState(false);
    const [signUp, { data }] = useMutation(SIGNUP_MUTATION)
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
        setDimmerActive(true)
        setTimeout(() => {
            setDimmerActive(false)
        }, 9000)
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
        setDimmerActive(false)
    }

    return (
        <>
            <Container style={{ margin: 'auto', height: '90vh', display: 'flex', flexDirection: 'column', justifyContent: 'center' }}>
                <Header as='h2' icon='pin' content='SignUp' />
                <Dimmer.Dimmable as={Segment} dimmed={dimmerActive}>
                    <Dimmer active={dimmerActive} inverted>
                        <Loader>Loading</Loader>
                    </Dimmer>
                    <Form size='large'
                        initialValues={initValue}
                        validationSchema={validationSchema}
                        onSubmit={onSubmit}
                    >
                        <Input label="Email" name="email" />
                        <Form.Group widths="equal">
                            <Input label="First Name" name="first_name" />
                            <Input label="Last Name" name="last_name" />
                        </Form.Group>
                        <Input label="User Name" name="user_name" />
                        <Input label="Phone" name="phone" />
                        <Input label="Password" name="password" />
                        <Input label="Confirm Password" name="confirmPassword" />
                        <SForm.Field
                            control={Checkbox}
                            label={{ children: 'I agree to the Terms and Conditions' }}
                        />
                        <Form.Group style={{ display: 'flex', justifyContent: 'right' }}>
                            <Button.Submit style={{ marginRight: '2rem' }}>SignUp</Button.Submit>
                            <Button.Reset>Cancel</Button.Reset>
                        </Form.Group>
                    </Form>
                </Dimmer.Dimmable>
            </Container>
        </>
    );
}
