trigger AutoTaskForOpportunity on Opportunity (after insert) {
    List<Task> tasks = new List<Task>();
    for (Opportunity opp : Trigger.new) {
        tasks.add(new Task(Subject='Follow up Opportunity', WhatId=opp.Id, Status='Not Started'));
    }
    insert tasks;
}