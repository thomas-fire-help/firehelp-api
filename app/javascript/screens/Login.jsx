import React, { Component } from 'react'
import { Link } from 'react-router-dom'
import styled from 'styled-components'
import Layout from '../components/Layout'
import { HeaderContainer, Container } from '../components/atoms'
import { fetchConfig } from '../utils/fetchConfig'

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
  cursor: pointer;
`

class Login extends Component {
  constructor() {
    super()
    this.state = {
      user: '',
      password: '',
    }
  }

  handleOnClick = () => {
    const { user: login, password } = this.state;

    fetch('auth/login', {
      method: 'post',
      body: JSON.stringify({ login, password }),
      headers: fetchConfig(),
    })
  }

  handleUsernameInput = (e) => {
    this.setState({
      user: e.target.value
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
              Login
            </h1>
          </HeaderContainer>
          <AuthInputContainer>
            <AuthInput
              onChange={(e) => {this.handleUsernameInput(e)}}
              placeholder="Username or Phone #"
              type="text"
            />
            <AuthInput
              onChange={(e) => {this.handlePasswordInput(e)}}
              placeholder="Password"
              type="password"
            />
            <LoginButton onClick={this.handleOnClick}>
              Login
            </LoginButton>
          </AuthInputContainer>
        </Container>
      </Layout>
    );
  }
}

export default Login;
