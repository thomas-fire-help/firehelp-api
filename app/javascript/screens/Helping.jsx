import React from 'react'
import styled from 'styled-components'
import Layout from '../components/Layout'
import { Container, HeaderContainer, External, Category } from '../components/atoms'

const Home = ({ history: { goBack }}) => (
  <Layout onBack={goBack}>
    <Container>
      <HeaderContainer>
        <h1>
          How can you help?
        </h1>
      </HeaderContainer>
      <External
        href="https://docs.google.com/spreadsheets/d/1miFPjSVhG8NR-tpieEH3Tu9cusCAesCSfr6ro1Nbd88/edit#gid=765665098"
        target="_blank"
      >
        I can provide food or water
      </External>
      <External
        href="https://docs.google.com/spreadsheets/d/1miFPjSVhG8NR-tpieEH3Tu9cusCAesCSfr6ro1Nbd88/edit#gid=427392080"
        target="_blank"
      >
        I can provide supplies
      </External>
      <Category to="/helping/housing">
        I can provide housing
      </Category>
      <External
        href="https://docs.google.com/spreadsheets/d/1miFPjSVhG8NR-tpieEH3Tu9cusCAesCSfr6ro1Nbd88/edit#gid=855993057"
        target="_blank"
      >
        I can provide animal services
      </External>
    </Container>
  </Layout>
)

export default Home
