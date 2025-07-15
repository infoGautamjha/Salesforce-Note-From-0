trigger AddNoteOnCase on Case (after insert) {
    List<Note> notes = new List<Note>();
    for (Case c : Trigger.new) {
        notes.add(new Note(Title='Auto Note', ParentId=c.Id, Body='This case was created automatically.'));
    }
    insert notes;
}