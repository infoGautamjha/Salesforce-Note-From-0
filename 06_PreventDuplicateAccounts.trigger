trigger PreventDuplicateAccounts on Account (before insert) {
    Set<String> names = new Set<String>();
    for (Account acc : Trigger.new) {
        names.add(acc.Name);
    }
    Map<String, Account> existingAccounts = new Map<String, Account>();
    for (Account acc : [SELECT Name FROM Account WHERE Name IN :names]) {
        existingAccounts.put(acc.Name, acc);
    }
    for (Account acc : Trigger.new) {
        if (existingAccounts.containsKey(acc.Name)) {
            acc.addError('An account with this name already exists.');
        }
    }
}