trigger LogLastModifiedBy on Contact (before update) {
    for (Contact c : Trigger.new) {
        c.Description = 'Modified by Trigger on ' + System.now();
    }
}