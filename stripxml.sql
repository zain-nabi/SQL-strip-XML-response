	Else if @Lender = 'BMU'
	BEGIN
		UPDATE D_ApplicationDetail SET
			apr = SUBSTRING(@Report,  CHARINDEX('<apr>',@Report) + 5 , (CHARINDEX('</apr>',@Report)) - ( CHARINDEX('<apr>',@Report) + 5 )) , 
			Offer = 'Nominal Rate is ' + SUBSTRING(@Report,  CHARINDEX('<nominal_rate>',@Report) + 14 , (CHARINDEX('</nominal_rate>',@Report)) - ( CHARINDEX('<nominal_rate>',@Report) + 14 )) + '. ' +
		'Loan Amount is £' + SUBSTRING(@Report,  CHARINDEX('<desired_advance>',@Report) + 17 , (CHARINDEX('</desired_advance>',@Report)) - ( CHARINDEX('<desired_advance>',@Report) + 17 )) + '. ' +
		'Loan Term is' + SUBSTRING(@Report,  CHARINDEX('<tenure>',@Report) + 8 , (CHARINDEX('</tenure>',@Report)) - ( CHARINDEX('<tenure>',@Report) + 8 )) + '. ' +
		'Monthly Payment is £' + SUBSTRING(@Report,  CHARINDEX('<monthly_payment>',@Report) + 17 , (CHARINDEX('</monthly_payment>',@Report)) - ( CHARINDEX('<MonthlyPayment>',@Report) + 17 )) + '. ' +
		'Total Charge For Credit is £' + SUBSTRING(@Report,  CHARINDEX('<total_charge_for_credit>',@Report) + 25 , (CHARINDEX('</total_charge_for_credit>',@Report)) - ( CHARINDEX('<total_charge_for_credit>',@Report) + 25 )) + '. ' +
		'Total Amount Payable is £' + SUBSTRING(@Report,  CHARINDEX('<total_amount_payable>',@Report) + 22 , (CHARINDEX('</total_amount_payable>',@Report)) - ( CHARINDEX('<total_amount_payable>',@Report) + 22 )) + '. ' +
		'Total Fees are £' + SUBSTRING(@Report,  CHARINDEX('<total_fees>',@Report) + 12 , (CHARINDEX('</total_fees>',@Report)) - ( CHARINDEX('<total_fees>',@Report) + 12 )) + '. ',
			rate = SUBSTRING(@Report,  CHARINDEX('<nominal_rate>',@Report) + 14 , (CHARINDEX('</nominal_rate>',@Report)) - ( CHARINDEX('<nominal_rate>',@Report) + 14 )) ,
					final_monthly_payment =  SUBSTRING(@Report,  CHARINDEX('<monthly_payment>',@Report) + 17 , (CHARINDEX('</monthly_payment>',@Report)) - ( CHARINDEX('<monthly_payment>',@Report) + 17 )) ,
					final_term = SUBSTRING(@Report,  CHARINDEX('<tenure>',@Report) + 8 , (CHARINDEX('</tenure>',@Report)) - ( CHARINDEX('<tenure>',@Report) + 8 )),
					final_amount = SUBSTRING(@Report,  CHARINDEX('<total_amount_payable>',@Report) + 22 , (CHARINDEX('</total_amount_payable>',@Report)) - ( CHARINDEX('<total_amount_payable>',@Report) + 22 )),
					total_amount_repayable = SUBSTRING(@Report,  CHARINDEX('<total_amount_payable>',@Report) + 22 , (CHARINDEX('</total_amount_payable>',@Report)) - ( CHARINDEX('<total_amount_payable>',@Report) + 22 )),
					max_amount =  SUBSTRING(@Report,  CHARINDEX('<desired_advance>',@Report) + 17 , (CHARINDEX('</desired_advance>',@Report)) - ( CHARINDEX('<desired_advance>',@Report) + 17 )),
					fees = SUBSTRING(@Report,  CHARINDEX('<total_fees>',@Report) + 12 , (CHARINDEX('</total_fees>',@Report)) - ( CHARINDEX('<total_fees>',@Report) + 12 )),
					comments=@Report,
					lenderredirect=SUBSTRING(@Report,  CHARINDEX('</guaranteed_rate><id>',@Report) + 22 , (CHARINDEX('</id><likelihood>',@Report)) - ( CHARINDEX('</guaranteed_rate><id>',@Report) + 22 ))
					
			WHERE ID = @ApplicationDetailID
	END
