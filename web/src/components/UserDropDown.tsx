import React from 'react'
import { Menu, Dropdown, Button, Image } from 'semantic-ui-react'


interface UserDropDownProps {
    user: User,
    style: React.CSSProperties
}

interface User {
    user_name: string,
    first_name: string,
    last_name: string
    avatar: string
}


export default function UserDropDown({ user, style }: UserDropDownProps) {

    const options = [
        {
            key: 'user',
            'text': (
                <span>
                    Hi,<strong>{`${user.first_name} ${user.last_name}`}</strong>
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
        <Dropdown style={style} options={options} trigger={(
            <span>
                <Image src={user.avatar} avatar /> {user.user_name}
            </span>
        )} />
    );
}
