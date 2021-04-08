import React from "react";
import { Link } from 'react-router-dom'

const UserDropDownMenu = ({ isOpen }) => {
  return (
    <div className={isOpen ? "grid grid-rows-2 text-center items-center bg-gray-100" : 'hidden'}>
      <Link className="p-4 underline" to="/login">Login</Link>
      <Link className="p-4" to="/SignUp">SignUp</Link>
    </div >
  )
};

export default UserDropDownMenu;
