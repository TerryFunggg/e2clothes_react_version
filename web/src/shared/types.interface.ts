export type Modal = {
  title: string,
  description: string,
}

export interface LogInValues {
  email: string,
  password: string,
}

export interface SignUpValues extends LogInValues {
  user_name: string,
  first_name: string,
  last_name: string,
  phone: string,
  confirmPassword?: string
}


export interface ProfileValues extends LogInValues, SignUpValues { }
