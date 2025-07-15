trigger CascadeCheckBoxAccountToContact on Account (after update) {
    List<Contact> updates = new List<Contact>();
    for (Account acc : Trigger.new) {
        Account oldAcc = Trigger.oldMap.get(acc.Id);
        if (acc.Custom__c != oldAcc.Custom__c) {
            for (Contact c : [SELECT Id, Custom__c FROM Contact WHERE AccountId = :acc.Id]) {
                c.Custom__c = acc.Custom__c;
                updates.add(c);
            }
        }
    }
    update updates;
}