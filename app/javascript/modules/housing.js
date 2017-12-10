import { createModule } from 'redux-modules';
import { loop, Cmd } from 'redux-loop';

export default createModule ({
  name: 'housing',
  initialState: {
    data: [],
    loading: false,
  },
  transformations: {
    init: state => state,
  },
});
