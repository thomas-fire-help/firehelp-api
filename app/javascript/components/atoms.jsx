import styled from 'styled-components'
import { Link } from 'react-router-dom'

export const Container = styled.div`
  display: flex;
  flex-direction: column;
`

export const HeaderContainer = styled.div`
  align-self: flex-start;
  flex: 1;
  font-size: 2.25rem;
  padding: 1.25em 0;
`

export const NavigationCard = styled.section`
  margin-top: 20px;
  padding: 35px 15px;
  border: 1px solid black;
  text-transform: uppercase;
  text-align: center;
`

export const Category = styled(Link)`
  color: #000;
  font-size: 2rem;
  padding: 25px 25px;
  text-decoration: none;
  margin-bottom: 1.5rem;

  box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.2), 0 1px 3px 0 rgba(0, 0, 0, 0.1);
  transition: box-shadow 0.2s ease-in-out;
  &:hover {
    box-shadow: 0 3px 6px 0 rgba(0, 0, 0, 0.23), 0 3px 6px 0 rgba(0, 0, 0, 0.16);
  }
`

export const External = styled.a`
  color: #000;
  font-size: 2rem;
  padding: 25px 25px;
  text-decoration: none;
  margin-bottom: 1.5rem;

  box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.2), 0 1px 3px 0 rgba(0, 0, 0, 0.1);
  transition: box-shadow 0.2s ease-in-out;
  &:hover {
    box-shadow: 0 3px 6px 0 rgba(0, 0, 0, 0.23), 0 3px 6px 0 rgba(0, 0, 0, 0.16);
  }
`

export const Footer = styled.footer`
  text-align: center;
`
