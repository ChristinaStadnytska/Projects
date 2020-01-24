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

const realm = new Realm ({
  schema: [ArticleSchema],
});

export default realm;