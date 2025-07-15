trigger AutoCloseCaseAfter7Days on Case (before update) {
    for (Case c : Trigger.new) {
        if (c.Status != 'Closed' && c.CreatedDate.addDays(7) < System.now()) {
            c.Status = 'Closed';
        }
    }
}