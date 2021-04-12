import { url } from 'node:inspector'
import React from 'react'
import { Container, Header, Icon, Segment, Image } from 'semantic-ui-react'
import NavBar from '../components/NavBar'
import RecommandArea from '../components/RecommandArea'

export default class Landing extends React.Component {
    render() {
        return (
            <>
                <NavBar />
                <Segment
                    inverted
                    textAlign='center'
                    style={{
                        minHeight: 700,
                        padding: '1em',
                        backgroundImage: 'url("https://react.semantic-ui.com/images/wireframe/image.png")',
                        backgroundSize: 'cover',
                        backgroundPosition: 'center',
                        backgroundRepeat: 'no-repeat'
                    }}
                    vertical
                >
                    <Container text>
                        <Header
                            as='h1'
                            content="Lorme sdasd sdasasdaj klsada"
                            inverted
                            style={{
                                fontSize: '4em',
                                fontWeight: 'normal',
                                marginBottom: 0,
                                marginTop: '3em',
                            }}
                        />
                        <Header
                            as='h2'
                            content='Do whatever you want when you want to.'
                            inverted
                            style={{
                                fontSize: '1.7em',
                                fontWeight: 'normal',
                                marginTop: '1.5em',
                            }}
                        />
                    </Container>
                </Segment>

                <Header as="h2" textAlign="center">
                    Recommand for you
                </Header>

                <RecommandArea style={{ padding: '2rem' }} />
            </>
        )
    }
}
