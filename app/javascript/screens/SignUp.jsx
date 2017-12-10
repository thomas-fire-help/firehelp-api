import React, { Component } from 'react'
import { Link } from 'react-router-dom'
import styled from 'styled-components'
import Layout from '../components/Layout'

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

const LoginButton = styled.button`
  align-self: flex-end;
  background: none;
  border: 1px solid #000;
  border-radius: 3px;
  font-size: 1.25rem;
  height: 2.5rem;
  width: 10rem;
  text-transform: uppercase;
  margin-top: 2rem;
`

const fetchConfig = () => {
  return {
    'X-CSRF-Token': document.querySelector("meta[name='csrf-token']").getAttribute('content'),
  };
};

const isValidEmail = (email) => {
  console.log(/^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(email))
}

class Login extends Component {
  constructor() {
    super()
    this.state = {
      email: '',
      phoneNumber: '',
      password: '',
    }
  }

  handleOnClick = () => {
    const { email: username, phoneNumber: phone_number, password } = this.state;
    console.log('SIGNUP DATA TO POST', username, phone_number, password);
    console.log(fetchConfig());

    fetch('auth/register', {
      method: 'post',
      body: { username, phone_number, password },
      headers: fetchConfig(),
    })
  }

  handleEmailInput = (e) => {
    this.setState({
      email: e.target.value
    })
  }

  handlePhoneNumberInput = (e) => {
    this.setState({
      phoneNumber: e.target.value
    })
  }

  handlePasswordInput = (e) => {
    this.setState({
      password: e.target.value
    })
  }

  render() {
    const { history: { goBack }} = this.props;

    return (
      <Layout onBack={goBack}>
        <Container>
          <HeaderContainer>
            <h1>
              Sign Up
            </h1>
          </HeaderContainer>
          <AuthInputContainer>
            <AuthInput
              onChange={(e) => {this.handleEmailInput(e)}}
              placeholder="Email address"
              type="text"
            />
            <AuthInput
              onChange={(e) => {this.handlePhoneNumberInput(e)}}
              placeholder="Phone number"
              type="text"
            />
            <AuthInput
              onChange={(e) => {this.handlePasswordInput(e)}}
              placeholder="Password"
              type="password"
            />
            <LoginButton onClick={this.handleOnClick}>
              Sign Up
            </LoginButton>
          </AuthInputContainer>
        </Container>
      </Layout>
    );
  }
}

export default Login;