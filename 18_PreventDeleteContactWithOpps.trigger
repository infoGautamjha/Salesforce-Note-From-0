trigger PreventDeleteContactWithOpps on Contact (before delete) {
    Set<Id> contactIds = new Set<Id>();
    for (Contact c : Trigger.old) contactIds.add(c.Id);

    for (Opportunity opp : [SELECT Id, ContactId FROM Opportunity WHERE ContactId IN :contactIds]) {
        Trigger.oldMap.get(opp.ContactId).addError('Cannot delete contact linked to Opportunity.');
    }
}