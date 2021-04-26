interface Validate {
    email?:string,
    password?: string
}

const validate = (values: Validate) => {
    const errors:Validate = {};
  /* validating email using regex to pass email */
    if (!values.email) {
      errors.email = "Email address is required";
    } else if (!/^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i.test(values.email)) {
      errors.email = "Invalid email address";
    }
  
  /* validating passwords */
    if (!values.password) {
      errors.password = "Password is required";
    } else if (values.password.length < 6) {
      errors.password = "Password length is weak";
    }
    return errors;
  };
  
  export default validate;
  