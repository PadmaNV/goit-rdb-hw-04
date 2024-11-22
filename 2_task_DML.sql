insert into authors (author_name)
values 
	('Shkspir'),
    ('Gogol'),
    ('Hemingway'),
    ('Sidorenko');
    
insert into genres (genre_name)
values 
	('Fiction'),
    ('Drama'),
    ('Fantasy'),
    ('Mystery'),
    ('Biography'),
    ('History'),
    ('Romance');
    
insert into books (title, publication_year, author_id, genre_id)
values 
	('Hamlet', 1000, 1, 2),
    ('Dead Souls', 1842, 2, 2),
    ('The Old Man and the Sea', 1952, 3, 1),
    ('Life of Ivan Sidorenko', 2024, 4, 6),
    ('Harry Potter', 1997, 3, 3),
    ('Romeo and Juliet', 1597, 1, 7);
    
insert into users (username, email)
values 
	('ivan_petro', 'ivan.petro@ukr.net'),
    ('olena_kozachok', 'olena.kozachok@gmail.com'),
    ('andriy_shevchenko', 'andriy.shevchenko@meta.ua');
    
insert into borrowed_books (book_id, user_id, borrow_date, return_date)
values 
	(1, 1, '2024-11-01', '2024-11-15'), -- "Hamlet", користувач "ivan_petro"
    (2, 2, '2024-11-05', '2024-11-20'), -- "Dead Souls", користувач "olena_kozachok"
    (5, 1, '2024-11-12', '2024-11-30'); -- Книга "Harry Potter", користувач "ivan_petro"
