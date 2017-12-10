import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'
import { Route, BrowserRouter } from 'react-router-dom'
import styled from 'styled-components'

const OuterContainer = styled.div`
display: flex;
flex-direction: row;
`

const InnerLeftContainer = styled.div`
display: flex;
flex-direction: column;
flex-basis: 50%;
justify-content: space-around;
background-color: #F7F7F7;
padding: 1rem;
`

const InnerRightContainer = styled.div`
display: flex;
flex-direction: column;
justify-content: space-between;
padding: 1rem;
flex-basis: 50%;
`

const CardItemTitle = styled.div`
font-size: 1.5rem;
font-weight: 800;
`

const DistanceAway = styled.div`
font-size: 0.5rem
font-weight: 800;
`

const AddressContainer = styled.div`
font-size: 0.75 rem;
`

const RightItemContainer = styled.div`
padding: 0.5rem 0rem;
`

const RightItemHeading = styled.div`
font-size: 0.5rem;
font-weight: 800;
color: #6D6D6D;
text-transform: uppercase;
padding-bottom: 0.25rem;
`

const RightItemText = styled.div`
font-size: 0.75rem;
`

const GeneralDescription = styled.div`
font-size: 0.75rem;
padding-top: 0.5rem;
`

const CardItem = props => (
<div>
<OuterContainer>
  <InnerLeftContainer>
    <CardItemTitle>
      Canned food & water
    </CardItemTitle>
    <AddressContainer>
      <DistanceAway>
        1.5 mi away
      </DistanceAway>
      <p>Attention to detail moving</p>
      <p>1151 Avenida Acaso</p>
    </AddressContainer>
  </InnerLeftContainer>

  <InnerRightContainer>
    <RightItemContainer>
      <RightItemHeading>
        pickup hours
      </RightItemHeading>
      <RightItemText>
        All day
      </RightItemText>
    </RightItemContainer>
    <RightItemContainer>
      <RightItemHeading>
        phone
      </RightItemHeading>
      <RightItemText>
        (800) 555-1212
      </RightItemText>
    </RightItemContainer>
    <RightItemContainer>
      <RightItemHeading>
        email
      </RightItemHeading>
      <RightItemText>
        email.address@gmail.com
      </RightItemText>
    </RightItemContainer>
    <RightItemContainer>
      <RightItemHeading>
        contact name
      </RightItemHeading>
      <RightItemText>
      First Last
      </RightItemText>
    </RightItemContainer>
    <GeneralDescription>
      General descrption here. Specific instructions for pickup may occupy this space in.
    </GeneralDescription>
    
    <Link to="/link_goes_here">
      <p>show on map</p>
    </Link>
  </InnerRightContainer>    
</OuterContainer>
</div>
)

export default CardItem