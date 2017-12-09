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

const SelectionContainer = styled.nav`
  flex: 4;
`

const NavigationCard = styled.section`
  margin-top: 20px;
  padding: 35px 15px;
  border: 1px solid black;
  text-transform: uppercase;
  text-align: center;
`

const Category = styled(Link)`
  color: #000;
  font-size: 20px;
  padding: 25px 0px;
  text-decoration: none;
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
        WHAT KIND OF HELP?
      </h1>
    </HeaderContainer>
    <Category to="/">
      FOOD & WATER
    </Category>
    <Category to="/">
      EMERGENCY SUPPLIES
    </Category>
    <Category to="/">
      CLOTHING
    </Category>
    <Category to="/">
      HOUSING
    </Category>
    <Category to="/">
      PERSONAL CARE ITEMS
    </Category>
    <Category to="/">
      ANIMAL SERVICES
    </Category>
    <Category to="/">
      HEALTH AND WELLNESS
    </Category>
  </Container>
)

export default Home
