public with sharing class CreateAccountHandler {
    
    public static void createOpportunitiesFromAccounts(List<Account> accounts){
        List<Opportunity> opps = new List<Opportunity>();
        for(Account a : accounts){
            Opportunity opp = new Opportunity();
            opp.Name = a.Name + ' Opportunity';
            opp.AccountId = a.Id;
            opp.StageName = 'Prospecting';
            opp.Annual_Revenue__c = a.AnnualRevenue;
            opp.Submit_Annual_Revenue__c = a.Submit_Annual_Revenue_Date__c;
            opp.CloseDate = System.Today().addMonths(1);
            opps.add(opp);
        }

        if(opps.size() > 0){
           insert opps;
        }
    }
}