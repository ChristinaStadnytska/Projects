import { SHOW_OVERLAY, SELECTED_INDEX, SELECTED_COUNTRY_PICKER, SELECTED_CATEGORY_PICKER } from '../types';

const INITIAL_STATE = {
  isShow: false,
  selectedIndex: 0,
  indexCountry: 11,
  valueCountry: 'ua',
  indexCategory: 2,
  valueCategory: 'general',
};

const overlayReducer = (state = INITIAL_STATE, action) => {
  switch (action.type) {
    case SHOW_OVERLAY:
      return {
        ...state,
        isShow: !state.isShow,
      };
    case SELECTED_INDEX:
      return {
        ...state,
        selectedIndex: state.selectedIndex === 0 ? 1 : 0,
      };
    case SELECTED_COUNTRY_PICKER:
      return {
        ...state,
        indexCountry: action.payload.indexCountry,
        valueCountry: action.payload.valueCountry,
      }
    case SELECTED_CATEGORY_PICKER:
      return {
        ...state,
        indexCategory: action.payload.indexCategory,
        valueCategory: action.payload.valueCategory,
      }
    default: return state;
  }
};

export default overlayReducer;