import React from 'react'
import { Link } from 'react-router-dom'
import { useAppDispatch, useAppSelector } from '../hooks'
import { activeHome, activeMarket, selectNavItemActive } from '../reducers/navItemActive'
import { setIsLogged, selectIsLogged } from '../reducers/isLogged'
import { gql, useQuery } from '@apollo/client'

import UserDropDown from './UserDropDown'

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
    const isLoggedActive = useAppSelector(selectIsLogged)
    const dispatch = useAppDispatch();
    const { loading, error, data } = useQuery(ME_QUERY)

    if (error) console.log(error)

    return (
        <nav>
            <div>
                e2clothes
            </div>

            <a style={{ color: active == 'home' ? 'red' : '' }} onClick={() => dispatch(activeHome())} href="/">Home</a>
            <a style={{ color: active == 'market' ? 'red' : '' }} onClick={() => dispatch(activeHome())} href="/" > Market</a >

            <div>
                {data?.me ? (
                    <UserDropDown style={{ margin: '1rem' }} user={data?.me} />
                ) : (
                    <>
                        <a href="/logIn" >
                            <button style={{ marginRight: '1rem' }}>
                                Login
                            </button>
                        </a>
                        <a href="/signUp" >
                            <button color="blue">
                                SignUp
                            </button>
                        </a>
                    </>
                )}
            </div>
        </nav >
    );
}
