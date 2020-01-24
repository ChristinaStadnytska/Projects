import {GET_TEXT} from '../types';

const INITIAL_STATE = {
  text: '',
};

const getTextReducer = (state = INITIAL_STATE, action) => {
  switch (action.type) {
    case GET_TEXT:
      return {
        ...state,
        text: action.payload.text,
      };
    default:
      return state;
  }
};

export default getTextReducer;
