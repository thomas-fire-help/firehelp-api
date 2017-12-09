import React from 'react'
import { Link } from 'react-router-dom'
import styled from 'styled-components'
import Layout from '../components/Layout'

const Container = styled.div`
  display: flex;
  flex-direction: column;
`

const HeaderContainer = styled.div`
  align-self: flex-start;
  flex: 1;
  text-transform: uppercase;
  font-size: 2.25rem;
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
  font-size: 2rem;
  padding: 25px 25px;
  text-decoration: none;
  margin-bottom: 1rem;

  box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.2), 0 1px 3px 0 rgba(0, 0, 0, 0.1);
  transition: box-shadow 0.2s ease-in-out;
  &:hover {
    box-shadow: 0 3px 6px 0 rgba(0, 0, 0, 0.23), 0 3px 6px 0 rgba(0, 0, 0, 0.16);
  }
`

const Footer = styled.footer`
  text-align: center;
`

const Home = ({ history: { goBack }}) => (
  <Layout onBack={goBack}>
    <Container>
      <HeaderContainer>
        <h1>
          WHAT KIND OF HELP?
        </h1>
      </HeaderContainer>
      <Category to="looking_for_help/food_and_water">
        FOOD & WATER
      </Category>
      <Category to="/">
        EMERGENCY SUPPLIES
      </Category>
      <Category to="/">
        CLOTHING
      </Category>
      <Category to="/shelter">
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
  </Layout>
)

export default Home
