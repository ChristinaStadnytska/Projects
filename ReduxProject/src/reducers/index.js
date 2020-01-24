import {combineReducers} from 'redux';
import getTextReducer from './getTextReducer';
import recordsFetchReducer from './recordsFetchReducer';
import searchBarReducer from './searchBarReducer';
import overlayReducer from './overlayReducer';
 

export default combineReducers({
  getTextReducer: getTextReducer,
  recordsFetchReducer: recordsFetchReducer,
  searchBarReducer: searchBarReducer,
  overlayReducer: overlayReducer,
});
