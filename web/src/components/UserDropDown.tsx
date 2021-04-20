import React from 'react'
import { Link } from 'react-router-dom'


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
    return (
        <>
            <div>
                <img src={user.avatar} alt="" />
                <p>{user.user_name}</p>
                <ul>
                    <a href="/profile">Your Profile</a>
                </ul>
            </div>
        </>
    );
}
