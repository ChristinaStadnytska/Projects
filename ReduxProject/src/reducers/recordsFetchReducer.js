import {RECORDS_FAILED, RECORDS_SUCCEEDED} from '../types';

const INITIAL_STATE = {
  url: '',
  loading: false,
  error: false,
};

const recordsFetchReducer = (state = INITIAL_STATE, action) => {
  switch (action.type) {
    case RECORDS_SUCCEEDED:
      return {
        ...state,
        url: action.payload.responseBody,
        loading: false,
        error: false,
      };
    case RECORDS_FAILED:
      return {
        ...state,
        url: '',
        loading: false,
        error: true,
      };
    default:
      return state;
  }
};

export default recordsFetchReducer;
