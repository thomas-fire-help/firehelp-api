import React from 'react'
import { connectModule } from 'redux-modules'
import { compose, withStateHandlers } from 'recompose'
import housingModule from '../modules/housing'
import Layout from '../components/Layout'
import { Container, HeaderContainer } from '../components/atoms'
import { Input, Radio, Checkbox, Button, Select } from 'antd'
import styled from 'styled-components'
import SegmentedController from '../components/SegmentedController'
const RadioGroup = Radio.Group
const Option = Select.Option
const { TextArea } = Input

const RequiredIndicator = styled.em`
  color: red;
`

const Label = styled.div`
  font-size: 1.5rem;
  padding: 1rem 0;
`

const StackContainer = styled.div`
  margin: 30px 0;
`

const StackInput = ({ required, children, label }) => (
  <StackContainer>
    <Label>
      {required && <RequiredIndicator>*</RequiredIndicator>} {label}
    </Label>
    <div>
      {children}
    </div>
  </StackContainer>
)

const Housing = ({ actions, update, formData, history: { goBack }}) => (
  <Layout header="Housing" onBack={goBack}>
    <Container>
      <HeaderContainer>
        Enter Housing Information
      </HeaderContainer>
      <StackInput required label="Housing Type:">
        <SegmentedController
          value={formData.housingType}
          onChange={value => update('housingType', value)}
          options={[
            {label: 'Entire Home', value: 'entire_home'},
            {label: 'Private Room', value: 'private_room'}
          ]}
        />
      </StackInput>

      <StackInput required label="Beds Available:">
        <Select
          showSearch
          style={{ width: '100%' }}
          value={formData.bedsAvailable}
          placeholder="Select number of beds available"
          optionFilterProp="children"
          onChange={value => update('bedsAvailable', value)}
          filterOption={(input, option) => option.props.children.toLowerCase().indexOf(input.toLowerCase()) >= 0}
        >
          <Option value="1">1</Option>
          <Option value="2">2</Option>
          <Option value="3">3</Option>
          <Option value="4">4</Option>
          <Option value="5">5+</Option>
        </Select>
      </StackInput>

      <StackInput required label="City:">
        <Select
          showSearch
          style={{ width: '100%' }}
          value={formData.city}
          placeholder="Select a city"
          optionFilterProp="children"
          onChange={value => update('city', value)}
          filterOption={(input, option) => option.props.children.toLowerCase().indexOf(input.toLowerCase()) >= 0}
        >
          <Option value="goleta">Goleta</Option>
          <Option value="ojai">Ojai</Option>
          <Option value="santa_barbara">Santa Barbara</Option>
          <Option value="camarillo">Camarillo</Option>
          <Option value="ventura">Ventura</Option>
          <Option value="thousand_oaks">Thousand Oaks</Option>
        </Select>
      </StackInput>

      <StackInput label="Neighborhood:">
        <Input
          onChange={value => update('neighborhood', value)}
        />
      </StackInput>

      <StackInput required label="Duration:">
        <RadioGroup value={formData.duration} onChange={({ target }) => update('duration', target.value)}>
          <Radio value={'short_term'}>Short-Term: one week or less</Radio>
          <Radio value={'long_term'}>Long-Term: one month to one week </Radio>
          <Radio value={'permanent'}>Permanent: available for rent or lease</Radio>
        </RadioGroup>
      </StackInput>

      <StackInput required label="Price:">
        <SegmentedController
          value={formData.price}
          onChange={value => update('price', value)}
          options={[{ label: "Free", value: 'free' }, { label: "Paid", value: 'paid' }]}
        />
      </StackInput>

      <StackInput label="Child Friendly:">
        <SegmentedController
          value={formData.childFriendly}
          onChange={value => update('childFriendly', value)}
          options={[{ label: "Yes", value: 'yes' }, { label: "No", value: 'no' }]}
        />
      </StackInput>

      <StackInput label="Household currently has animals?">
        <SegmentedController
          value={formData.householdHasAnimals}
          onChange={value => update('householdHasAnimals', value)}
          options={[{ label: "Yes", value: 'yes' }, { label: "No", value: 'no' }]}
        />
      </StackInput>

      <StackInput label="Pets allowed:">
        <SegmentedController
          value={formData.petsAllowed}
          onChange={value => update('petsAllowed', value)}
          options={[{ label: "Yes", value: 'yes' }, { label: "No", value: 'no' }]}
        />
      </StackInput>


      <StackInput label="Description of Housing:">
        <TextArea placeholder="Additional Information" autosize={{ minRows: 2 }} />
      </StackInput>

      <StackInput required label="Your Name:">
        <Input
          onChange={value => update('name', value)}
        />
      </StackInput>

      <StackInput required label="Phone Number:">
        <Input
          onChange={value => update('phoneNumber', value)}
        />
      </StackInput>

      <StackInput required label="Email Address:">
        <Input
          onChange={value => update('emailAddress', value)}
        />
      </StackInput>

      <div style={{ paddingTop: '1em' }}>
        <Button onClick={() => actions.create(formData)}>
          Submit!
        </Button>
      </div>
    </Container>
  </Layout>
)

Housing.defaultProps = {

}

export default compose(
  withStateHandlers(
    {
      formData: {
        housingType: 'private_room',
        bedsAvailable: 1,
        city: 'ventura',
        neighborhood: '',
        duration: 'short_term',
        price: 'free',
        childFriendly: 'yes',
        householdHasAnimals: 'no',
        petsAllowed: 'yes',
        description: '',
        yourName: '',
        phoneNumber: '',
        RequiredIndicatorailAddress: ''
      }
    },
    {
      update: (state) => (key, value) => Object.assign({}, { formData: { ... state.formData, [key]: value  } })
    }
  ),
  connectModule(housingModule)
)(Housing)
