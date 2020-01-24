import React, {PureComponent} from 'react';
import {TouchableOpacity} from 'react-native';
import {connect} from 'react-redux';
import {setToggle} from '../../../actions';
import Icon from 'react-native-vector-icons/FontAwesome';
import styles from './styles';

class SearchButton extends PureComponent {
  render() {
    return (
      <TouchableOpacity
        style={styles.headerLeft}
        onPress={this.props.setToggle}>
        <Icon
          name={'search'}
          size={16}
          color={'#6495ED'}
          style={{paddingLeft: 20}}
        />
      </TouchableOpacity>
    );
  }
}

const mapDispatchToProps = {
  setToggle,
};

const mapStateToProps = state => ({state});

export default connect(
  mapStateToProps,
  mapDispatchToProps,
)(SearchButton);
