SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[cron_matchesmonth](@expression VARCHAR(70), @date DATETIME)
RETURNS BIT
AS
BEGIN
	IF(dbo.cron_isbasicmatch(@expression, DATEPART(MONTH, @date)) = 1)
		RETURN 1
	DECLARE @month AS INT = (CASE @expression
		WHEN 'JAN' THEN 1
		WHEN 'FEB' THEN 2
		WHEN 'MAR' THEN 3
		WHEN 'APR' THEN 4
		WHEN 'MAY' THEN 5
		WHEN 'JUN' THEN 6
		WHEN 'JUL' THEN 7
		WHEN 'AUG' THEN 8
		WHEN 'SEP' THEN 9
		WHEN 'OCT' THEN 10
		WHEN 'NOV' THEN 11
		WHEN 'DEC' THEN 12
		ELSE NULL
		END);

	RETURN IIF(@month = DATEPART(MONTH, @date), 1, 0)
END