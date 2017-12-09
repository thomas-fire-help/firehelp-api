import React from 'react'
import { Link } from 'react-router-dom'
import styled from 'styled-components'

const Container = styled.div`
  display: flex;
  flex-direction: column;
`

const HeaderContainer = styled.div`
  align-self: flex-start;
  flex: 1;
  text-transform: uppercase;
`

const NavContainer = styled.nav`
  flex: 4;
`

const NavigationCard = styled.section`
  margin-top: 20px;
  padding: 35px 15px;
  border: 1px solid black;
  text-transform: uppercase;
  text-align: center;
`

const TranslateLink = styled.aside`
  display: block;
  text-align: center;
  padding: 35px 15px;
`

const Footer = styled.footer`
  text-align: center;
`

const AuthContainer = styled.div`
  display: flex;
  justify-content: space-between;
  width: 100%;
`

const AuthLink = styled(Link)`
  font-weight: bold;
  padding: 15px 20px;
  margin-top: 30px;
  margin: 30px 15px;
  color: #000;
  font-size: 1.1rem;
  text-decoration: none;
`

const Home = props => (
  <Container>
    <HeaderContainer>
      <h1>
        Thomas Fire Help
      </h1>
    </HeaderContainer>
    <NavContainer>
      <Link to="/looking_for_help">
        <NavigationCard>
          I Need Help
        </NavigationCard>
      </Link>
      <Link to="/helping">
        <NavigationCard>
          I Want to Help
        </NavigationCard>
      </Link>
      <AuthContainer>
        <AuthLink to="/login">
          LOGIN
        </AuthLink>
        <AuthLink to="/signup">
          SIGN UP
        </AuthLink>
      </AuthContainer>
    </NavContainer>

    <TranslateLink>
      en Español
    </TranslateLink>

    <Footer>
      In event of Emergency, call 911
    </Footer>
  </Container>
)

export default Home
