import React, { Component } from 'react'
import { Link } from 'react-router-dom'
import styled, { keyframes } from 'styled-components'
import debounce from 'lodash.debounce'
import Layout from '../components/Layout'
import { fetchConfig, handleErrors } from '../utils/fetchUtils'
import { Banner, ErrorBanner } from '@procore/core-react';

const Container = styled.div`
  display: flex;
  flex-direction: column;
  align-items: center;
  height: 90%;
  width: 70vw;
`

const HeaderContainer = styled.div`
  align-self: flex-start;
  flex: 1;
  text-transform: uppercase;
  font-size: 2.25rem;
  letter-spacing: 2px;
`

const AuthInputContainer = styled.div`
  display: flex;
  flex-direction: column;
  width: 100%;
`

const AuthInput = styled.input`
  background: none;
  background-color: #FFF;
  border: none;
  border-bottom: 1px solid #000;
  border-radius: 0;
  color: #000;
  padding: 2rem 0rem .5rem 0rem;
  font-size: 2rem;
  width: 100%;
  &:focus {
    caret-color: #000;
    outline-style: none;
    box-shadow: none;
    border-color: transparent;
    border-bottom: 1px solid #000;
  }
  &::placeholder {
    color: #000;
    font-size: 2rem;
    font-family: 'Raleway', sans-serif;
    font-weight: 300;
  }
  &:-webkit-autofill {
    -webkit-box-shadow: 0 0 0 3rem white inset;
    -webkit-text-fill-color: #000;
    -webkit-animation-name: autofill;
    -webkit-animation-fill-mode: both;
  }
  &:-webkit-autofill:focus {
    -webkit-text-fill-color: #000;
  }
`

const SignUpButton = styled.button`
  align-self: flex-end;
  background: none;
  border: 1px solid #000;
  border-radius: 3px;
  cursor: pointer;
  font-size: 1.25rem;
  height: 2.5rem;
  width: 10rem;
  text-transform: uppercase;
  margin-top: 2rem;
`

const fadeIn = keyframes`
  0% {
    opacity: 0;
  }
  100% {
    opacity: 1;
  }
`;

const enlarge = keyframes`
  0% {
    transform: scale(.5);
  }
  100% {
    transform: scale(1);
  }
`;


const ErrorWrapper = styled.div`
  animation: ${fadeIn} 1s, ${enlarge} .5s;
`

const isValidEmail = (email) => (
  /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(email)
);

class SignUp extends Component {
  constructor() {
    super()
    this.state = {
      email: '',
      phoneNumber: '',
      password: '',
      errors: [],
    }

    this.handleEmailInput = debounce(this.handleEmailInput, 800)
    this.handlePhoneNumberInput = debounce(this.handlePhoneNumberInput, 800)
    this.handlePasswordInput = debounce(this.handlePasswordInput, 800)
  }

  handleOnClick = () => {
    const { email: username, phoneNumber: phone_number, password } = this.state;
    fetch('auth/register', {
      method: 'post',
      body: JSON.stringify({ username, phone_number, password }),
      headers: fetchConfig(),
    })
      .then(handleErrors)
      .catch((err) => console.log(err));
  }

  handleEmailInput = (e) => {
    const { errors } = this.state;

    isValidEmail(e.target.value)
      ? this.setState({ email: e.target.value })
      : this.setState({ email: e.target.value, errors: [ ...errors, { label: 'Please enter a valid email' } ]})
  }

  handlePhoneNumberInput = (e) => {
    this.setState({ phoneNumber: e.target.value });
  }

  handlePasswordInput = (e) => {
    this.setState({ password: e.target.value });
  }

  render() {
    const { history: { goBack }} = this.props;
    const { errors } = this.state;

    return (
      <Layout onBack={goBack}>
        <Container>
          { Boolean(errors.length) &&
            <ErrorWrapper>
              <ErrorBanner>
                <Banner.Content>
                  <Banner.Title>Error</Banner.Title>
                  <Banner.Body>
                  { errors.map((error, index) =>
                    <div>{`${index + 1}. ${error.label}`}</div>)
                  }
                  </Banner.Body>
                </Banner.Content>
                <Banner.Dismiss onClick={() => alert('dismiss clicked')} />
              </ErrorBanner>
            </ErrorWrapper>
          }
          <HeaderContainer>
            <h1>
              Sign Up
            </h1>
          </HeaderContainer>
          <AuthInputContainer>
            <AuthInput
              onChange={(e) => {
                e.persist();
                this.handleEmailInput(e)
              }}
              placeholder="Email address"
              type="text"
            />
            <AuthInput
              onChange={(e) => {
                e.persist();
                this.handlePhoneNumberInput(e)
              }}
              placeholder="Phone number"
              type="text"
            />
            <AuthInput
              onChange={(e) => {
                e.persist();
                this.handlePasswordInput(e)}
              }
              placeholder="Password"
              type="password"
            />
            <SignUpButton onClick={this.handleOnClick}>
              Sign Up
            </SignUpButton>
          </AuthInputContainer>
        </Container>
      </Layout>
    );
  }
}

export default SignUp;