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