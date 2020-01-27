import React, { PureComponent } from 'react';
import { Text, ButtonGroup, Button } from 'react-native-elements';
import { View } from 'react-native';
import Picker from 'react-native-picker-view';
import { connect } from 'react-redux';
import { setIndex, setIndexAndValueCountry, setIndexAndValueCategory, recordsFetch, setShowOverlay, deleteArticle } from '../../../actions';
import styles from './styles';

const firstButton = () => <Text>Country</Text>
const secondButton = () => <Text>Category</Text>

class OverlayContent extends PureComponent {

  filterPress = () => {
    this.props.setShowOverlay();
    this.props.deleteArticle();
    this.props.recordsFetch();
  };

  render() {
    const buttons = [{ element: firstButton }, { element: secondButton }];
    const pickerRender = () => {
      if (this.props.overlayReducer.selectedIndex === 0) {
        return (
          <Picker
            values={['bg', 'br', 'ca', 'ch', 'cn', 'cz', 'de', 'eg', 'fr', 'gb', 'ru', 'ua', 'us']}
            style={styles.picker}
            selected={this.props.overlayReducer.indexCountry}
            onSelect={(value, index) => { this.props.setIndexAndValueCountry(index, value) }} />
        )
      } else if (this.props.overlayReducer.selectedIndex === 1) {
        return (
          <Picker
            values={['business', 'entertainment', 'general', 'health', 'science', 'sports', 'technology']}
            style={styles.picker}
            selected={this.props.overlayReducer.indexCategory}
            onSelect={(value, index) => { this.props.setIndexAndValueCategory(index, value) }} 
            />
        )
      }
    }
    
    return (
      <View>
        <ButtonGroup
          buttons={buttons}
          containerStyle={styles.containerButtonGroup}
          selectedIndex={this.props.overlayReducer.selectedIndex}
          onPress={this.props.setIndex}
          selectedButtonStyle={styles.selectedButton} />
        {pickerRender()}
        <Button
          title={'Filter'}
          type={"clear"}
          titleStyle={{ color: 'white' }}
          containerStyle={styles.filterButton}
          onPress={this.filterPress} />
      </View>
    )
  }
}

const mapDispatchToProps = {
  setIndex,
  setIndexAndValueCountry,
  setIndexAndValueCategory,
  recordsFetch,
  setShowOverlay,
  deleteArticle,
};

const mapStateToProps = state => ({
  overlayReducer: state.overlayReducer,
});

export default connect(
  mapStateToProps,
  mapDispatchToProps,
)(OverlayContent);