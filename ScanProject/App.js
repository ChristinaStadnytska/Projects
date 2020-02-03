/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow
 */

import React, { Component } from 'react';
import { View, SafeAreaView, Text, Button, Linking } from 'react-native';
import QRCodeScanner from 'react-native-qrcode-scanner';

class App extends Component {
  constructor(props) {
    super(props);
    this.state = {
      scan: false,
      ScanResult: false,
      result: null
    };
  }

  onSuccess = (e) => {
    const check = e.data.substring(0, 4);
    console.log('scanned data' + check);
    this.setState({
      result: e,
      scan: false,
      ScanResult: true
    })
    if (check === 'http') {
      Linking
        .openURL(e.data)
        .catch(err => console.error('An error occured', err));
    } else {
      this.setState({
        result: e,
        scan: false,
        ScanResult: true
      })
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
    const { scan, ScanResult, result } = this.state
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
          <View style={{alignSelf: 'center', justifyContent: 'center', alignItems: 'center'}}>
            <Text>Result !</Text>
            <Text>Type:{result.type}</Text>
            <Text>Result:{result.data}</Text>
            <Text numberOfLines={1}>RawData:{result.rawData}</Text>

            <Button onPress={this.scanAgain} title="Click to Scan again!" />
          </View>
        }

        {scan &&
          <QRCodeScanner
            reactivate={true}
            showMarker={true}
            fadeIn={false}
            notAuthorizedView={<Text style={{alignSelf: 'center'}}>Need camera permission. Go to settings please.</Text>}
            ref={(node) => { this.scanner = node }}
            onRead={this.onSuccess}
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

export default App;