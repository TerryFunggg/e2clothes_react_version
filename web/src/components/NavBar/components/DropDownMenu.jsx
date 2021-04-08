import React from "react";
import { Link } from 'react-router-dom'

const DropDownMenu = ({ isOpen }) => {
  return (
    <div className={isOpen ? "grid grid-rows-2 text-center items-center bg-gray-100" : 'hidden'} data-testid="navbar">
      <Link className="p-4 underline" to="/login" data-testid="login">LogIn</Link>
      <Link className="p-4" to="/signup" data-testid="signup">SignUp</Link>
    </div >
  )
};

export default DropDownMenu;
