trigger ValidatePhoneFormat on Lead (before insert, before update) {
    for (Lead l : Trigger.new) {
        if (!Pattern.matches('\\d{10}', l.Phone)) {
            l.addError('Phone must be 10 digits.');
        }
    }
}