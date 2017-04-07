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