import React from 'react'
import { Form, Input, Button } from 'formik-semantic-ui'
import { Form as SForm, Checkbox } from 'semantic-ui-react'
import { FormikHelpers } from 'formik';

import { LogInValues } from '../../../shared/types.interface'


interface SignUpFormProps {
    initialValues: LogInValues
    validationSchema: any
    onSubmit: (values: LogInValues, formikHelpers: FormikHelpers<LogInValues>) => Promise<void>
}

export default function SignUpForm({ initialValues, validationSchema, onSubmit }: SignUpFormProps) {
    return (

        <Form size='large'
            initialValues={initialValues}
            validationSchema={validationSchema}
            onSubmit={onSubmit}
        >
            <Input label="Email" name="email" />
            <Input label="Password" name="password" inputProps={{ type: "password" }} />
            <Form.Group style={{ display: 'flex', justifyContent: 'right' }}>
                <Button.Submit style={{ marginRight: '2rem' }}>SignUp</Button.Submit>
                <Button.Reset>Cancel</Button.Reset>
            </Form.Group>
        </Form>
    );
}
