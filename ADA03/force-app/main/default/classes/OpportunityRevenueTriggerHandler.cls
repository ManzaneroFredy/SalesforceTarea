public with sharing class OpportunityRevenueTriggerHandler {

    public static void assignColourRevenue(List<Opportunity> opps){
        Final Integer  LOW_REVENUE = 10000;
        Final Integer  HIGH_REVENUE = 30000;

        for(Opportunity opp : opps){
            if(opp.Submit_Annual_Revenue__c < Date.today()){
                if(opp.Annual_Revenue__c < LOW_REVENUE){
                    opp.Colour_Flag__c = 'RED';
                }else{
                    if(opp.Annual_Revenue__c < HIGH_REVENUE){
                        opp.Colour_Flag__c = 'YELLOW';
                    }else{
                        opp.Colour_Flag__c = 'GREEN';
                    }
                }
            }
        }
    }
}