trigger CountContactsOnAccount on Contact (after insert, after delete) {
    Set<Id> accIds = new Set<Id>();
    if (Trigger.isInsert) for (Contact c : Trigger.new) accIds.add(c.AccountId);
    else for (Contact c : Trigger.old) accIds.add(c.AccountId);

    Map<Id, Integer> contactCounts = new Map<Id, Integer>();
    for (AggregateResult ar : [SELECT AccountId, COUNT(Id) cnt FROM Contact WHERE AccountId IN :accIds GROUP BY AccountId]) {
        contactCounts.put((Id)ar.get('AccountId'), (Integer)ar.get('cnt'));
    }

    List<Account> updates = new List<Account>();
    for (Id accId : contactCounts.keySet()) {
        updates.add(new Account(Id=accId, NumberOfEmployees=contactCounts.get(accId)));
    }
    update updates;
}