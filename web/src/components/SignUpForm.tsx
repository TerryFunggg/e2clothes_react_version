import React from 'react'
import { Form, Input, Button } from 'formik-semantic-ui'
import { Form as SForm, Checkbox } from 'semantic-ui-react'
import { FormikHelpers } from 'formik';

import SignUpValues from '../shared/signUpValues.interface'


interface SignUpFormProps {
    initialValues: SignUpValues
    validationSchema: any
    onSubmit: (values: SignUpValues, formikHelpers: FormikHelpers<SignUpValues>) => Promise<void>
}

export default function SignUpForm({ initialValues, validationSchema, onSubmit }: SignUpFormProps) {
    return (

        <Form size='large'
            initialValues={initialValues}
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
            <Input label="Password" name="password" inputProps={{ type: "password" }} />
            <Input label="Confirm Password" name="confirmPassword" inputProps={{ type: "password" }} />
            <SForm.Field
                control={Checkbox}
                label={{ children: 'I agree to the Terms and Conditions' }}
            />
            <Form.Group style={{ display: 'flex', justifyContent: 'right' }}>
                <Button.Submit style={{ marginRight: '2rem' }}>SignUp</Button.Submit>
                <Button.Reset>Cancel</Button.Reset>
            </Form.Group>
        </Form>
    );
}
