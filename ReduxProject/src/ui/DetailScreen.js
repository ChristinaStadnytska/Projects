import React, { PureComponent } from 'react';
import { SafeAreaView, View } from 'react-native';
import { Text, Image } from 'react-native-elements';
import { connect } from 'react-redux';
import Moment from 'moment';
import styles from './style';
import { ScrollView } from 'react-native-gesture-handler';

class DetailScreen extends PureComponent {

  static navigationOptions = {
    headerTitle: 'Detail News',
    headerStyle: {
      shadowColor: '#C0C0C0',
      shadowOpacity: 0.2,
      shadowOffset: {height: 0},
      shadowRadius: 0,
      elevation: 5,
    },
  };

  render() {
    const { title, publishedAt, source, urlToImage, description, author } = this.props.navigation.state.params;
    return (
      <SafeAreaView style={styles.safeArea}>
        <ScrollView style={styles.container}>
          <Text style={styles.title}>{title ? title : ''}</Text>
          <View style={styles.textContainer}>
            <Text style={styles.publishedAt}>{Moment(publishedAt ? publishedAt : '').format('MMMM Do YYYY, h:mm a')}</Text>
            <Text style={styles.source}>{source.name ? source.name : ''}</Text>
          </View>
          <Image
            containerStyle={styles.image}
            source={{ uri: urlToImage ? urlToImage : '' }} />
          <Text style={styles.description}>{description ? description : ''}</Text>
          <Text style={styles.author}>{author ? author : ''}</Text>
        </ScrollView>
      </SafeAreaView>
    );
  }
}

const mapDispatchToProps = {};

const mapStateToProps = state => ({});

export default connect(
  mapStateToProps,
  mapDispatchToProps,
)(DetailScreen);
