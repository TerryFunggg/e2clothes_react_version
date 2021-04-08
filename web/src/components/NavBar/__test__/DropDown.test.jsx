import React from 'react';
import { MemoryRouter as Router } from 'react-router-dom';
import { cleanup, render } from '@testing-library/react'
import "@testing-library/jest-dom/extend-expect"

import DropDown from '../components/DropDownMenu';

let getByIdNavIsOpen;

beforeEach(()=>{
  const navbarIsActive = render(<Router><DropDown isOpen={true} /></Router>)
  getByIdNavIsOpen = navbarIsActive.getByTestId
})

describe('DropDown', () => {
  test('must have login entry when dropdown is active ', () => {
    expect(getByIdNavIsOpen('login').textContent).toBe("LogIn")
  });

  test('must have signup entry when dropdown is active', () => {
    expect(getByIdNavIsOpen('signup').textContent).toBe("SignUp")
  });

  test('when dropdown is hidden', () => {
    cleanup()
    const component = render(<Router><DropDown isOpen={false} /></Router>)
    const navbar = component.getByTestId('navbar')    
    expect(navbar).toHaveClass('hidden')
  });
});
