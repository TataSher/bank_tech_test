# Bank tech test

This program will allow a user to do the following:

* Deposit funds
* Withdraw funds
* Print an account statement with a date, amount and balance

The user can interact with the program via a REPL like IRB.
User Data is kept in memory (it is not stored in a database)

### User Instructions

1. Clone the repository
2. Use <bundle install> to install the gems in the Gemfile
3. Open the REPL (IRB or similar)
4. require './lib/account.rb''


### An example of how the program can be used.

**Given** a client makes a deposit of 1000 on 10-01-2012  
**And** a deposit of 2000 on 13-01-2012  
**And** a withdrawal of 500 on 14-01-2012  
**When** she prints her bank statement  
**Then** she would see

```
date       || credit    || debit   || balance
14/01/2012 ||           || 500.00  || 2500.00
13/01/2012 || 2000.00   ||         || 3000.00
10/01/2012 || 1000.00   ||         || 1000.00
```

Input                            |   Output
account.make_deposit(500.00)     |   'Deposit 04/05/2021: £500.00'
account.make_withdrawal(100.00)  |   'Withdrawal 04/05/2021: £100.00'