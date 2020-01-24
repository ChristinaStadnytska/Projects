import {createStore, applyMiddleware, compose} from 'redux';
import createSagaMiddleware from 'redux-saga';
import throttle from 'redux-throttle';
import reducers from './reducers';
import rootSaga from './sagas/rootSaga';

const sagaMiddleware = createSagaMiddleware();

const configureStore = (initialState = null) => {
  const composeEnhancers =
    typeof window === 'object' && window.__REDUX_DEVTOOLS_EXTENSION_COMPOSE__
      ? window.__REDUX_DEVTOOLS_EXTENSION_COMPOSE__({
          // Specify extensionÂas options like name,
          // actionsBlacklist, actionsCreators, serialize...
        })
      : compose;

  const throttleMiddleware = throttle(300, {leading: false, trailing: true});
  const enhancer = composeEnhancers(
    applyMiddleware(throttleMiddleware, sagaMiddleware),
  );
  return createStore(reducers, initialState, enhancer);
};

const store = configureStore({});
sagaMiddleware.run(rootSaga);

export default store;
