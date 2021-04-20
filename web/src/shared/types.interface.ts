export interface LogInValues {
  email: string,
  password: string,
}

export interface SignUpValues extends LogInValues {
  email: string,
  user_name: string,
  first_name: string,
  last_name: string,
  password: string,
  phone: string,
  confirmPassword: string
}
