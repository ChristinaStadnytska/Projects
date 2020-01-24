import {TOGGLE} from '../types';

const INITIAL_STATE = {
  isClicked: false,
};

const searchBarReducer = (state = INITIAL_STATE, action) => {
  switch (action.type) {
    case TOGGLE:
      return {
        ...state,
        isClicked: !state.isClicked,
      };
    default:
      return state;
  }
};

export default searchBarReducer;
