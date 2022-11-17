
use dbBankGM
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE  loanStatement
	-- Add the parameters for the stored procedure here
	@LoanAmount money,
	@roi int = 16,  -- default values
	@tenureInYears tinyint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	--declare the loandate
	declare @LoanDate datetime
	set @LoanDate = getdate()

    -- ddeclare and calculate interest
	declare @interest money

	set @interest =  (@LoanAmount * @tenureInYears  * @roi/100)

	-- calculate total amount
	declare @totalAmount money
	set @totalAmount = (@interest +@LoanAmount)

	--calculati monthlyAmount to be paid
	declare @EMI money
	set @EMI  = @totalAmount/(@tenureInYears *12)

	-- Dispaly EMI table
	print '---------------------------------------------------------------------------------'
	print 'SL NO' + SPACE(10) + 'EMI Due Date' + space(10) + 'Monthly Amount'
	print '---------------------------------------------------------------------------------'

	--loop
	--start
	declare @incr int
	set @incr = 1

	--condition
	while (@incr < (@tenureInYears*12) )
	begin
		print cast(@incr as varchar ) + space(10) + cast(dateadd(mm, @incr, @LoanDate) as varchar ) + space(10) + cast( @EMI as varchar )
		set @incr = @incr + 1
	end

	print '---------------------------------------------------------------------------------'
	print 'Grand Total: ' + Space(10) + cast(@totalAmount as varchar)
	print '---------------------------------------------------------------------------------'
END
GO


exec loanStatement 1000000, 16, 3