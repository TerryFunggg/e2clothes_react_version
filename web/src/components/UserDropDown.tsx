import React, { Fragment, useState } from "react";
import { Link } from "react-router-dom";
import { Menu, Transition } from "@headlessui/react";
import { useAppDispatch, useAppSelector } from '../hooks'
import { showModal} from '../reducers/modalAction'
import MyDialog from "./MyDialog";

// import types
import {Modal as ModalType} from '../shared/types.interface';


interface UserDropDownProps {
  user: User;
  style?: React.CSSProperties;
}

interface User {
  user_name: string;
  first_name: string;
  last_name: string;
  avatar: string;
  role: string;
}

function classNames(...classes: string[]) {
  return classes.filter(Boolean).join(" ");
}

const modalContent: ModalType = {
  title: "Logout",
  description:"Are your sure?"
}

export default function UserDropDown({ user, style }: UserDropDownProps) {
  const dispatch = useAppDispatch();

  return (
    <>
      <Menu as="div" className="ml-3 relative">
        {({ open }) => (
          <>
            <div>
              <Menu.Button className="bg-gray-800 flex text-sm rounded-full focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-offset-gray-800 focus:ring-white">
                <span className="sr-only">Open user menu</span>
                <img
                  className="h-8 w-8 rounded-full"
                  src={user.avatar}
                  alt=""
                />
              </Menu.Button>
            </div>
            <Transition
              show={open}
              as={Fragment}
              enter="transition ease-out duration-100"
              enterFrom="transform opacity-0 scale-95"
              enterTo="transform opacity-100 scale-100"
              leave="transition ease-in duration-75"
              leaveFrom="transform opacity-100 scale-100"
              leaveTo="transform opacity-0 scale-95"
            >
              <Menu.Items
                static
                className="origin-top-right absolute right-0 mt-2 w-48 rounded-md shadow-lg py-1 bg-white ring-1 ring-black ring-opacity-5 focus:outline-none"
              >
                <Menu.Item>
                  <a href="#" className="block px-4 py-2 text-sm text-gray-700">
                    Hi, {user.user_name}
                  </a>
                </Menu.Item>
                <Menu.Item>
                  {({ active }) => (
                    <a
                      href="#"
                      className={classNames(
                        active ? "bg-gray-100" : "",
                        "block px-4 py-2 text-sm text-gray-700"
                      )}
                    >
                      Your Profile
                    </a>
                  )}
                </Menu.Item>
                <Menu.Item>
                  {({ active }) => (
                    <a
                      href="#"
                      className={classNames(
                        active ? "bg-gray-100" : "",
                        "block px-4 py-2 text-sm text-gray-700"
                      )}
                    >
                      Your Order
                    </a>
                  )}
                </Menu.Item>
                {user.role === "buyer" ? (
                  <Menu.Item>
                    {({ active }) => (
                      <a
                        href="#"
                        className={classNames(
                          active ? "bg-gray-100" : "",
                          "block px-4 py-2 text-sm text-gray-700"
                        )}
                      >
                        Apply Shop
                      </a>
                    )}
                  </Menu.Item>
                ) : (
                  ""
                )}
                <Menu.Item>
                  {({ active }) => (
                    <div
                      className={classNames(
                        active ? "bg-gray-100" : "",
                        "block px-4 py-2 text-sm text-gray-700 cursor-pointer"
                      )}
                      onClick={() => dispatch(showModal(modalContent))}
                    >
                      Sign out
                    </div>
                  )}
                </Menu.Item>
              </Menu.Items>
            </Transition>
          </>
        )}
      </Menu>
        <MyDialog
        okButtonClick={() => {
          
        }}
      />
      
    </>
  );
}
