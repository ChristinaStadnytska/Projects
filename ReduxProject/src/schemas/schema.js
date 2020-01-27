import Realm from 'realm';

const ARTICLE_SCHEMA = 'Article';

const ArticleSchema = {
  name: ARTICLE_SCHEMA,
  properties: {
    sourceName: 'string?',
    title: 'string',
    publishedAt: 'date',
    description: 'string?',
    author: 'string?',
    url: 'string',
    urlToImage: 'string?'
  }
};

const schemaVersion = 0;
const realm = new Realm ({
  schema: [ArticleSchema],
  schemaVersion,
  migration: (oldRealm, newRealm) => {
    if (oldRealm.schemaVersion < schemaVersion) {
      const oldObjects = oldRealm.objects('Article');
      const newObjects = newRealm.objects('Article');
      
      for (let i = 0; i < oldObjects.length; i++) {
        newObjects[i] = {...oldObjects[i]};
      }
    }
  }
});

export default realm;