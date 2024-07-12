import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_2/features/post/presentation/bloc/post_bloc.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  final ImagePicker _picker = ImagePicker();

  final TextEditingController _textController = TextEditingController();

  final List<File> _images = [];

  Future<void> _pickImage() async {
    var image = await _picker.pickMultiImage();
    for (var imageList in image) {
      final doKnow = File(imageList.path);
      _images.add(doKnow);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Post'),
      ),
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          return Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Add Post',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: _textController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter Post',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: _pickImage,
                    child: const Text('Pick Image'),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      context.read<PostBloc>().add(
                            AddPostEvent(
                              content: _textController.text,
                              images: _images,
                            ),
                          );
                      Navigator.of(context).pop();
                    },
                    child: const Text('Post'),
                  ),
                ],
              ),
            ],
          ));
        },
      ),
    );
  }
}
