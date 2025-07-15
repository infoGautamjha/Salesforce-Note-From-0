trigger CreateContactOnAccount on Account (after insert) {
    List<Contact> contacts = new List<Contact>();
    for (Account acc : Trigger.new) {
        contacts.add(new Contact(LastName='Default', AccountId=acc.Id));
    }
    insert contacts;
}