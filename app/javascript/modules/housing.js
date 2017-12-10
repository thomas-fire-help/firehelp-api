import { createModule } from 'redux-modules';
import { loop, Cmd } from 'redux-loop';

const endpoint = '/housing'

const createHouse = params =>
  fetch(endpoint, { method: 'POST', body: JSON.stringify(params) })

const housingModule = createModule ({
  name: 'housing',
  initialState: {
    data: [],
    loading: false,
  },
  selector: s => s.housing,
  transformations: {
    init: state => state,
    create: (state, { payload }) => [
      Object.assign({}, state, { loading: true }),
      Cmd.run(createHouse, {
        successActionCreator: housingModule.createSuccess,
        failActionCreator: housingModule.createError,
        args: [payload]
      }),
    ],
    createSuccess: {
      reducer: (state, { payload }) => state,
    },
    createError: s => s,
    list: (state, { payload }) => [
      Object.assign({}, state, { loading: true }),
      Cmd.run(listHouse, {
        successActionCreator: housingModule.listSuccess,
        failActionCreator: housingModule.listError,
        args: [payload]
      }),
    ],
    listSuccess: {
      reducer: (state, { payload }) =>
        Object.assign({}, state, { loading: true }),
    },
    listError: s => s,
  },
});

export default housingModule;
