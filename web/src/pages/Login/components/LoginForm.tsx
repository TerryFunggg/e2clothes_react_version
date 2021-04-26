import React from "react";
import {
  FormikHelpers,
  useFormik,
} from "formik";
import { LogInValues } from "../../../shared/types.interface";

import validate from "../validate";

interface LoginFormProps {
  initialValues: LogInValues;
  validationSchema: any;
  onSubmit: (
    values: LogInValues,
    formikHelpers: FormikHelpers<LogInValues>
  ) => Promise<void>;
}

export default function LoginForm({
  initialValues,
  validationSchema,
  onSubmit,
}: LoginFormProps) {
  const formik = useFormik({
    initialValues,
    validate,
    onSubmit,
  });
  return (
    <form onSubmit={formik.handleSubmit}>
      <div className="container max-w-sm mx-auto flex-1 flex flex-col items-center justify-center px-2">
        <div className="bg-white px-6 py-8 rounded-md shadow-xl text-black w-full">
          <h1 className="text-gray-600 mb-8 text-3xl text-center tracking-wide p-2">
            Login
          </h1>
          {/* Input box && error text */}
          <div className="mb-4">
            <input
              type="text"
              className="block border border-grey-light w-full p-3 rounded focus:outline-none focus:ring-2 focus:ring-green-400"
              placeholder="Email"
              name="email"
              onChange={formik.handleChange}   
            />
            {formik.touched.email && formik.errors.email ? (
              <span className="inline p-2 text-sm text-red-400">
                <svg
                  xmlns="http://www.w3.org/2000/svg"
                  className="h-5 w-5 inline"
                  fill="none"
                  viewBox="0 0 24 24"
                  stroke="currentColor"
                >
                  <path
                    strokeLinecap="round"
                    strokeLinejoin="round"
                    strokeWidth={2}
                    d="M6 18L18 6M6 6l12 12"
                  />
                </svg>
                {formik.errors.email}
              </span>
            ) : null}
          </div>

          {/* Input box && error text */}
          <div className="mb-4">
                        <input
              type="password"
              className="block border border-grey-light w-full p-3 rounded mb-4 focus:outline-none focus:ring-2 focus:ring-green-400"
              placeholder="Password"
              name="password"
              onChange={formik.handleChange}              
            />
            {formik.touched.password && formik.errors.password ? (
              <span className="inline p-2 text-sm text-red-400">
                <svg
                  xmlns="http://www.w3.org/2000/svg"
                  className="h-5 w-5 inline"
                  fill="none"
                  viewBox="0 0 24 24"
                  stroke="currentColor"
                >
                  <path
                    strokeLinecap="round"
                    strokeLinejoin="round"
                    strokeWidth={2}
                    d="M6 18L18 6M6 6l12 12"
                  />
                </svg>
                {formik.errors.password}
              </span>
            ) : null}
          </div>

          <button
            type="submit"
            className="w-full text-center font-bold tracking-wider  py-3 rounded-lg bg-green-600 text-white hover:bg-green-dark focus:outline-none my-1 transition ease-out duration-300 hover:bg-green-400"
          >
            Login
          </button>
        </div>

        <div className="text-grey-dark mt-10">
          No account?
          <a
            className="mx-2 no-underline border-b border-blue text-blue hover:text-green-600"
            href="/signup"
          >
            SignUp
          </a>
        </div>
      </div>
    </form>
  );
}
