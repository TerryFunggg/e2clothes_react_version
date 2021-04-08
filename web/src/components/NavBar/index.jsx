import React, { useState, useEffect, Children } from "react";
import { Link } from 'react-router-dom'

import SearchBox from './components/SearchBox'
import DropDownMenu from './components/DropDownMenu'

const NavBar = ({ children }) => {
  const [isOpen, setIsOpen] = useState(false)

  const toggleMenu = () => {
    setIsOpen(!isOpen)
  }

  useEffect(() => {
    const hidenMenu = () => {
      if (window.innerWidth > 768 && isOpen) {
        setIsOpen(false)
      }
    }

    window.addEventListener('resize', hidenMenu)

    return () => {
      window.removeEventListener('resize', hidenMenu)
    }

  })


  return (
    <>
      <nav className="flex flex-row py-2 px-1 md:py-5 md:justify-around justify-between items-center border-2">
        <div>
          <h1 className="inline-block md:text-2xl">
            e2clothes
          </h1>
        </div>

        <div className="md:hidden">
          <svg xmlns="http://www.w3.org/2000/svg" className="nav-icon" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
          </svg>
          <svg onClick={toggleMenu} xmlns="http://www.w3.org/2000/svg" className="nav-icon" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M4 6h16M4 12h16M4 18h16" />
          </svg>
        </div>

        <div className="hidden md:block">
          <SearchBox />
        </div>

        <div className="hidden md:block">
          <a className="p-4" href="">Login</a>
          <a className="p-4" href="">SigUp</a>
        </div>
      </nav>

      <DropDownMenu isOpen={isOpen} />

      {children}
    </>
  )
};

export default NavBar;
