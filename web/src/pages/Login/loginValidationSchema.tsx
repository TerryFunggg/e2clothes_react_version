import { object, string, InferType } from 'yup'

export default object({
  email: string().email('Invalid email address').required("Email Required"),
  password: string().max(30, "Must be 30 characters or less").required('Password Required'),
})

//export type SignUpValues = InferType<typeof validationSchema>
