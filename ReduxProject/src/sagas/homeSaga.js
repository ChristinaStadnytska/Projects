import { takeEvery, put, call, select } from 'redux-saga/effects';
import {
  RECORDS_FETCH,
  RECORDS_REQUEST_IN_PROGRESS,
  RECORDS_SUCCEEDED,
  RECORDS_FAILED,
  GET_DATA_FROM_REALM,
  REALM_DATA,
} from '../types';
import realm from '../schemas/schema';
import convertToArray from '../uitils/convertToArray';

function* fetchRecordsAsync() {
  yield put({ type: RECORDS_REQUEST_IN_PROGRESS });

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
    const { articles } = responseBody;

    yield realm.write(() => {
      articles.forEach(article => {
        realm.create('Article', { ...article, sourceName: article.source.name }, 'all');
      });
    });

    yield put({
      type: RECORDS_SUCCEEDED,
      payload: { responseBody },
    });

    yield put({
      type: GET_DATA_FROM_REALM,
    });

  } catch (e) {
    yield put({ type: RECORDS_FAILED });
  }
}

function* getArticles() {
  const articles = yield realm.objects('Article');
  
  yield put({
    type: REALM_DATA,
    payload: { articles: convertToArray(articles) },
  });
}

export default function* watchFetchRecords() {
  yield takeEvery(RECORDS_FETCH, fetchRecordsAsync);
  yield takeEvery(GET_DATA_FROM_REALM, getArticles);
}
