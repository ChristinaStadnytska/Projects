import { StyleSheet } from 'react-native';

const styles = StyleSheet.create({
    safeArea: {
        backgroundColor: '#F0F8FF',
        flex: 1,
    },
    container: {
        margin: 20,
    },
    title: {
        alignSelf: 'center',
        fontSize: 20,
    },
    textContainer: {
        justifyContent: 'space-between',
        flexDirection: 'row',
        margin: 10,
    },
    publishedAt: {
        color: '#C0C0C0',
        fontSize: 14,
    },
    source: {
        color: '#C0C0C0',
        fontSize: 14,
        fontStyle: 'italic',
    },
    image: {
        overflow: 'hidden',
        borderRadius: 10,
        alignSelf: 'stretch',
        height: 300,
        margin: 5,
    },
    description: {
        fontSize: 16,
        margin: 10,
    },
    author: {
        alignSelf: 'flex-end',
        color: '#C0C0C0',
        fontSize: 14,
    },
    activityIndicator: {
        alignSelf: 'center',
        marginTop: 30,
    },
})

export default styles;