import React from 'react'
import { connectModule } from 'redux-modules'
import { compose, lifecycle } from 'recompose'
import housingModule from '../modules/housing'
import Layout from '../components/Layout'

const Housing = ({ data, history: { goBack }}) => (
  <Layout header="Housing" onBack={goBack}>
    {data.map(listing => (
      <div>
        <h2>
          {listing.title}
        </h2>
      </div>
    ))}
  </Layout>
)

Housing.defaultProps = {
  loading: false,
  data: [
    {
      title: '2BR on the Ave.'
    },
    {
      title: '3BR on the Ave.'
    }
  ]
}

export default compose(
  connectModule(housingModule),
  lifecycle({
    componentWillMount() {
      this.props.actions.list()
    }
  }),
)(Housing)
