import React, { Component } from 'react';
import { SafeAreaView, FlatList, ActivityIndicator } from 'react-native';
import { ListItem } from 'react-native-elements';
import { connect } from 'react-redux';
import Moment from 'moment';
import { getText, recordsFetch, setToggle } from '../actions';
import SearchBarCustom from './components/searchBar';
import styles from './style';

class HomeScreen extends Component {
  //componentDidMount
  componentDidMount() {
    this.props.recordsFetch();
  }

  static navigationOptions = {
    header: () => <SearchBarCustom />,
  };

  //render
  render() {
    const { navigation, recordsData } = this.props;
    return (
      <SafeAreaView style={{ backgroundColor: 'white', flex: 1, justifyContent: 'center' }}>
        <FlatList
          data={recordsData.articles}
          renderItem={({ item }) => (
            <ListItem
              title={null}
              subtitle={item.title}
              rightSubtitle={Moment(item.publishedAt).format('H:mma')}
              bottomDivider
              onPress={() => navigation.navigate('detailScreen', { ...item })}
            />
          )}
          keyExtractor={(item, index) => index.toString()}
          ListEmptyComponent={<ActivityIndicator animating={recordsData.isBusy} size='small' color='#A9A9A9' style={styles.activityIndicator} />
        }
        />
      </SafeAreaView>
    );
  }
}

const mapDispatchToProps = {
  getText,
  recordsFetch,
  setToggle,
};

const mapStateToProps = state => ({
  textData: state.getTextReducer,
  recordsData: state.recordsFetchReducer,
});

export default connect(
  mapStateToProps,
  mapDispatchToProps,
)(HomeScreen);
