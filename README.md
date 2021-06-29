# Description:

A simulation of a primitive banking system that allows the user to create bank accounts for clients, and allow them to do some of the bank transactions.
The client can have multiple accounts with different types and the clients should be able to:
  1. Display their current balance
  2. Deposit money
  3. Draw money
  4. Transfer money to other accounts within the bank
  5. Pay utility bills
  6. Other transactions you would like to add.

But, once the clients’ accounts are created, they must be saved in a text file, so we don't need to enter their data anymore. But the system must be able to change their data if needed.
Always when the user wants to use the system must get a menu to choose the required option, and maybe after choosing the menu there is a sub-menu popup.
The system can do the following:
  1. Let the user create accounts in different types
  2. Let the user enter details about the clients and accounts according to the account type
  3. Save all the details in a file.
  4. Let the user be able to read and change the details
  5. Let the user be able to perform the above transactions
  6. Any other tasks you would like to add

# Test data
In the documents directory of the mac system

## client.txt
```bash
1234567,Rick Sanchez,816090234,1683  Findlay Creek Road
7654321,Morty Smith,2504299690,1683  Findlay Creek Road
6543217,Summer Smith,4162293911,4095  Dundas St
```
## acounts.txt
```bash
111987654,1234567,savings,1300.0,false
111123456,1234567,checking,500.0,true
222654321,6543217,savings,700.0,false
```
## transaction.txt
```bash
111123456,deposit,4123,1000.0
111123456,draw,198,100.0
111987654,deposit,171,2000.0
111987654,transfer out,3745,-200.0
111123456,transfer in,3818,200.0
111123456,draw,1510,450.0
111123456,deposit,7345,100.0
111987654,transfer out,8413,-500.0
222654321,transfer in,7733,500.0
111123456,payment,7067,50.0
111123456,transfer out,4403,-200.0
222654321,transfer in,1956,200.0
222654321,draw,8756,80.0
```
