import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreateForm extends StatefulWidget {
  const CreateForm({super.key});

  @override
  State<CreateForm> createState() => _CreateFormState();
}

class _CreateFormState extends State<CreateForm> {
  String? selectedValue; // Variable to hold the selected dropdown value
  List<File> selectedPhotos = []; // List to hold selected photos

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Create Form';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter Name',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter Mobile No.',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Enter Remarks.',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Select Platform',
                  ),
                  value: selectedValue,
                  items: <String>['Android', 'iOS', 'Flutter']
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      selectedValue = newValue;
                    });
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: Text(
                  'Upload Photos',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              selectedPhotos.isEmpty
                  ? UploadPhotosContainer(
                selectedImageCallback: (List<File> selectedImages) {
                  setState(() {
                    selectedPhotos = selectedImages;
                  });
                },
              )
                  : GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: selectedPhotos.length + 1,
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                itemBuilder: (BuildContext context, int index) {
                  if (index == selectedPhotos.length) {
                    return GestureDetector(
                      onTap: () async {
                        List<File> newImages =
                        await ImagePickerUtil.getImagesFromGalleryOrCamera(
                            context);
                        setState(() {
                          selectedPhotos.addAll(newImages);
                        });
                      },
                      child: Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: AppColors.yellowColor,
                          ),
                        ),
                        child: const Icon(
                          CupertinoIcons.add,
                          color: AppColors.yellowColor,
                        ),
                      ),
                    );
                  } else {
                    return Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.file(
                              selectedPhotos[index],
                              height: 100,
                              width: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          right: 2,
                          top: -7,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedPhotos.removeAt(index);
                              });
                            },
                            child: const Icon(
                              CupertinoIcons.clear_circled,
                              color: AppColors.redColor,
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Utility Widget for Upload Photos
class UploadPhotosContainer extends StatelessWidget {
  final Function(List<File>) selectedImageCallback;

  const UploadPhotosContainer({Key? key, required this.selectedImageCallback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () async {
          List<File> selectedImages =
          await ImagePickerUtil.getImagesFromGalleryOrCamera(context);
          selectedImageCallback(selectedImages);
        },
        child: Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.yellowColor),
          ),
          child: const Icon(
            CupertinoIcons.photo_on_rectangle,
            size: 50,
            color: AppColors.yellowColor,
          ),
        ),
      ),
    );
  }
}

// Utility Class for Image Picking
class ImagePickerUtil {
  static Future<List<File>> getImagesFromGalleryOrCamera(
      BuildContext context) async {
    final ImagePicker picker = ImagePicker();

    return await showModalBottomSheet<List<File>>(
        context: context,
        builder: (BuildContext context) {
          return Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text("Choose from Gallery"),
                onTap: () async {
                  final List<XFile>? images = await picker.pickMultiImage();
                  Navigator.pop(
                      context, images?.map((image) => File(image.path)).toList());
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text("Take a Photo"),
                onTap: () async {
                  final XFile? photo =
                  await picker.pickImage(source: ImageSource.camera);
                  Navigator.pop(context, photo != null ? [File(photo.path)] : []);
                },
              ),
            ],
          );
        }) ??
        [];
  }
}

// AppColors Constants
class AppColors {
  static const Color yellowColor = Colors.amber;
  static const Color redColor = Colors.red;
}

void main() => runApp(const CreateForm());
