import React, { PureComponent } from 'react';
import { SafeAreaView, View, Animated } from 'react-native';
import { SearchBar, Text, Button } from 'react-native-elements';
import { connect } from 'react-redux';
import { getText, setToggle, recordsFetch, setShowOverlay } from '../../../actions';
import SearchButton from '../searchButton';
import OverlayCustom from '../overlay';
import styles from './styles';

class SearchBarCustom extends PureComponent {
  constructor(props) {
    super(props);
    this.state = {
      fadeAnim: new Animated.Value(0),
    };
  }

  componentDidUpdate(props, state) {
    return Animated.timing(state.fadeAnim, {
      toValue: 1,
      duration: 500,
      useNativeDriver: true,
    }).start();
  }

  _onChangeText = text => {
      this.props.getText(text);
      this.props.recordsFetch();
  }

  render() {
    const { fadeAnim } = this.state;
    const fadeOut = () => {
      Animated.timing(fadeAnim, {
        toValue: 0,
        duration: 500,
        useNativeDriver: true,
      }).start();
    };
    const _renderSearchBar = () => {
      if (this.props.isClickedSearch.isClicked) {
        return (
          <Animated.View
            style={{
              ...this.props.style,
              opacity: fadeAnim,
            }}>
            {this.props.children}
            <SearchBar
              ref={search => (this.search = search)}
              placeholder="Search"
              value={this.props.textData.text}
              onChangeText={this._onChangeText}
              lightTheme
              containerStyle={styles.containerStyleSearchBar}
              inputContainerStyle={styles.inputContainerStyleSearchBar}
              platform="ios"
              cancelButtonTitle="Cancel"
              cancelButtonProps={{ color: 'black' }}
              onBlur={this.props.setToggle}
              onCancel={() => {
                fadeOut();
              }}
            />
          </Animated.View>
        );
      } else {
        return (
          <View style={styles.container}>
            <SearchButton />
            <Text style={styles.title}>News</Text>
            <Button title="Filter" 
            type="clear" 
            titleStyle={{color: '#6495ED'}} 
            containerStyle={styles.containerStyleFilterButton}
            onPress={this.props.setShowOverlay}
            />
            <OverlayCustom isVisible={this.props.isShowOverlay.isShow}/>
          </View>
        );
      }
    };
    return <SafeAreaView>{_renderSearchBar()}</SafeAreaView>;
  }
}

const mapDispatchToProps = {
  getText,
  setToggle,
  recordsFetch,
  setShowOverlay,
};

const mapStateToProps = state => ({
  textData: state.getTextReducer,
  isClickedSearch: state.searchBarReducer,
  isShowOverlay: state.overlayReducer,
});

export default connect(
  mapStateToProps,
  mapDispatchToProps,
)(SearchBarCustom);
