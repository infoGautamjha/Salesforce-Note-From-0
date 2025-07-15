trigger BeforeUpdateContact on Contact (before update) {
    for (Contact con : Trigger.new) {
        if (con.Email != null && !con.Email.endsWith('@example.com')) {
            con.Email = con.Email + '.example.com';
        }
    }
}