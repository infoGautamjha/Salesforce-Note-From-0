trigger AfterUpdateAccount on Account (after update) {
    for (Account acc : Trigger.new) {
        Account oldAcc = Trigger.oldMap.get(acc.Id);
        if (acc.Industry != oldAcc.Industry) {
            System.debug('Industry changed for Account: ' + acc.Name);
        }
    }
}