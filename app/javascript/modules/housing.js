import { createModule } from 'redux-modules';

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
