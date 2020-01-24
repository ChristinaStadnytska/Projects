import { createStackNavigator, TransitionPresets } from 'react-navigation-stack';
import { createAppContainer } from 'react-navigation';
import HomeScreen from './HomeScreen';
import DetailScreen from './DetailScreen';

const AppStack = createStackNavigator({
    News: { screen: HomeScreen },
    detailScreen: { screen: DetailScreen },
}, {
    defaultNavigationOptions: {
        ...TransitionPresets.SlideFromRightIOS,
    }
});
export default createAppContainer(AppStack);
