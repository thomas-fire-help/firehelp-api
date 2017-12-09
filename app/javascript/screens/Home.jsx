import React from 'react';
import styled from 'styled-components';

const HeaderContainer = styled.div`
  align-self: flex-start;
  flex: 1;
  text-transform: uppercase;
`

const NavContainer = styled.nav`
  flex: 3;
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

const Home = props => (
  <div>
    <HeaderContainer>
      <h1>
        Thomas Fire Help
      </h1>
    </HeaderContainer>
    <NavContainer>
      <NavigationCard>
        I Need Help
      </NavigationCard>
      <NavigationCard>
        I Want to Help
      </NavigationCard>
    </NavContainer>

    <TranslateLink>
      en Español
    </TranslateLink>

    <footer>
      In event of Emergency, call 911
    </footer>
  </div>
)

export default Home
