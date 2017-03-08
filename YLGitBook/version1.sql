//DROP TABLE IF EXISTS book_info;
//DROP TABLE IF EXISTS author_info;

CREATE TABLE IF NOT EXISTS book_info (id TEXT, status TEXT, name TEXT, title TEXT, book_description TEXT, is_public BOOL, topics TEXT, license TEXT, Language TEXT, bulid TEXT, created TEXT, author_id TEXT, PRIMARY KEY(id));

CREATE TABLE IF NOT EXISTS author_info (id TEXT, type TEXT, name TEXT, username TEXT, website TEXT, bio TEXT, profile TEXT, stars TEXT, avatar TEXT, book_id TEXT, PRIMARY KEY (id));

CREATE TABLE IF NOT EXISTS author_cover (id INTEGER, large TEXT, small TEXT, book_id TEXT, PRIMARY KEY (id));

CREATE TABLE IF NOT EXISTS author_download (id INTEGER, epub TEXT, mobi TEXT, pdf TEXT, book_id TEXT, PRIMARY KEY (id));

CREATE TABLE IF NOT EXISTS author_urls (id INTEGER, profile TEXT, stars TEXT, avatar TEXT, author_id TEXT, PRIMARY KEY (id));
