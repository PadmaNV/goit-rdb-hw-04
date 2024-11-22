create schema LibraryManagement;

create table authors(
	author_id int auto_increment primary key, 
    author_name varchar (225)
    );
    
create table genres(
	genre_id int auto_increment primary key,
    genre_name varchar(225)
    );
    
create table books(
	books_id int auto_increment primary key,
	title varchar (56),
	publication_year  year,
	author_id int, 
		foreign key (author_id) references authors(author_id),
	genre_id int, 
		foreign key (genre_id) references genres(genre_id)
	);

create table users(
	user_id int auto_increment primary key,
    username varchar(54),
	email varchar(54)
    );
    
create table borrowed_books(
	borrow_id int auto_increment primary key,
	book_id int,
		foreign key (book_id) references books(books_id),
	user_id int,
		foreign key (user_id) references users(user_id),
	borrow_date date,
	return_date date
	);
    