@IsTest
private class testclass {
@IsTest
static void should_create_account() {
String acctName = 'Gyansys';
String acctNumber = 'salesforce';
String tickerSymbol = 'CRM';
Test.startTest();
apexclass service = new apexclass();
Account newAcct = service.createAccount( acctName, acctNumber, tickerSymbol );
insert newAcct;
Test.stopTest();
List<Account> accts = [ SELECT Id, Name, AccountNumber, TickerSymbol FROM Account WHERE Id = :newAcct.Id ];
System.assertEquals( 1, accts.size(), 'should have found new account' );
System.assertEquals( acctName, accts[0].Name, 'incorrect name' );
System.assertEquals( acctNumber, accts[0].AccountNumber, 'incorrect account number' );
System.assertEquals( tickerSymbol, accts[0].AccountNumber, 'incorrect ticker symbol' );
}
}
