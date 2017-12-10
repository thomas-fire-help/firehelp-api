// Run this example by adding <%= javascript_pack_tag 'hello_react' %> to the head of your layout file,
// like app/views/layouts/application.html.erb. All it does is render <div>App React</div> at the bottom
// of the page.

import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'
import { Route, BrowserRouter } from 'react-router-dom'
import Home from '../screens/Home'
import LookingForHelp from '../screens/LookingForHelp'
import Helping from '../screens/Helping'
import Housing from '../screens/Housing'

import styled from 'styled-components'

const AppContainer = styled.div`
  width: 100vw;
  height: 98vh;
  display: flex;
  justify-content: center;
  align-items: center;
  font-family: Montserrat, sans-serif;
`

const App = props => (
  <BrowserRouter>
    <AppContainer>
      <Route exact path="/" component={Home} />
      <Route exact path="/looking_for_help" component={LookingForHelp} />
      <Route exact path="/looking_for_help/housing" component={Housing} />
      <Route exact path="/helping" component={Helping} />
    </AppContainer>
  </BrowserRouter>
)

App.defaultProps = {
  name: 'David'
}

App.propTypes = {
  name: PropTypes.string
}

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <App />,
    document.body.appendChild(document.createElement('div')),
  )
})
