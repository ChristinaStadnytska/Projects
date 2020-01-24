import { StyleSheet } from 'react-native';

const styles = StyleSheet.create({
  container: {
    height: 50,
    flexDirection: 'row',
    justifyContent: 'space-between',
    backgroundColor: 'white',
    shadowColor: '#C0C0C0',
    shadowOffset: {height: 5},
    shadowRadius: 5,
    shadowOpacity: 0.2,
    elevation: 5,
  },
  title: {
    fontSize: 20,
    fontWeight: 'bold',
    flex: 6,
    alignSelf: 'center',
    textAlign: 'center',
  },
  containerStyleSearchBar: {
    backgroundColor: 'transparent',
    borderTopWidth: 0,
    height: 50,
  },
  inputContainerStyleSearchBar: {
    backgroundColor: '#DCDCDC',
  },
  containerStyleFilterButton: {
    marginTop: 4,
    marginRight: 4,
    flex: 2,
  }
});

export default styles;
