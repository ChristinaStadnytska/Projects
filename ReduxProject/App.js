/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow
 */

import React, { useEffect } from 'react';
import Screen from './src/ui';
import { Provider } from 'react-redux';
import SplashScreen from 'react-native-splash-screen';
import store from './src/configureStore';

const App = () => {
  useEffect(() => {
    SplashScreen.hide();
  }, []);

  return (
    <Provider store={store}>
      <Screen />
    </Provider>
  );
};

export default App;
