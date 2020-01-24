import React, { PureComponent } from 'react';
import { Overlay } from 'react-native-elements';
import { connect } from 'react-redux';
import { setShowOverlay } from '../../../actions';
import OverlayContent from '../overlayContent';

class OverlayCustom extends PureComponent {
  constructor(props) {
    super(props);
  }

  render() {
    return (
      <Overlay
        isVisible={this.props.overlayReducer.isShow}
        onBackdropPress={this.props.setShowOverlay}
        width="auto"
        height="auto"
        borderRadius={10}>
        <OverlayContent />
      </Overlay>
    );
  }
}

const mapDispatchToProps = {
  setShowOverlay,
};

const mapStateToProps = state => ({
  overlayReducer: state.overlayReducer,
});

export default connect(
  mapStateToProps,
  mapDispatchToProps,
)(OverlayCustom);