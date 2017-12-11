import React from 'react'
import styled from 'styled-components'

const LeftSegment = styled.button`
  border-top-left-radius: 4px;
  border-bottom-left-radius: 4px;
  font-size: 1.5rem;
  width: 50%;
  background-color: ${({ active }) => active && 'grey;'}
  color: ${({ active }) => active && 'white;'}
  flex: 1;

  :focus {
    outline: none;
  }
`

const RightSegment = styled.button`
  border-top-right-radius: 4px;
  border-bottom-right-radius: 4px;
  font-size: 1.5rem;
  width: 50%;
  background-color: ${({ active }) => active && 'grey;'}
  color: ${({ active }) => active && 'white;'}
  flex: 1;

  :focus {
    outline: none;
  }
`

const Container = styled.div`
  display: flex;
  border: 1px solid grey;
  width: 100%;
`

const SegmentedController = ({ onChange, value, options }) => (
  <div>
    <LeftSegment
      active={value === options[0].value}
      onClick={() => onChange(options[0].value)}
    >
      {options[0].label}
    </LeftSegment>
    <RightSegment
      active={value === options[1].value}
      onClick={() => onChange(options[1].value)}
    >
      {options[1].label}
    </RightSegment>
  </div>
)

export default SegmentedController
