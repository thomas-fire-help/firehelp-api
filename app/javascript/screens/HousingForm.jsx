import React from 'react'
import { connectModule } from 'redux-modules'
import { compose, withStateHandlers } from 'recompose'
import housingModule from '../modules/housing'
import Layout from '../components/Layout'
import { Input, InputNumber, Radio, Checkbox, Cascader} from 'antd';
import styled from 'styled-components'

const RadioGroup = Radio.Group;
const { TextArea } = Input;

const PageHeading = styled.div`
background-color: #f7f7f7;
text-align: center;
padding: 1rem;
`

const NotesAboutKids = styled.div`
background-color: seagreen;
`

const durationOptions = [{
  value: 'shortTerm',
  label: 'Short Term - less than a week'
}, {
  value: 'longTerm',
  label: 'Long Term - more than a week'
}, {
  value: 'permanent',
  label: 'Permanent - available for rent'
}];

function onChangeDuration(value) {
  console.log(value);
}

const Housing = ({ actions, formData, history: { goBack }}) => (
  <Layout header="Housing" onBack={goBack}>
    <PageHeading>
      I Have Housing To Offer
    </PageHeading>
    <div>
      Beds Available:
      <InputNumber min={1} max={40} />
    </div>
    <div>
      City:
      <Input placeholder="City" />
    </div>
    <div>
      Neighborhood:
      <Input placeholder="Neighborhood" />
    </div>
    <div>
      <label>Length Available</label>  
      <RadioGroup>
        <Radio value={1}>Short-Term: one week or less</Radio>
        <Radio value={2}>Long-Term: one month to one week </Radio>
        <Radio value={3}>Permanent: available for rent or lease</Radio>
      </RadioGroup>
    </div>
    <div>
      <label>Length Available</label>  
      <Cascader options = {durationOptions} onChange = {onChangeDuration} placeholder="Select" />
    </div>

    <div>
      <Checkbox>
        Child Friendly
      </Checkbox>
    </div>

    <div>
      <NotesAboutKids>
        <TextArea placeholder="Notes About Kids" autosize={{ minRows: 2 }} />
      </NotesAboutKids>
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
      Additional Information
      <TextArea placeholder="Additional Information" autosize={{ minRows: 2 }} />
    </div>

    <button onClick={() => actions.create(formData)}>
      Submit!
    </button>
  </Layout>
)

Housing.defaultProps = {

}

export default compose(
  withStateHandlers(
    {
      formData: {
        number_of_beds: '',
        city: '',
        additional_information: '',
      }
    },
    {
      update: (state) => (payload) => ({ [payload.key]: payload.value })
    }
  ),
  connectModule(housingModule)
)(Housing)
