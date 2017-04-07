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
