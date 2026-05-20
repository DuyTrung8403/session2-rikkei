CREATE DATABASE LibraryDB;
CREATE SCHEMA library;

CREATE TABLE library.Books(
    book_id BIGSERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    author VARCHAR(50) NOT NULL,
    published_year INT,
    price FLOAT
);

ALTER TABLE library.Books
ADD COLUMN created_at TIMESTAMP DEFAULT (now());

DROP TABLE library.Books;
