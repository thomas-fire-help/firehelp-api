import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'
import { Route, BrowserRouter } from 'react-router-dom'
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

const CardItemContainer = styled.div`
display: flex;
flex-direction: row;
`

const CardItemLeftContainer = styled.div`
display: flex;
flex-direction: column;
justify-content: space-between;
background-color: #F7F7F7;
padding: 1rem;
`

const CardItemRightContainer = styled.div`
padding: 1rem;
`

const CardItemTitle = styled.div`
font-size: 2rem;
font-weight: 800;
`

const CardItemDistanceAway = styled.div`
font-weight: 800;
`

const CardItemAddress = styled.div`
`

const PickupHoursContainer = styled.div`

`

const PickupHoursTitle = styled.div`
font-size: 0.75rem;
font-weight: 800;
color: #6D6D6D;
text-transform: uppercase;
padding-bottom: 0.25rem;
`

const PickupHours = styled.div`
font-size: 1rem;
`

const PhoneContainer = styled.div`
`

const PhoneTitle = styled.div`
font-size: 0.75rem;
font-weight: 800;
color: #6D6D6D;
text-transform: uppercase;
padding-bottom: 0.25rem;
`

const PhoneNumber = styled.div`
font-size: 1rem;
`

const EmailContainer = styled.div`
font-size: 1rem;
`

const EmailTitle = styled.div`
font-size: 0.75rem;
font-weight: 800;
color: #6D6D6D;
text-transform: uppercase;
padding-bottom: 0.25rem;
`

const EmailAddress = styled.div`
`

const CardItem = props => (
<div>
  <CardItemContainer>
    <CardItemLeftContainer>
      <CardItemTitle>
        Canned food & water
      </CardItemTitle>
      <CardItemDistanceAway>
        1.5 mi away
      </CardItemDistanceAway>

      <CardItemAddress>
        <p>Attention to detail moving</p>
        <p>1151 Avenida Acaso</p>
      </CardItemAddress>
    </CardItemLeftContainer>

    <CardItemRightContainer>
      <PickupHoursContainer>
        <PickupHoursTitle>
          pickup hours
        </PickupHoursTitle>
        <PickupHours>
          All day
        </PickupHours>
      </PickupHoursContainer>
      <PhoneContainer>
        <PhoneTitle>
          phone
        </PhoneTitle>
        <PhoneNumber>
          (800) 555-1212
        </PhoneNumber>
      </PhoneContainer>
      <EmailContainer>
        <EmailTitle>
          email
        </EmailTitle>
        <EmailAddress>
          email.address@gmail.com
        </EmailAddress>
      </EmailContainer>

      <h6>contact name</h6>
      <p>First Last</p>

      <h6>general description</h6>
      <p>general description here</p>
      
      <Link to="/link_goes_here">
        <p>show on map</p>
      </Link>
    </CardItemRightContainer>    
  </CardItemContainer>
</div>
)

export default CardItem