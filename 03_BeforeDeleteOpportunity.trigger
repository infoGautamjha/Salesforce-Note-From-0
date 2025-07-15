trigger BeforeDeleteOpportunity on Opportunity (before delete) {
    for (Opportunity opp : Trigger.old) {
        if (opp.StageName == 'Closed Won') {
            opp.addError('Cannot delete a Closed Won Opportunity.');
        }
    }
}