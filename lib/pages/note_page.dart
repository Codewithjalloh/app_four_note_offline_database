import 'package:app_four_note_offline_database/models/note.dart';
import 'package:app_four_note_offline_database/models/note_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotePage extends StatefulWidget {
  const NotePage({super.key});

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  final textController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // on app startup fetch existing notes
    readNote();
  }

  // CREATE NOTE
  void createNote() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.surface,
        content: TextField(
          controller: textController,
        ),
        actions: [
          MaterialButton(onPressed: () {
            // add to db
            context.read<NoteDatabase>().addNote(textController.text);

            // clear controller
            textController.clear();

            // pop dialog box
            Navigator.pop(context);
          }),
        ],
      ),
    );
  }

  // READ NOTE
  void readNote() {
    context.read<NoteDatabase>().fetchNotes();
  }

  // UPDATE
  void updateNote(Note note) {
    textController.text = note.text;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.surface,
        content: TextField(
          controller: textController,
        ),
        actions: [
          MaterialButton(onPressed: () {
            // add to db
            context
                .read<NoteDatabase>()
                .updateNote(note.id, textController.text);

            // clear controller
            textController.clear();

            // pop dialog box
            Navigator.pop(context);
          }),
        ],
      ),
    );
  }

  // DELETE NOTE
  void deleteNote(int id) {
    context.read<NoteDatabase>().deleteNote(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
