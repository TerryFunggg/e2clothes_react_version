import React from 'react'
import { ErrorMessage, Field, Form, Formik, FormikHelpers } from 'formik'
import { LogInValues } from '../../../shared/types.interface'


interface SignUpFormProps {
    initialValues: LogInValues
    validationSchema: any
    onSubmit: (values: LogInValues, formikHelpers: FormikHelpers<LogInValues>) => Promise<void>
}

export default function SignUpForm({ initialValues, validationSchema, onSubmit }: SignUpFormProps) {
    return (
        <>
            <Formik
                initialValues={initialValues}
                validationSchema={validationSchema}
                onSubmit={onSubmit}
            >
                <Form>
                    <Field label="Email" name="email" />
                    <ErrorMessage name="email" component={'div'} />
                    <Field label="Password" name="password" />
                    <ErrorMessage name="password" component={'div'} />
                    <button type='submit'>Login</button>
                </Form>
            </Formik>
        </>
    );
}
