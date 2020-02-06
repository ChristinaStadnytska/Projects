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
      timePassed: false,
      showMask: false,
      x: 0,
      y: 0,
    };
  }

  showMask = (e) => {
    this.setState({
      width: e.bounds.size.width,
      height: e.bounds.size.height,
      x: e.bounds.origin.x,
      y: e.bounds.origin.y,
      showMask: true,
    })
  }

  onSuccess = (e) => {
    const check = e.data.substring(0, 4);
    console.log('scanned data' + check);
    // if (!showMask) {
    //   this.setState({
    //     result: e,
    //     scan: false,
    //     ScanResult: true,
    //   })
    //   if (check === 'http') {
    //     Linking
    //       .openURL(e.data)
    //       .catch(err => console.error('An error occured', err));
    //   }  
    // }

    // ------------- old version --------------
    this.setState({
      result: e,
      scan: false,
      ScanResult: true,
      showMask: false,
    })
    if (check === 'http') {
      Linking
        .openURL(e.data)
        .catch(err => console.error('An error occured', err));
    } else {
      this.setState({
        result: e,
        scan: false,
        ScanResult: true,
        showMask: false,
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
            <View style={{ width: parseInt(width), height: parseInt(height), backgroundColor: 'yellow' }}></View>

            <Button onPress={this.scanAgain} title="Click to Scan again!" />
          </View>
        }

        {showMask &&
          // <QRCodeScanner
          //   onRead={this.onSuccess}
          //   reactivate={true}
          //   showMarker={true}
          //   fadeIn={false}
          //   notAuthorizedView={<Text style={{ alignSelf: 'center' }}>Need camera permission. Go to settings please.</Text>}
          //   ref={(node) => { this.scanner = node }}
          //   bottomContent={
          //     <View>
          //       <Button
          //         title="OK. Got it!"
          //         onPress={() => this.scanner.reactivate()}
          //       />
          //       <Button
          //         title="Stop Scan"
          //         onPress={() => this.setState({ scan: false })}
          //       />
          //     </View>
          //   }
          // >
            <View style={{ width: parseInt(width), height: parseInt(height), left: parseInt(x), top: parseInt(y) + parseInt(height) * 2, position: 'absolute', zIndex: 1000, backgroundColor: 'yellow' }}></View>
            // setTimeout(() => { this.setState({ timePassed: true }) }, 2000)
          // </QRCodeScanner>
        }

        {scan &&
          <QRCodeScanner
            onRead={this.showMask}
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