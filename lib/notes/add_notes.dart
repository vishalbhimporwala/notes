import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:notes/models/notes/NoteListResponse.dart';
import 'package:notes/repository/ApiInterface.dart';
import 'package:notes/utils/app_utils.dart';

import '../authentication/login.dart';
import '../models/notes/NoteModel.dart';
import '../models/notes/NoteResponse.dart' hide Data;
import '../utils/error_convertor.dart';

class AddNote extends StatelessWidget {
  NoteModel noteModel;
  Data? noteResponse;

  AddNote(this.noteModel, this.noteResponse, {super.key});

  var titleController = TextEditingController();
  var descController = TextEditingController();

  Future<NoteResponse> addOrUpdateNote(
      NoteModel noteModel, Data? noteResponseOld) async {
    try {
      if (noteResponseOld == null) {
        NoteResponse noteResponse =
            await ApiInterFace().getApiService().addNote(noteModel);
        return noteResponse;
      } else {
        noteModel.noteId = noteResponseOld.id;
        NoteResponse noteResponse =
            await ApiInterFace().getApiService().updateNote(noteModel);
        return noteResponse;
      }
    } on DioException catch (error) {
      final apiError = ErrorConverter().convert(error.response);
      return Future.error(apiError);
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    titleController.text = noteModel.title!;
    descController.text = noteModel.description!;

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
          color: Colors.blue,
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
                    addOrUpdateNote(noteModel, noteResponse).then(
                        (newNoteResponse) {
                      if (noteResponse == null) {
                        AppUtils.showSnackBar(
                            context, "Note added successfully");
                      } else {
                        AppUtils.showSnackBar(
                            context, "Note updated successfully");
                      }
                      Navigator.pop(context, "refresh");
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
