import React, { Component } from 'react';
import { View, SafeAreaView, Text, Button, Linking } from 'react-native';
import QRCodeScanner from 'react-native-qrcode-scanner';

class CameraScreen extends Component {
  constructor(props) {
    super(props);
    this.state = {
      scan: false,
      ScanResult: false,
      result: null,
      width: 0,
      height: 0,
      showMask: false,
      x: 0,
      y: 0,
    };
  }

  componentWillUnmount() {
    clearTimeout(this.state.showMask, this.state.result, this.state.scan, this.state.ScanResult)
  }

  onSuccess = (e) => {
    const check = e.data.substring(0, 4);
    console.log('scanned data' + check);
    this.setState({
      showMask: true,
      width: e.bounds.size.width,
      height: e.bounds.size.height,
      x: e.bounds.origin.x,
      y: e.bounds.origin.y,
    })
    setTimeout(() => {
      this.setState({
        showMask: false,
        scan: false, 
        ScanResult: true, 
        result: e
      })
    }, 500)
    if (check === 'http') {
      Linking
        .openURL(e.data)
        .catch(err => console.error('An error occured', err));
    }
  }

  activeQR = () => {
    this.setState({
      scan: true
    })
  }

  scanAgain = () => {
    this.setState({
      scan: true,
      ScanResult: false
    })
  }
  render() {
    const { scan, ScanResult, result, width, height, showMask, x, y } = this.state
    return (
      <SafeAreaView style={{ alignItems: 'center', justifyContent: 'center', flex: 1 }}>
        <Text>Welcome To React-Native QR Code App !</Text>
        {!scan && !ScanResult &&
          <Button
            title="Scan me"
            color="#f194ff"
            onPress={this.activeQR}
          />
        }

        {ScanResult &&
          <View style={{ alignSelf: 'center', justifyContent: 'center', alignItems: 'center' }}>
            <Text>Result !</Text>
            <Text>Type:{result.type}</Text>
            <Text>Result:{result.data}</Text>
            <Text numberOfLines={1}>RawData:{result.rawData}</Text>

            <Text>Width:{width}</Text>
            <Text>Height:{height}</Text>
            <Text>X:{x}</Text>
            <Text>Y:{y}</Text>

            <Button onPress={this.scanAgain} title="Click to Scan again!" />
          </View>
        }

        {showMask &&
          <View
            style={{
              width: parseInt(width),
              height: parseInt(height),
              left: parseInt(x),
              top: parseInt(y) + parseInt(y),
              position: 'absolute',
              zIndex: 1000,
              backgroundColor: '#808080',
              opacity: .4
            }}>
          </View>
        }

        {scan &&
          <QRCodeScanner
            onRead={this.onSuccess}
            reactivate={true}
            showMarker={true}
            fadeIn={false}
            notAuthorizedView={<Text style={{ alignSelf: 'center' }}>Need camera permission. Go to settings please.</Text>}
            ref={(node) => { this.scanner = node }}
            bottomContent={
              <View>
                <Button
                  title="OK. Got it!"
                  onPress={() => this.scanner.reactivate()}
                />
                <Button
                  title="Stop Scan"
                  onPress={() => this.setState({ scan: false })}
                />
              </View>
            }
          />
        }
      </SafeAreaView>
    );
  }
}

export default CameraScreen;