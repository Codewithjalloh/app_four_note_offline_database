import 'package:app_four_note_offline_database/models/note.dart';
import 'package:app_four_note_offline_database/models/note_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/drawer.dart';

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
    // note database
    final noteDatabase = context.watch<NoteDatabase>();

    // current notes
    List<Note> currentNotes = noteDatabase.currentNotes;

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.primary,
        onPressed: createNote,
        child: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
      ),
      drawer: MyDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // LIST OF NOTES 
          Padding(padding: EdgeInsets.)
        ],
      ),
    );
  }
}
