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

