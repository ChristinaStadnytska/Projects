import {takeEvery, put, call, select} from 'redux-saga/effects';
import {
  RECORDS_FETCH,
  RECORDS_REQUEST_IN_PROGRESS,
  RECORDS_SUCCEEDED,
  RECORDS_FAILED,
} from '../types';

function* fetchRecordsAsync() {
  yield put({type: RECORDS_REQUEST_IN_PROGRESS});
  
  const state = yield select();
  const searchedText = state.getTextReducer.text;
  const country = state.overlayReducer.valueCountry;
  const category = state.overlayReducer.valueCategory;
  
  try { 
    const response = yield call(
      fetch,
      "https://newsapi.org/v2/top-headlines?country=" + country + "&category=" + category + "&q=" + searchedText + "&apiKey=bca9b711b1e445baa15da21825bc73e4",
    );
    const responseBody = yield call([response, response.json]);
    yield put({
      type: RECORDS_SUCCEEDED,
      payload: {responseBody},
    });
  } catch (e) {
    yield put({type: RECORDS_FAILED});
  }
}

export default function* watchFetchRecords() {
  yield takeEvery(RECORDS_FETCH, fetchRecordsAsync);
}
