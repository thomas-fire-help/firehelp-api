// Run this example by adding <%= javascript_pack_tag 'hello_react' %> to the head of your layout file,
// like app/views/layouts/application.html.erb. All it does is render <div>App React</div> at the bottom
// of the page.

import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'
import { Route, BrowserRouter } from 'react-router-dom'
import Home from '../screens/Home'

const App = props => (
  <BrowserRouter>
    <div>
      <Route path="/" component={Home} />
    </div>
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
