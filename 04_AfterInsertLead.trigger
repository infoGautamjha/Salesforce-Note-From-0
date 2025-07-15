trigger AfterInsertLead on Lead (after insert) {
    List<Task> tasks = new List<Task>();
    for (Lead l : Trigger.new) {
        tasks.add(new Task(Subject='Follow up', WhoId=l.Id));
    }
    insert tasks;
}