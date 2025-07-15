trigger LinkCaseToAccount on Case (before insert) {
    for (Case c : Trigger.new) {
        if (c.ContactId != null) {
            Contact con = [SELECT AccountId FROM Contact WHERE Id = :c.ContactId LIMIT 1];
            c.AccountId = con.AccountId;
        }
    }
}