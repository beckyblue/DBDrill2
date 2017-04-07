//****** DRILL 1 ******//


USE DbDrill
GO

CREATE PROCEDURE dbo.Sharpstown_Copies
AS

SELECT dbo.Book.Title, dbo.Book_Copies.Copies, dbo.Library_Branch.BranchName
FROM dbo.Book
INNER JOIN dbo.Book_Copies
ON dbo.Book.BookID=dbo.Book_Copies.BookID
INNER JOIN dbo.Library_Branch
ON dbo.Book_Copies.BranchID=dbo.Library_Branch.BranchID

WHERE BranchName = 'Sharpstown'
AND Title = 'The Lost Tribe'

GO

EXEC dbo.Sharpstown_Copies


//****** DRILL 1 ******//





//****** DRILL 2 ******//


USE DbDrill
GO

CREATE PROCEDURE dbo.TheLostTribe_Copies_Branchs
AS
SELECT dbo.Book.Title, dbo.Book_Copies.Copies, dbo.Library_Branch.BranchName
FROM dbo.Book
INNER JOIN dbo.Book_Copies
ON dbo.Book.BookID=dbo.Book_Copies.BookID
INNER JOIN dbo.Library_Branch
ON dbo.Book_Copies.BranchID=dbo.Library_Branch.BranchID

WHERE Title= 'The Lost Tribe'

GO

EXEC dbo.TheLostTribe_Copies_Branchs


//****** DRILL 2 ******//




//****** DRILL 3 ******//


USE DbDrill
GO

CREATE PROCEDURE dbo.Barrowers_no_books
AS
SELECT dbo.Borrower.Name, dbo.Book_Loans.DueDate  
From dbo.Borrower
FULL OUTER JOIN dbo.Book_Loans
ON dbo.Borrower.CardNo=dbo.Book_Loans.CardNo

WHERE DueDate IS NULL;

GO

EXEC dbo.Barrowers_no_books


//****** DRILL 3 ******//




//****** DRILL 4A ******//


USE DbDrill
GO

CREATE PROCEDURE dbo.Sharpstown_DateDue_Today
AS
SELECT dbo.Library_Branch.BranchName, dbo.Book_Loans.DueDate, dbo.Book.Title, dbo.Borrower.Name, dbo.Borrower.[Address] 
FROM dbo.Library_Branch

INNER JOIN dbo.Book_Loans
ON dbo.Library_Branch.BranchID=dbo.Book_Loans.BranchID

INNER JOIN dbo.Borrower
ON dbo.Borrower.CardNo=dbo.Book_Loans.CardNo

INNER JOIN dbo.Book
ON dbo.Book_Loans.BookID=dbo.Book.BookID

WHERE DueDate= '2016-12-08'
AND BranchName = 'Sharpstown'

GO

EXEC dbo.Sharpstown_DateDue_Today


//****** DRILL 4A ******//




//****** DRILL 4B ******//


USE DbDrill
GO

CREATE PROCEDURE dbo.Sharpstown_TodayCurrent_DueDate
AS
SELECT dbo.Library_Branch.BranchName, dbo.Book_Loans.DueDate, dbo.Book.Title, dbo.Borrower.Name, dbo.Borrower.[Address] 
FROM dbo.Library_Branch

INNER JOIN dbo.Book_Loans
ON dbo.Library_Branch.BranchID=dbo.Book_Loans.BranchID

INNER JOIN dbo.Borrower
ON dbo.Borrower.CardNo=dbo.Book_Loans.CardNo

INNER JOIN dbo.Book
ON dbo.Book_Loans.BookID=dbo.Book.BookID

WHERE DueDate=CURRENT_TIMESTAMP
AND BranchName = 'Sharpstown'
GO

EXEC dbo.Sharpstown_TodayCurrent_DueDate


//****** DRILL 4B ******//



//****** DRILL 5 ******//

USE DbDrill
GO

CREATE PROCEDURE dbo.Branch_BooksOut
AS
SELECT dbo.Library_Branch.BranchName, COUNT(*) [Books Out]
FROM dbo.Library_Branch
INNER JOIN dbo.Book_Loans
ON dbo.Book_Loans.BranchID=dbo.Library_Branch.BranchID

GROUP BY dbo.Library_Branch.BranchName

GO

EXEC dbo.Branch_BooksOut


//****** DRILL 5 ******//





//****** DRILL 6 ******//

USE DbDrill
GO

CREATE PROCEDURE dbo.Borrower_FivePlusBooks
AS
SELECT dbo.Borrower.Name, dbo.Borrower.[Address], COUNT(*) [ Books Out]
FROM dbo.Book_Loans
INNER JOIN dbo.Borrower
ON dbo.Book_Loans.CardNo=dbo.Borrower.CardNo

GROUP BY dbo.Borrower.Name, dbo.Borrower.[Address]

HAVING COUNT(*) > 5

GO

EXEC dbo.Borrower_FivePlusBooks

//****** DRILL 6 ******//





//****** DRILL 7 ******//

USE DbDrill
GO

CREATE PROCEDURE dbo.StephenKing_CentralBooks_Copies
AS
SELECT dbo.Library_Branch.BranchName, dbo.Book.Title, dbo.Book_Authors.AuthorName, dbo.Book_Copies.Copies
FROM dbo.Book_Authors
INNER JOIN dbo.Book
ON dbo.Book_Authors.BookID=dbo.Book.BookID
INNER JOIN Book_Copies
ON dbo.Book.BookID=Book_Copies.BookID

CROSS JOIN dbo.Library_Branch
WHERE BranchName= 'Central'
AND AuthorName='Stephen King'

GO

EXEC dbo.StephenKing_CentralBooks_Copies


//****** DRILL 7 ******//