import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes/models/error/ApiError.dart';
import 'package:notes/repository/ApiInterface.dart';
import 'package:notes/utils/app_utils.dart';

import '../authentication/login.dart';
import '../models/notes/NoteModel.dart';
import '../models/notes/NoteResponse.dart';
import '../utils/error_convertor.dart';

class AddNote extends StatefulWidget {
  const AddNote({super.key});

  @override
  State<StatefulWidget> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  var titleController = TextEditingController();
  var descController = TextEditingController();
  var noteModel = NoteModel();

  Future<NoteResponse> addNote(NoteModel noteModel) async {
    try {
      NoteResponse noteResponse =
          await ApiInterFace().getApiService().addNote(noteModel);
      return noteResponse;
    } on DioException catch (error) {
      final apiError = ErrorConverter().convert(error.response);
      return Future.error(apiError);
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        leading: IconButton(
          iconSize: 40,
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: const Text("Add Note"),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20),
          color: Colors.red,
          constraints: const BoxConstraints.expand(),
          child: Column(
            children: [
              TextFormField(
                controller: titleController,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                    hintText: "Enter title", border: OutlineInputBorder()),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 200,
                child: TextFormField(
                  controller: descController,
                  expands: true,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  decoration: const InputDecoration(
                      hintText: "Enter description",
                      border: OutlineInputBorder()),
                  textAlignVertical: TextAlignVertical.top,
                ),
              ),
              const SizedBox(height: 20),
              OutlinedButton(
                  onPressed: () {
                    AppUtils().printLog("Add Note button click");
                    noteModel = NoteModel(
                        title: titleController.text,
                        description: descController.text);
                    addNote(noteModel).then((noteResponse) {
                      AppUtils.showSnackBar(context, "Note added successfully");
                    }, onError: (apiError) {
                      AppUtils.showSnackBar(context, apiError.message);
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()),
                              (route) => false);
                    });
                  },
                  child: const Text("Add Note"))
            ],
          ),
        ),
      ),
    );
  }
}