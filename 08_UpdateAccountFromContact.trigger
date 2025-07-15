trigger UpdateAccountFromContact on Contact (after insert) {
    Map<Id, Account> accMap = new Map<Id, Account>();
    for (Contact con : Trigger.new) {
        if (con.AccountId != null) {
            accMap.put(con.AccountId, new Account(Id=con.AccountId, Description='New Contact Added'));
        }
    }
    update accMap.values();
}