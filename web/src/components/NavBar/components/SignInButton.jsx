import React, { useState, useEffect, Children } from "react";
import { Link } from 'react-router-dom'
import { Menu, Transition } from '@headlessui/react'

const SignInButton = ({ }) => {
  return (
    <div className="relative inline-block text-left">
      <Menu>
        {({ open }) => (
          <>
            <span className="rounded-md shadow-sm">
              <Menu.Button className="nav-btn inline-flex justify-center w-full px-4 py-2 font-medium leading-5 bg-white border border-gray-300 rounded-md  ">
                <span>Sign In</span>
                <svg
                  className="w-5 h-5 ml-2 -mr-1"
                  viewBox="0 0 20 20"
                  fill="currentColor"
                >
                  <path
                    fillRule="evenodd"
                    d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z"
                    clipRule="evenodd"
                  />
                </svg>
              </Menu.Button>
            </span>

            <Transition
              show={open}
              enter="transition ease-out duration-150"
              enterFrom="transform opacity-0 scale-75"
              enterTo="transform opacity-100 scale-100"
              leave="transition ease-in duration-75"
              leaveFrom="transform opacity-100 scale-100"
              leaveTo="transform opacity-0 scale-75"
            >
              <Menu.Items
                static
                className="absolute right-0 w-56 mt-2 origin-top-right bg-white border border-gray-200 divide-y divide-gray-100 rounded-md shadow-lg outline-none"
              >
                <div className="py-1">
                  <Menu.Item>
                    {({ active }) => (
                      <a
                        href="#asuser"
                        className={`${active
                          ? "bg-gray-100 text-gray-900"
                          : "text-gray-700"
                          } block w-full px-4 py-2 text-sm leading-5 text-left`}
                      >
                        As User
                      </a>
                    )}
                  </Menu.Item>
                  <Menu.Item>
                    {({ active }) => (
                      <a
                        href="#asshop"
                        className={`${active
                          ? "bg-gray-100 text-gray-900"
                          : "text-gray-700"
                          } block w-full px-4 py-2 text-sm leading-5 text-left`}
                      >
                        As Shop
                      </a>
                    )}
                  </Menu.Item>
                </div>
              </Menu.Items>
            </Transition>
          </>
        )}
      </Menu>
    </div>
  )
};

export default SignInButton;
