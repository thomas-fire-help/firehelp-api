import React from 'react'
import { connectModule } from 'redux-modules'
import { compose, withStateHandlers } from 'recompose'
import housingModule from '../modules/housing'
import Layout from '../components/Layout'
import { Input, InputNumber, Radio, Checkbox, Cascader, Upload, Button, Icon} from 'antd';
import styled from 'styled-components'

const RadioButton = Radio.Button
const RadioGroup = Radio.Group;
const { TextArea } = Input;

const housingPhotoList = [{
  uid: -1,
  name: 'xxx.png',
  status: 'done',
  url: 'https://zos.alipayobjects.com/rmsportal/jkjgkEfvpUPVyRjUImniVslZfWPnJuuZ.png',
  thumbUrl: 'https://zos.alipayobjects.com/rmsportal/jkjgkEfvpUPVyRjUImniVslZfWPnJuuZ.png',
}, {
  uid: -2,
  name: 'yyy.png',
  status: 'done',
  url: 'https://zos.alipayobjects.com/rmsportal/jkjgkEfvpUPVyRjUImniVslZfWPnJuuZ.png',
  thumbUrl: 'https://zos.alipayobjects.com/rmsportal/jkjgkEfvpUPVyRjUImniVslZfWPnJuuZ.png',
}];

const housingPhotoListProps = {
  action: '//jsonplaceholder.typicode.com/posts/',
  listType: 'picture',
  defaultFileList: [...housingPhotoList],
  className: 'upload-list-inline',
};

const housingType = {
  state: 0,
};

const childFriendly = {
  state: 0,
};

const animalsPresent = {
  state: 0,
}

const PageHeading = styled.div`
background-color: #f7f7f7;
text-align: center;
padding: 1rem;
`
const FormContainer = styled.div`
min-width: 200px;
max-width: 768px;
flex-basis: auto; /* default value */
flex-grow: 1;
`

const ItemDiv = styled.div`
display: flex;
flex-direction: column;
padding: 1rem 0rem;;
border: 1px dashed red;
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

function onChangeHousingType(value) {
  console.log(value);
}

const HousingForm = ({ actions, formData, history: { goBack }, styles }) => (
  <Layout header="HousingForm" onBack={goBack}>
    <FormContainer>
      <PageHeading>
        <h3>I Have Housing To Offer</h3>
      </PageHeading>

      <ItemDiv>
        <label>Housing Type:</label>
        <RadioGroup onChange={onChangeHousingType} defaultValue="a" value={housingType.state.value}>
          <RadioButton value="a">Entire Home</RadioButton>
          <RadioButton value="b">Private Room</RadioButton>
        </RadioGroup>
      </ItemDiv>
      
      <ItemDiv>
        <label>Beds Available:</label>
        <InputNumber min={1} max={40} style={styles.inputNumber} />
      </ItemDiv>
      <ItemDiv>
        City:
        <Input />
      </ItemDiv>
      <ItemDiv>
        Neighborhood:
        <Input />
      </ItemDiv>
      <ItemDiv>
        <label>Length Available:</label>  
        <Cascader options = {durationOptions} onChange = {onChangeDuration} placeholder="Select" />
      </ItemDiv>

      <ItemDiv>
        Child Friendly:
        <RadioGroup value={childFriendly.state.value}>
          <Radio value={1}>Yes</Radio>
          <Radio value={2}>No</Radio>
        </RadioGroup>
      </ItemDiv>

      <ItemDiv>
        Notes About Children:
        <TextArea autosize={{ minRows: 2 }} />
      </ItemDiv>

      <ItemDiv>
        Household currently has animals?:
        <RadioGroup value={animalsPresent.state.value}>
          <Radio value={1}>Yes</Radio>
          <Radio value={2}>No</Radio>
        </RadioGroup>
        What type(s)?:
        <TextArea />
      </ItemDiv>

      <ItemDiv>
        Pets
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
      </ItemDiv>

      <ItemDiv>
        Notes About Pets:
        <TextArea autosize={{ minRows: 2 }} />
      </ItemDiv>

      <ItemDiv>
        Photo(s) of Housing:
        <Upload {...housingPhotoListProps}>
          <Button>
            <Icon type="upload" /> upload
          </Button>
        </Upload>
        <br />
    </ItemDiv>

      <ItemDiv>
        Additional Information
        <TextArea placeholder="Additional Information" autosize={{ minRows: 2 }} />
      </ItemDiv>

      <button onClick={() => actions.create(formData)}>
        Submit!
      </button>  
    </FormContainer>
    
  </Layout>
)

HousingForm.defaultProps = {
  styles: {
    inputNumber: {fontFamily: "Montserrat",
                  color: "red"}
  }
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
)(HousingForm)



