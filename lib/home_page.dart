import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:notes/authentication/login.dart';
import 'package:notes/models/authentication/RegisterResponse.dart' hide Data;
import 'package:notes/models/error/ApiError.dart';
import 'package:notes/models/notes/NoteListResponse.dart';
import 'package:notes/models/notes/NoteModel.dart';
import 'package:notes/models/notes/NoteResponse.dart' hide Data;
import 'package:notes/notes/add_notes.dart';
import 'package:notes/repository/ApiInterface.dart';
import 'package:notes/repository/api_service.dart';
import 'package:notes/utils/app_utils.dart';
import 'package:notes/utils/error_convertor.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.registerResponse});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final RegisterResponse registerResponse;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Data>? allNotes = List.empty();
  bool isLoading = false;

  Future<void> loadAllNotes() async {
    setState(() {
      isLoading = true;
    });
    ApiServices client = ApiInterFace().getApiService();
    try {
      NoteListResponse noteListResponse = await client.getAllNotes();
      setState(() {
        allNotes = noteListResponse.data;
        isLoading = false;
      });
    } on DioException catch (error, s) {
      setState(() {
        isLoading = false;
      });
      final apiError = ErrorConverter().convert(error.response);
      return Future.error(apiError);
    }
  }

  Future<NoteResponse> deleteNote(String noteId) async {
    setState(() {
      isLoading = true;
    });
    ApiServices client = ApiInterFace().getApiService();
    try {
      NoteResponse noteResponse = await client.deleteNote(noteId);
      setState(() {
        isLoading = false;
      });
      return noteResponse;
    } on DioException catch (error, s) {
      setState(() {
        isLoading = false;
      });
      final apiError = ErrorConverter().convert(error.response);
      return Future.error(apiError);
    }
  }

  void addNotes(NoteModel noteModel, Data? noteResponse) {
    final result = Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => AddNote(noteModel, noteResponse)));
    result.then((value) => {if (value == "refresh") loadAllNotes()});
  }

  @override
  void initState() {
    super.initState();
    loadAllNotes().onError((apiError, stackTrace) {
      if ((apiError as ApiError).error?.code == 401) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const LoginScreen()),
            (route) => false);
      } else {
        AppUtils.showSnackBar(context, apiError.message!);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Colors.yellow,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.registerResponse.data?.firstName ?? ""),
      ),
      body: Container(
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(color: Colors.blue),
          // Center is a layout widget. It takes a single child and positions it
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  constraints: const BoxConstraints.expand(),
                  child: RefreshIndicator(
                    onRefresh: () async {
                      loadAllNotes();
                    },
                    child: ListView.builder(
                        itemCount: allNotes?.length,
                        itemBuilder: (context, index) {
                          var note = allNotes?[index];
                          return ListTile(
                            title: Text(note!.title as String),
                            onLongPress: () {
                              String? noteId = note.id;
                              if (noteId != null) {
                                deleteNote(noteId).then((noteResponse) {
                                  if (noteResponse.success == true) {
                                    loadAllNotes();
                                  }
                                });
                              }
                            },
                            onTap: () {
                              addNotes(
                                  NoteModel(
                                      title: note.title,
                                      description: note.description),
                                  note);
                            },
                          );
                        }),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  padding: const EdgeInsets.all(50),
                  child: IconButton(
                    iconSize: 50,
                    icon: const Icon(Icons.add, color: Colors.black),
                    onPressed: () {
                      addNotes(NoteModel(title: "", description: ""), null);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.yellow),
                  ),
                ),
              ),
              isLoading
                  ? const Dialog(
                      insetPadding: EdgeInsets.all(0),
                      backgroundColor: Colors.transparent,
                      child: Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: 200,
                          height: 200,
                          child: CircularProgressIndicator(
                            color: Colors.red,
                            strokeWidth: 20,
                          ),
                        ),
                      ),
                    )
                  : Container()
            ],
          )),
    );
  }
}
