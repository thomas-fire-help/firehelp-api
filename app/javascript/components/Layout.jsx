import React from 'react'
import styled from 'styled-components'

const Header = styled.div`
  display: flex;
  align-items: center;
`

const Container = styled.section`
  height: 100%;
  width: 400px;
`

const LeftButton = styled.div`
  flex: 1;
  cursor: pointer;
`

const Title = styled.div`
  flex: 1;
  text-align: center;
`

const RightButton = styled.div`
  flex: 1;
`

const Body = styled.div`
  display: flex;
  flex-direction: column;
`

const Layout = ({ onBack, children }) => (
  <Container>
    <Header>
      <LeftButton onClick={onBack}>
        {'< Back'}
      </LeftButton>
      <Title>
        <h2>
          TFH
        </h2>
      </Title>
      <RightButton>

      </RightButton>
    </Header>
    <Body>
      {children}
    </Body>
  </Container>
)

export default Layout
