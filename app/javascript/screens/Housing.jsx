import React from 'react'
import { connectModule } from 'redux-modules'
import { Spinner } from '@procore/core-react'
import { compose, lifecycle } from 'recompose'
import housingModule from '../modules/housing'
import Layout from '../components/Layout'

const Housing = ({ loading, data, history: { goBack }}) => (
  <Layout header="Housing" onBack={goBack}>
    <Spinner loading={true}>
      {data.map(listing => (
        <div>
          <h2>
            {listing.title}
          </h2>
        </div>
      ))}
    </Spinner>
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
