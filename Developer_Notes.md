Nouns	             | Property or owner of property?
	
Account            | Owner
Deposit	           | Property
Withdrawal         | Property
Date of Deposit	   | Property
Date of Withdrawal | Property
Bank_Statement	   | Property



Actions            | Owned by?
	
make_a_deposit     | Account
make_a_withdrawal  | Account
print_statement    | Account


Input                            |   Output
account.make_deposit(500.00)     |   'Deposit 04/05/2021: £500.00'
account.make_withdrawal(100.00)  |   'Withdrawal 04/05/2021: £100.00'
account.statement                |   date       || credit    || debit   || balance
                                 |  05/05/2021 || 100.00 || 0.00 || 100.00 
                                 |  05/05/2021 || 0.00 || 50.00 || 150.00