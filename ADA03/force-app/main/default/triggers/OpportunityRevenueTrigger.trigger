trigger OpportunityRevenueTrigger on Opportunity (before insert) {
    OpportunityRevenueTriggerHandler.assignColourRevenue(Trigger.new);  
}