@isTest
private class CreateAccountAndOpportunityTriggerTest {
	 @isTest static void TestCreateNewOpportunityInBulk() {
        // Test Setup data
        
        //Create date
        Date dateRevenue = date.newInstance(2022, 01, 23);
               
        List<Account> accs = new List<Account>();
        for(Integer i=0; i < 100; i++) {
            Account acc = new Account(Name='Account test ' + i, Submit_Annual_Revenue_Date__c = dateRevenue, AnnualRevenue = 15000);
            accs.add(acc);
        }   
        
        // Perform Test
        Test.startTest();
        insert accs;                               
        Test.stopTest();
           
        //verify that 100 new Accounts were inserted
        List<Account> verifyAccs = [SELECT Id FROM Account];
        System.assertEquals(100, verifyAccs.size());
        
        //verify that 100 new Opportunities were inserted
        List<Opportunity> verifyOpps = [SELECT Id FROM Opportunity];
        System.assertEquals(100, verifyOpps.size());

        
        //verify that they were triggered correctly
        List<Opportunity> verifyTrigger = [SELECT Colour_Flag__c FROM Opportunity];
        for (Opportunity o : verifyTrigger){
            System.assertEquals('YELLOW', o.Colour_Flag__c , 'ERROR');
        }
        
    }
}