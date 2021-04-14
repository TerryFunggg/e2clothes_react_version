import React from 'react'
import { Link } from 'react-router-dom'
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
                    <Link to="logIn" >
                        <Button style={{ marginRight: '1rem' }}>
                            Login
                        </Button>
                    </Link>
                    <Link to="signUp" >
                        <Button color="blue">
                            SignUp
                    </Button>
                    </Link>
                </Menu.Item>
            </Menu.Menu>
        </Menu>
    );
}
