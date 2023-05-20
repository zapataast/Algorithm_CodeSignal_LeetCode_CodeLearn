CREATE PROCEDURE powerappv4get
    @var1 NVARCHAR(255),@year NVARCHAR(5), @month NVARCHAR(3)
AS
BEGIN
    DECLARE @sql NVARCHAR(MAX);

    SET @sql = N'
    SELECT d2.BADGENUMBER AS fingerid, d1.CHECKTIME AS date
    FROM [ZKSoft].[dbo].[CHECKINOUT] d1
    LEFT JOIN USERINFO AS d2 ON d1.USERID = d2.USERID
    WHERE YEAR(d1.CHECKTIME) = '+@year+'
      AND MONTH(d1.CHECKTIME) = '+@month+'
      AND d2.BADGENUMBER IN (' + @var1 + ')';

    EXEC sp_executesql @sql;
END;
