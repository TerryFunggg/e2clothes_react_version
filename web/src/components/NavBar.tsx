import React from 'react'
import { Menu, Dropdown, Button } from 'semantic-ui-react'
import { useAppDispatch, useAppSelector } from '../hooks'
import { activeHome, activeMarket, selectNavItemActive } from '../reducers/navItemActive'

export default function NavBar() {
    const active = useAppSelector(selectNavItemActive)
    const dispatch = useAppDispatch();

    return (
        <Menu size='large' stackable style={{ marginBottom: '0' }} >
            <Menu.Item>
                e2clothes
            </Menu.Item>

            <Menu.Item
                name='home'
                active={active === 'home'}
                onClick={() => dispatch(activeHome())}
            >
                Home
            </Menu.Item>

            <Menu.Item
                name='market'
                active={active === 'market'}
                onClick={() => dispatch(activeMarket())}
            >
                Market
            </Menu.Item>

            <Menu.Menu position="right">
                <Menu.Item>
                    <Button>Login</Button>
                </Menu.Item>

                <Dropdown item text="SignIn">
                    <Dropdown.Menu>
                        <Dropdown.Item>As User</Dropdown.Item>
                        <Dropdown.Item>As Shop</Dropdown.Item>
                    </Dropdown.Menu>
                </Dropdown>
            </Menu.Menu>
        </Menu>
    );
}
