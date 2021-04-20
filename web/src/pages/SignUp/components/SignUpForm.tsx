import React from 'react'
import { ErrorMessage, Field, Form, Formik, FormikHelpers } from 'formik'
import { SignUpValues } from '../../../shared/types.interface'


interface SignUpFormProps {
    initialValues: SignUpValues
    validationSchema: any
    onSubmit: (values: SignUpValues, formikHelpers: FormikHelpers<SignUpValues>) => Promise<void>
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
                    <Field label="User Name" name="user_name" />
                    <ErrorMessage name="user_name" component={'div'} />
                    <Field label="First Name" name="first_name" />
                    <ErrorMessage name="first_name" component={'div'} />
                    <Field label="Last Name" name="last_name" />
                    <ErrorMessage name="last_name" component={'div'} />
                    <Field label="Phone" name="Phone" />
                    <ErrorMessage name="Phone" component={'div'} />
                    <Field label="Password" name="password" />
                    <ErrorMessage name="password" component={'div'} />
                    <Field label="Confirm Password" name="confirm_password" />
                    <ErrorMessage name="confirm_password" component={'div'} />
                    <button type='submit'>SignUp</button>
                </Form>
            </Formik>
        </>
    );
}
