import { createModule } from 'redux-modules';
import { loop, Cmd } from 'redux-loop';

const endpoint = '/housings'

const create = params =>
  fetch(endpoint, { method: 'POST', body: JSON.stringify(params) })
    .then(res => res.json())

const list = params =>
  fetch(endpoint).then(res => res.json())


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
      Cmd.run(create, {
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
      Cmd.run(list, {
        successActionCreator: housingModule.listSuccess,
        failActionCreator: housingModule.listError,
        args: [payload]
      }),
    ],
    listSuccess: {
      reducer: (state, { payload }) =>
        Object.assign({}, state, { loading: false, data: payload }),
    },
    listError: s => s,
  },
});

export default housingModule;
