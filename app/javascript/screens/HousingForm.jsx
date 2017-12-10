import React from 'react'
import Layout from '../components/Layout'
import { Input, Radio, Checkbox} from 'antd';

const RadioGroup = Radio.Group;
const { TextArea } = Input;

const Housing = ({ data, history: { goBack }}) => (
  <Layout header="Housing" onBack={goBack}>
    <Input placeholder="Number of beds" />
    <Input placeholder="City" />
    <div>
      <label>Length Available</label>  
      <RadioGroup>
        <Radio value={1}>Short-Term: one week or less</Radio>
        <Radio value={2}>Long-Term: one month to one week </Radio>
        <Radio value={3}>Permanent: available for rent or lease</Radio>
      </RadioGroup>
    </div>

    <div>
      <Checkbox>
        Child Friendly
      </Checkbox>
    </div>

    <div>
      <TextArea placeholder="Notes About Kids" autosize={{ minRows: 2 }} />
    </div>

    <div>
      <h2>Pets</h2>
      <Checkbox>
        No Pets Allowed // Make controlled checkbox that disables below choices
      </Checkbox>
      <Checkbox>
        Large Dogs (more than 50 lbs.)
      </Checkbox>
      <Checkbox>
        Small Dogs (less than 50 lbs.)
      </Checkbox>
      <Checkbox>
        Cats
      </Checkbox>
      <Checkbox>
        Horses
      </Checkbox>
      <Checkbox>
        Birds
      </Checkbox>
      <Checkbox>
        Reptiles
      </Checkbox>
      <Checkbox>
        Rodents (i.e. Rabbits, Hamsters, Gerbils)
      </Checkbox>
    </div>

    <div>
      <TextArea placeholder="Pet restrictions & additional information (e.g. - large yard, dogs must be kid-friendly, indoor cats only, etc.)" autosize={{ minRows: 2 }} />
    </div>

    <div>
      <TextArea placeholder="Additional Information" autosize={{ minRows: 2 }} />
    </div>
  </Layout>
)

Housing.defaultProps = {

}

export default Housing
