/*Library branch is connected to book loans via brand id
publisher is connected to books via publisher name
books is connected to book author, book copies, and book loans via book id
borrower is connected to book loans via card number
is it is in the book loans table it is out of the library*/

use db_zootest2

create table library_branch (
BranchID int primary key not null identity (1,1),
BranchName varchar(50) not null,
Address varchar(50) not null);

create table publisher (
PublisherName varchar(50) primary key not null,
Address varchar(50) not null,
Phone varchar(50) not null);

create table books( 
BookID int primary key not null identity (100,100),
Title varchar(80) not null,
PublisherName varchar(50) not null foreign key references publisher(PublisherName));

create table book_author (
BookID int not null foreign key references books(BookID),
AuthorName varchar(50) not null);

create table book_copies (
BookID int not null foreign key references books(BookID),
BranchID int not null foreign key references library_branch(BranchID),
Number_of_Copies int not null);

create table borrower (
CardNo int not null primary key identity (1000,100),
Name varchar(50) not null,
Address varchar(50) not null,
Phone varchar(50) not null);

create table book_loans (
BookID int not null foreign key references books(BookID),
BranchID int not null foreign key references library_branch(BranchID),
CardNo int not null foreign key references borrower(CardNo),
Dateout date not null,
Datedue date not null);



insert into library_branch
	(BranchName, Address)
	values
	('Sharpstown', '345 S Main St'),
	('Central', '954 NE MLK ST'),
	('Downtown', '100 N 1st Ave'),
	('Minden', '21 SW Wood Cir');

insert into publisher
	(PublisherName, Address, Phone)
	values
	('Penguin', '473 SW 6th Ave', '285-387-9009'),
	('Tollhouse', '846 Midas Dr', '285-593-7593'),
	('Pint', '7738 E Randal St', '285-999-4753'),
	('G&W', '128 NW 59th St', '285-695-3455'),
	('Spirit', '10 N Spooky Way', '285-500-0000');

insert into books
	(Title, PublisherName)
	values
	('The Lost Tribe', 'Penguin'),
	('IT', 'Tollhouse'),
	('The Institute', 'Pint'),
	('Modern Romance', 'G&W'),
	('Ready Player One', 'Penguin'),
	('Big Little Lies', 'Spirit'),
	('The Giving Tree', 'Pint'),
	('Good Omens', 'Spirit'),
	('The Great Gatsby', 'Penguin'),
	('The Girl on the Train', 'Pint'),
	('Becoming', 'G&W'),
	('To Kill a Mocking Bird', 'G&W'),
	('Pride and Predjudice', 'Tollhouse'),
	('The Alchemist', 'Tollhouse'),
	('The Hate You Give', 'Pint'),
	('1984', 'Tollhouse'),
	('Lord of the Flies', 'Tollhouse'),
	('Of Mice and Men', 'Spirit'),
	('Gone', 'Penguin'),
	('Tilt', 'G&W');

	insert into book_author
	(BookID, AuthorName)
	values
	(100, 'Edward Marriot'),
	(200, 'Stephen King'),
	(300, 'Stephen King'),
	(400, 'Aziz Ansari'),
	(500, 'Ernest Cline'),
	(600, 'Liane Moriaty'),
	(700, 'Shel Siverstien'),
	(800, 'Niel Gaiman'),
	(900, 'Scott Fitzgerald'),
	(1000, 'Paula Hawkings'),
	(1100, 'Michelle Obama'),
	(1200, 'Harper Lee'),
	(1300, 'Jane Austen'),
	(1400, 'Paulo Coelho'),
	(1500, 'Angie Thomas'),
	(1600, 'George Orwell'),
	(1700, 'William Golding'),
	(1800, 'John Steinbeck'),
	(1900, 'Michael Grant'),
	(2000, 'Ellen Hopkins');

insert into book_copies 
	(BookID, BranchID, Number_of_Copies)
	values
	(100, 1, 2),
	(200, 1, 2),
	(300, 1, 2),
	(400, 1, 2),
	(500, 1, 2),
	(600, 1, 2),
	(700, 1, 2),
	(800, 1, 2),
	(900, 1, 2),
	(1000, 1, 2),
	(100, 2, 2),
	(200, 2, 2),
	(1100, 2, 2),
	(1200, 2, 2),
	(1300, 2, 2),
	(1400, 2, 2),
	(1500, 2, 2),
	(1600, 2, 2),
	(1700, 2, 2),
	(1800, 2, 2),
	(2000, 3, 2),
	(1900, 3, 2),
	(1700, 3, 2),
	(500, 3, 2),
	(1300, 3, 2),
	(1200, 3, 2),
	(1500, 3, 2),
	(200, 3, 2),
	(900, 3, 2),
	(500, 3, 2),
	(600, 4, 2),
	(800, 4, 2),
	(1700, 4, 2),
	(700, 4, 2),
	(100, 4, 2),
	(1300, 4, 2),
	(700, 4, 2),
	(200, 4, 2),
	(300, 4, 2),
	(1000, 4, 2);
	
insert into borrower
	(Name, Address, Phone)
	values
	('Mike', '124 Jefferson St', '338-856-4859'),
	('Tessa', '573 Bates Dr', '847-563-9999'),
	('Steph', '4775 7th St', '573-385-0093'),
	('David', '3504 24th Ave', '583-586-3956'),
	('Kari', '789 4th Pl', '683-692-0092'),
	('Jeff', '652 Baker St', '384-673-5983'),
	('Naj', '563 SW 5th Ave', '583-682-5882'),
	('Jess', '869 N Slater Dr', '588-824-0294'),
	('Matt', '3333 Vive Dr', '777-394-0000');

insert into book_loans
	(BookID, BranchID, CardNo, Dateout, Datedue)
	values
	(400, 1, 1000, '2019-10-31', '2019-11-30'),
	(700, 1, 1000, '2019-10-31', '2019-11-30'),
	(500, 1, 1000, '2019-10-31', '2019-11-30'),
	(100, 2, 1000, '2019-11-01', '2019-12-01'),
	(1400, 2, 1000, '2019-10-31', '2019-11-30'),
	(1700, 2, 1000, '2019-10-31', '2019-11-30'),
	(2000, 3, 1100, '2019-10-31', '2019-11-30'),
	(500, 3, 1100, '2019-10-31', '2019-11-30'),
	(1200, 3, 1100, '2019-10-31', '2019-11-30'),
	(900, 3, 1100, '2019-10-31', '2019-11-30'),
	(1300, 3, 1100, '2019-10-31', '2019-11-30'),
	(600, 4, 1100, '2019-10-31', '2019-11-30'),
	(1700, 3, 1100, '2019-10-31', '2019-11-30'),
	(1600, 2, 1100, '2019-10-31', '2019-11-30'),
	(1500, 2, 1200, '2019-10-31', '2019-11-30'),
	(100, 2, 1200, '2019-10-31', '2019-11-30'),
	(200, 2, 1200, '2019-10-31', '2019-11-30'),
	(1800, 2, 1200, '2019-10-31', '2019-11-30'),
	(1200, 2, 1200, '2019-10-31', '2019-11-30'),
	(200, 3, 1300, '2019-10-31', '2019-11-30'),
	(500, 3, 1300, '2019-10-31', '2019-11-30'),
	(1700, 3, 1300, '2019-10-31', '2019-11-30'),
	(1900, 3, 1300, '2019-10-31', '2019-11-30'),
	(1200, 3, 1300, '2019-10-31', '2019-11-30'),
	(1500, 3, 1300, '2019-10-31', '2019-11-30'),
	(1000, 1, 1400, '2019-10-31', '2019-11-30'),
	(900, 1, 1400, '2019-10-31', '2019-11-30'),
	(800, 1, 1400, '2019-10-31', '2019-11-30'),
	(700, 1, 1400, '2019-10-31', '2019-11-30'),
	(600, 1, 1400, '2019-10-31', '2019-11-30'),
	(500, 1, 1400, '2019-10-31', '2019-11-30'),
	(1000, 4, 1500, '2019-10-31', '2019-11-30'),
	(300, 4, 1500, '2019-10-31', '2019-11-30'),
	(200, 4, 1500, '2019-10-31', '2019-11-30'),
	(700, 4, 1500, '2019-10-31', '2019-11-30'),
	(1300, 4, 1500, '2019-10-31', '2019-11-30'),
	(100, 4, 1500, '2019-10-31', '2019-11-30'),
	(700, 4, 1500, '2019-10-31', '2019-11-30'),
	(1700, 4, 1600, '2019-10-31', '2019-11-30'),
	(800, 4, 1600, '2019-10-31', '2019-11-30'),
	(600, 4, 1600, '2019-10-31', '2019-11-30'),
	(1500, 2, 1600, '2019-10-31', '2019-11-30'),
	(1200, 2, 1700, '2019-10-31', '2019-11-30'),
	(1700, 2, 1700, '2019-10-31', '2019-11-30'),
	(900, 1, 1700, '2019-10-31', '2019-11-30'),
	(600, 1, 1700, '2019-10-31', '2019-11-30'),
	(2000, 3, 1700, '2019-10-31', '2019-11-30'),
	(1500, 3, 1700, '2019-10-31', '2019-11-30'),
	(800, 4, 1700, '2019-10-31', '2019-11-30'),
	(500, 4, 1700, '2019-10-31', '2019-11-30');

select * from library_branch
select * from book_loans
select * from books
select * from book_copies
select * from publisher
select * from book_author
select * from borrower

select books.title, book_copies.Number_of_Copies, library_branch.BranchName 
	from books
	inner join book_copies on book_copies.BookID = books.BookID
	inner join library_branch on library_branch.BranchID = book_copies.BranchID
	where library_branch.BranchID = 1 and books.BookID = 100

select books.title, book_copies.Number_of_Copies, library_branch.BranchName 
	from books
	inner join book_copies on book_copies.BookID = books.BookID
	inner join library_branch on library_branch.BranchID = book_copies.BranchID
	where books.BookID = 100

select borrower.name, borrower.CardNo
	from borrower
	where borrower.CardNo not in(select book_loans.CardNo from book_loans)


select books.title, borrower.Name, borrower.Address 
	from book_loans
	inner join borrower on borrower.CardNo = book_loans.CardNo
	inner join books on books.BookID = book_loans.BookID
	where book_loans.Datedue = GETDATE()
	

select library_branch.branchname, count(book_loans.bookid) as 'Books Loaned'
	from library_branch
	inner join book_loans on book_loans.branchid = library_branch.branchid
	group by library_branch.BranchName



select borrower.Name, borrower.Address, COUNT(book_loans.bookid) as '# of Books Out'
	from borrower
	left join book_loans on book_loans.CardNo = borrower.CardNo
	group by borrower.Name, borrower.Address
	having COUNT(book_loans.BookID) > 5

	
select books.Title, book_copies.Number_of_Copies 
	from  books
	inner join book_copies on book_copies.BookID = books.BookID
	inner join book_author on book_author.BookID = books.BookID
	inner join library_branch on library_branch.BranchID = book_copies.BranchID
	where book_author.AuthorName = 'Stephen King' and library_branch.BranchName = 'Central'








