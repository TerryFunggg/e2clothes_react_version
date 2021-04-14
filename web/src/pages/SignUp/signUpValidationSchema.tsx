import { object, string, InferType } from 'yup'

export default object({
  email: string().email('Invalid email address').required("Email Required"),
  user_name: string().max(20, "Must be 15 characters or less").required('User name Required'),
  first_name: string().max(20, 'Must be 20 characters or less').required("First name Required"),
  last_name: string().max(20, 'Must be 20 characters or less').required("Last name Required"),
  phone: string().max(20, 'Must be 20 characters or less').required("Phone Required"),
  password: string().max(30, "Must be 30 characters or less").required('Password Required'),
  confirmPassword: string().test('passwords-match', 'Passwords must match', function(value?: string | null) {
    return this.parent.password === value
  }).required()
})

//export type SignUpValues = InferType<typeof validationSchema>
