import {RECORDS_FAILED, RECORDS_SUCCEEDED, REALM_DATA} from '../types';

const INITIAL_STATE = {
  url: '',
  loading: false,
  error: false,
  articles: [],
};

const recordsFetchReducer = (state = INITIAL_STATE, action) => {
  switch (action.type) {
    // case RECORDS_SUCCEEDED:
    //   return {
    //     ...state,
    //     url: action.payload.responseBody,
    //     loading: false,
    //     error: false,
    //   };
    // case RECORDS_FAILED:
    //   return {
    //     ...state,
    //     url: '',
    //     loading: false,
    //     error: true,
    //   };
    case REALM_DATA:
      return {
        ...state,
        articles: action.payload.articles
      };
    default:
      return state;
  }
};

export default recordsFetchReducer;
