import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pfe_projet/core/configures/app_colors.dart';
import 'package:pfe_projet/core/configures/styles.dart';
import 'package:pfe_projet/core/utils/customs/custom_normal_button.dart';
import 'package:pfe_projet/features/checkdata/presentation/views/widgets/iconbutton_with_text.dart';
import 'package:pfe_projet/features/checkdata/presentation/views/widgets/image_viewer.dart';

class PickFileBody extends StatefulWidget {
  const PickFileBody({super.key});

  @override
  State<PickFileBody> createState() => _PickFileBodyState();
}

class _PickFileBodyState extends State<PickFileBody> {
  XFile? file;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 25,
          ),
          IconButtonWithText(
            text: 'Prendre en photo la CIN :',
            icon: Icons.camera_alt,
            onPressed: () async {
              file = await getImage(ImageSource.camera);
              setState(() {});
            },
          ),
          const SizedBox(
            height: 15,
          ),
          IconButtonWithText(
            text: 'Choisir une photo  de la CIN :',
            icon: Icons.insert_photo,
            onPressed: () async {
              file = await getImage(ImageSource.gallery);
              setState(() {});
            },
          ),
          const SizedBox(
            height: 10,
          ),
          file != null
              ? ImageViewer(
                  file: File(file!.path),
                  name: file!.name,
                )
              : Text(
                  'veuillez importer une image',
                  style: Styles.normal16.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
          const SizedBox(
            height: 10,
          ),
          CustomNormalButton(
            onPressed: () {},
            textButton: "Valider",
            backgroundColor: Theme.of(context).colorScheme.primary,
            textColor: AppColors.kThirdColor,
            height: 50,
            width: 130,
          ),
        ],
      ),
    );
  }
}



Future<XFile?> getImage(ImageSource source) async {
  final ImagePicker picker = ImagePicker();
  final image = await picker.pickImage(source: source);

  if (image != null) {
    List<int> imageBytes = await image.readAsBytes();
    String base64Image = base64Encode(imageBytes);

    return image;
  } else {
    return null;
  }
}
