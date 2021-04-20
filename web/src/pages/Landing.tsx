import React from 'react'
import NavBar from '../components/NavBar'
import RecommandArea from '../components/RecommandArea'

export default class Landing extends React.Component {
    render() {
        return (
            <>
                <NavBar />
                <h2>
                    Recommand for you
                </h2>

                <RecommandArea style={{ padding: '2rem' }} />
            </>
        )
    }
}
