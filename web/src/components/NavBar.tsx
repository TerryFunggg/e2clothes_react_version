import React from 'react'
import { Link } from 'react-router-dom'
import { Menu, Dropdown, Button, Image } from 'semantic-ui-react'
import { useAppDispatch, useAppSelector } from '../hooks'
import { activeHome, activeMarket, selectNavItemActive } from '../reducers/navItemActive'
import { gql, useQuery } from '@apollo/client'

const ME_QUERY = gql`
{
    me {
        user_name
        first_name
        last_name
        avatar
    }
}
`
// TODO: responsive for user dropdown menu
export default function NavBar() {
    const active = useAppSelector(selectNavItemActive)
    const dispatch = useAppDispatch();
    const { loading, error, data } = useQuery(ME_QUERY)

    if (loading) return (<p>Loading....</p>)
    if (error) console.log(error)

    const options = [
        {
            key: 'user',
            'text': (
                <span>
                    Hi,<strong>{data.me.user_name}</strong>
                </span>
            )
        },
        { key: 'profile', text: 'Your Profile' },
        { key: 'order', text: 'Your Order' },
        { key: 'stars', text: 'Your Stars' },
        { key: 'help', text: 'Help' },
        { key: 'sign-out', text: 'Sign Out' },
    ]

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
                {data.me.user_name ? (
                    <Dropdown style={{ margin: '1rem' }} options={options} trigger={(
                        <span>
                            <Image src={data.me.avatar} avatar /> {data.me.user_name}
                        </span>
                    )} />
                ) : (
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
                )}
            </Menu.Menu>
        </Menu >
    );
}
