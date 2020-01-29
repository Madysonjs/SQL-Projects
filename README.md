## Library Database
I developed this relational database as a library management system to catalogue books,
authors, publishers, borrowers, branches and branch inventory. I have include snippets of my code below.

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
