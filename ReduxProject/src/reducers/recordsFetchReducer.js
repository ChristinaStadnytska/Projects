import { SHOW_ACTIVITY_INDICATOR, HIDE_ACTIVITY_INDICATOR, REALM_DATA } from '../types';

const INITIAL_STATE = {
  url: '',
  loading: false,
  error: false,
  articles: [],
  isBusy: false,
};

const recordsFetchReducer = (state = INITIAL_STATE, action) => {
  switch (action.type) {
    case REALM_DATA:
      return {
        ...state,
        articles: action.payload.articles
      };
    case SHOW_ACTIVITY_INDICATOR:
      return {
        ...state,
        isBusy: true,
      };
    case HIDE_ACTIVITY_INDICATOR:
      return {
        ...state,
        isBusy: false,
      }
    default:
      return state;
  }
};

export default recordsFetchReducer;
