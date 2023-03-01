trigger CreateAccountTrigger on Account (after insert) {
    CreateAccountHandler.createOpportunitiesFromAccounts(Trigger.new);
}