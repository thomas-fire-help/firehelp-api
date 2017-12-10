import React from 'react'
import Layout from '../components/Layout'
import { Input } from 'antd';

const Housing = ({ data, history: { goBack }}) => (
  <Layout header="Housing" onBack={goBack}>
    <Input placeholder="Number of beds" />
    <Input placeholder="City" />
    <div>
      <label>Length Available</label>
    </div>

    <div>
      <input placeholder="Child Friendly" />
    </div>

    <div>
      <input placeholder="Notes about Kids" />
    </div>

    <div>
      <input
        placeholder="Pets accepted?"
      />
    </div>

    <div>
      <input
        placeholder="Pet restrictions & additional information (e.g. - large yard, dogs must be kid-friendly, indoor cats only, etc.)"
      />
    </div>

    <div>
      <input
        placeholder="Additional Information"
      />
    </div>
  </Layout>
)

Housing.defaultProps = {

}

export default Housing
