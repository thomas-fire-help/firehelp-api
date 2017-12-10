import React from 'react'
import { Link } from 'react-router-dom'
import styled from 'styled-components'
import Layout from '../components/Layout'
import { Container, HeaderContainer, External, Category } from '../components/atoms'

const Home = ({ history: { goBack }}) => (
  <Layout onBack={goBack}>
    <Container>
      <HeaderContainer>
        <h1>
          What kind of help?
        </h1>
      </HeaderContainer>
      <External
        href="https://docs.google.com/spreadsheets/d/1miFPjSVhG8NR-tpieEH3Tu9cusCAesCSfr6ro1Nbd88/edit#gid=765665098"
        target="_blank"
      >
        I need food or water
      </External>
      <External
        href="https://docs.google.com/spreadsheets/d/1miFPjSVhG8NR-tpieEH3Tu9cusCAesCSfr6ro1Nbd88/edit#gid=427392080"
        target="_blank"
      >
        I want to pick up supplies
      </External>
      <Category to="/looking_for_help/housing">
        I need housing
      </Category>
      <External
        href="https://docs.google.com/spreadsheets/d/1miFPjSVhG8NR-tpieEH3Tu9cusCAesCSfr6ro1Nbd88/edit#gid=855993057"
        target="_blank"
      >
        I need help with my animals
      </External>
    </Container>
  </Layout>
)

export default Home
