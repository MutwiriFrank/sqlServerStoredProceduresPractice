-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
alter PROCEDURE spCreateFixedSavingPlus 
	-- Add the parameters for the stored procedure here
	@currentAmount money,
	@Amount money ,
	@timeInYears  smallInt 
	--@interestRate smallint 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @targetAmount money
	set @targetAmount = @Amount

	DECLARE @monthlyAmount money
	set @monthlyAmount = @targetAmount/ (@timeInYears * 12 )

	DECLARE @currentDate datetime
	SET @currentDate = GETDATE()

--	DECLARE @totalInterest money
	--SET @totalInterest  = @

	DECLARE @timeInMonths int
	set @timeInMonths = @timeInYears * 12

	DECLARE @years int
	set @years = @timeInYears

	Declare @incr int
    
	-- display table 
	print'-----------------------------------------------------------------------------'
	print space (30) + 'KCB BANK '
	print'-----------------------------------------------------------------------------'
	print ''
	print space (5) + 'Dear Customer '
	print ''
	print'-----------------------------------------------------------------------------'
	print space (30) + 'KCB Saving Plan '
	print'-----------------------------------------------------------------------------'

	PRINT  space (5) + 'Target Amount' + space(30) + cast(@targetAmount as varchar) --  + 'Time in Months'  + cast(@timeInMonths)
	PRINT  space (5) +  'Time in Months' + space(30)   + cast(@timeInMonths as varchar)
	print'-----------------------------------------------------------------------------'
	print space (5) + 'Monthly Plan '
	print'-----------------------------------------------------------------------------'

	print   space (5) + 'LTR' +space(30)+ 'date'    + space(25) + 'Amount'
	print'-----------------------------------------------------------------------------'
	--loop
	set @incr = 1
	while @incr <  @timeInMonths

	begin
		print   space (5) + cast(@incr as varchar) +space(22)+ cast(dateadd(mm, @incr, @currentDate) as varchar)   + space(20) + cast((@targetAmount-@currentAmount)/@timeInMonths   as varchar) 
		set @incr = @incr + 1

		print'-----------------------------------------------------------------------------'
		

	end
	print'-----------------------------------------------------------------------------'
	print 'Grand Total: ' + Space(10) + cast(@targetAmount as varchar) + '    in years     ' + cast( @years as varchar ) 
	print'-----------------------------------------------------------------------------'

	print'-----------------------------------------------------------------------------'
	print space (20) + 'THANK YOU FOR BANKKING WITH US '
	print'-----------------------------------------------------------------------------'
END
GO

exec dbo.spCreateFixedSavingPlus 0, 1000000, 1