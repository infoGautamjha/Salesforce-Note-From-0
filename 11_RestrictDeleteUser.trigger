trigger RestrictDeleteUser on User (before delete) {
    for (User u : Trigger.old) {
        if (u.Profile.Name == 'System Administrator') {
            u.addError('Cannot delete system admin users.');
        }
    }
}