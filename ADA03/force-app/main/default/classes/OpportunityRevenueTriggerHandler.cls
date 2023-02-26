public with sharing class OpportunityRevenueTriggerHandler {

    public static void assignColourRevenue(List<Opportunity> opps){

        for(Opportunity opp : opps){
            if(opp.Submit_Annual_Revenue__c < Date.today()){
                if(opp.Annual_Revenue__c < 10000){
                    opp.Colour_Flag__c = 'RED';
                }else{
                    if(opp.Annual_Revenue__c < 30000){
                        opp.Colour_Flag__c = 'YELLOW';
                    }else{
                        opp.Colour_Flag__c = 'GREEN';
                        
                    }
                }
            }
        }
    }
}