trigger GenerateCustomFieldID on Account (before insert) {
    for (Account acc : Trigger.new) {
        acc.Custom_ID__c = 'ACC-' + Math.round(Math.random() * 10000);
    }
}