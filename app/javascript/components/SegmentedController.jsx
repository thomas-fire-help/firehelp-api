import React from 'react'
import styled from 'styled-components'

const LeftSegment = styled.button`
  border-top-left-radius: 4px;
  border-bottom-left-radius: 4px;
  background-color: ${({ active }) => active && 'grey;'}
  color: ${({ active }) => active && 'white;'}
  flex: 1;
`

const RightSegment = styled.button`
  border-top-right-radius: 4px;
  border-bottom-right-radius: 4px;
  background-color: ${({ active }) => active && 'grey;'}
  color: ${({ active }) => active && 'white;'}
  flex: 1;
`

const Container = styled.div`
  display: flex;
  border: 1px solid grey;
  width: 100%;
`

const SegmentedController = ({ onChange, value, options }) => (
  <div>
    <LeftSegment
      active={value === options[0]}
      onClick={() => onChange(options[0])}
    >
      {options[0]}
    </LeftSegment>
    <RightSegment
      active={value === options[1]}
      onClick={() => onChange(options[1])}
    >
      {options[1]}
    </RightSegment>
  </div>
)

export default SegmentedController
