import 'package:flutter/material.dart';

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
  void createNote() {}

  // READ NOTE
  void readNote() {}

  // DELETE NOTE
  void deleteNote() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
