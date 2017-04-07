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