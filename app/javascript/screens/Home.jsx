import React from 'react'
import { Link } from 'react-router-dom'
import styled from 'styled-components'

const Container = styled.div`
  display: flex;
  flex-direction: column;
  height: 90%;
`

const HeaderContainer = styled.div`
  align-self: flex-start;
  flex: 1;
  text-transform: uppercase;
  font-size: 2rem;
`

const NavContainer = styled.nav`
  flex: 4;
`
const activeClassName = 'nav-item-active'

const StyledLink = styled(Link).attrs({
  activeClassName
})`
  text-decoration: none;
`

const NavigationCard = styled.section`
  margin-top: 20px;
  padding: 4rem 6em;
  border: 1px solid black;
  text-transform: uppercase;
  text-align: center;
  font-size: 2rem;
  color: black;
  text-decoration: none;
  box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.2), 0 1px 3px 0 rgba(0, 0, 0, 0.1);
  transition: box-shadow 0.2s ease-in-out;
  &:hover {
    box-shadow: 0 3px 6px 0 rgba(0, 0, 0, 0.23), 0 3px 6px 0 rgba(0, 0, 0, 0.16);
  }
`


const TranslateLink = styled.aside`
  display: block;
  text-align: center;
  padding: 35px 15px;
`

const Footer = styled.footer`
  text-align: center;
`

const Home = props => (
  <Container>
    <HeaderContainer>
      <h1>
        Thomas Fire Help
      </h1>
    </HeaderContainer>
    <NavContainer>
      <StyledLink to="/looking_for_help">
        <NavigationCard>
          I Need Help
        </NavigationCard>
      </StyledLink>
      <StyledLink to="/helping">
        <NavigationCard>
          I Want to Help
        </NavigationCard>
      </StyledLink>
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
