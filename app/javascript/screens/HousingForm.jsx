import React from 'react'
import { connectModule } from 'redux-modules'
import { compose, withStateHandlers } from 'recompose'
import housingModule from '../modules/housing'
import Layout from '../components/Layout'
import { Container, HeaderContainer } from '../components/atoms'
import { Input, Radio, Checkbox, Button } from 'antd'
import styled from 'styled-components'
import SegmentedController from '../components/SegmentedController'
const RadioGroup = Radio.Group
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
          options={["Entire Home", "Private Room"]}
        />
      </StackInput>

      <StackInput required label="Beds Available:">

      </StackInput>

      <StackInput required label="City:">

      </StackInput>

      <StackInput label="Neighborhood:">
        <Input
          onChange={value => update('neighborhood', value)}
        />
      </StackInput>

      <StackInput required label="Duration:">
        <RadioGroup>
          <Radio value={1}>Short-Term: one week or less</Radio>
          <Radio value={2}>Long-Term: one month to one week </Radio>
          <Radio value={3}>Permanent: available for rent or lease</Radio>
        </RadioGroup>
      </StackInput>

      <StackInput required label="Price:">
        <SegmentedController
          value={formData.price}
          onChange={value => update('price', value)}
          options={["Free", "Paid"]}
        />
      </StackInput>

      <StackInput label="Child Friendly:">
        <SegmentedController
          value={formData.childFriendly}
          onChange={value => update('childFriendly', value)}
          options={["Yes", "No"]}
        />
      </StackInput>

      <StackInput label="Household currently has animals?">
        <SegmentedController
          value={formData.currentlyHasAnimals}
          onChange={value => update('currentlyHasAnimals', value)}
          options={["Yes", "No"]}
        />
      </StackInput>

      <StackInput label="Pets allowed:">
        <SegmentedController
          value={formData.petsAllowed}
          onChange={value => update('petsAllowed', value)}
          options={["Yes", "No"]}
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
        housingType: '',
        bedsAvailable: 1,
        city: 'Ventura',
        neighborhood: '',
        duration: 'short_term',
        price: 'free',
        childFriendly: false,
        householdHasAnimals: false,
        petsAllowed: false,
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
