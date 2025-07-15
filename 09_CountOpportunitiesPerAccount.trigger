trigger CountOpportunities on Opportunity (after insert, after delete) {
    Set<Id> accIds = new Set<Id>();
    if (Trigger.isInsert) {
        for (Opportunity opp : Trigger.new) accIds.add(opp.AccountId);
    } else {
        for (Opportunity opp : Trigger.old) accIds.add(opp.AccountId);
    }
    Map<Id, Integer> oppCount = new Map<Id, Integer>();
    for (AggregateResult ar : [SELECT AccountId, COUNT(Id) cnt FROM Opportunity WHERE AccountId IN :accIds GROUP BY AccountId]) {
        oppCount.put((Id)ar.get('AccountId'), (Integer)ar.get('cnt'));
    }
    List<Account> updates = new List<Account>();
    for (Id id : oppCount.keySet()) {
        updates.add(new Account(Id=id, NumberOfEmployees=oppCount.get(id)));
    }
    update updates;
}