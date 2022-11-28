use dbBankGM
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Calculating compoud interst>
-- =============================================

ALTER procedure spCompoudInterest
	@principle money,
	@interestRate float,
	@periodInYears smallint

AS
BEGIN
	SET NOCOUNT ON;	

	declare @totalAmount money
	set @totalAmount =  @principle * (power( 1 + ( @interestRate/100 ), @periodInYears))

	declare @timeInMonths smallint
	set @timeInMonths = @periodInYears * 12

	declare @interestAmount money
	set @interestAmount  = @totalAmount - @principle 

	declare @monthlyPayments int
	set @monthlyPayments =  @totalAmount/@timeInMonths

	declare @currentDate date
	set @currentDate = getDate()

	print '---------------------------------------------------------------------------------'
	print 'SL NO' + SPACE(10) + ' Due Date' + space(10) + 'Monthly Amount'
	print '---------------------------------------------------------------------------------'

	--loop

	declare @incr int
	set @incr = 0

	while @incr < @timeInMonths + 1
		begin
			print cast(@incr as varchar ) + space(10) + cast(dateadd(mm, @incr, @currentDate) as varchar ) + space(10) + cast( @monthlyPayments as varchar )
			set @incr = @incr + 1
		end

	print '---------------------------------------------------------------------------------'
	print 'Grand Total: ' + Space(10) + cast(@interestAmount as varchar)
	print '---------------------------------------------------------------------------------'

END
GO

exec  spCompoudInterest  1000000, 15, 3

