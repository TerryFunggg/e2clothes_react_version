import React, { useState } from 'react'
import { Menu, Dropdown, Button } from 'semantic-ui-react'

export default function NavBar() {
    const [active, setActive] = useState('home');

    const activeItem = (name: string) => setActive(name)

    return (
        <Menu size='large' stackable style={{ marginBottom: '0' }} >
            <Menu.Item>
                e2clothes
            </Menu.Item>

            <Menu.Item
                name='home'
                active={active === 'home'}
                onClick={() => activeItem('home')}
            >
                Home
            </Menu.Item>

            <Menu.Item
                name='market'
                active={active === 'market'}
                onClick={() => activeItem('market')}
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
