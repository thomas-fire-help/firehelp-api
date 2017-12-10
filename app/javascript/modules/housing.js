import { createModule } from 'redux-modules';
import { loop, Cmd, liftState } from 'redux-loop';

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
  composes: [liftState],
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
      reducer: (state, { payload }) =>
        Object.assign({}, state, { data: state.data.concat(payload), loading: false }),
    },
    createError: s => s,
    list: (state, { payload }) => [
      Object.assign({}, state, { loading: true }),
      Cmd.run(list, {
        successActionCreator: housingModule.actions.listSuccess,
        failActionCreator: housingModule.actions.listError,
        args: [payload]
      }),
    ],
    listSuccess: {
      reducer: (state, { payload }) =>
        Object.assign({}, state, { loading: false, data: payload })
    },
    listError: s => s,
  },
});

export default housingModule;
