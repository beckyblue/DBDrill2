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