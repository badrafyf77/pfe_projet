import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pfe_projet/core/configures/app_colors.dart';
import 'package:pfe_projet/core/configures/styles.dart';
import 'package:pfe_projet/core/utils/customs/custom_normal_button.dart';
import 'package:pfe_projet/features/checkdata/data/service/docscan_api_service.dart';
import 'package:pfe_projet/features/checkdata/presentation/views/manager/check%20data%20bloc/check_data_bloc.dart';
import 'package:pfe_projet/features/checkdata/presentation/views/widgets/iconbutton_with_text.dart';
import 'package:pfe_projet/features/checkdata/presentation/views/widgets/image_viewer.dart';

class PickFileBody extends StatelessWidget {
  const PickFileBody({super.key});

  @override
  Widget build(BuildContext context) {
    String? base64;
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            IconButtonWithText(
              text: 'Prendre en photo la CIN :',
              icon: Icons.camera_alt,
              onPressed: () {
                BlocProvider.of<CheckDataBloc>(context).add(
                  GetImageEvent(source: ImageSource.camera),
                );
              },
            ),
            const SizedBox(
              height: 15,
            ),
            IconButtonWithText(
              text: 'Choisir une photo  de la CIN :',
              icon: Icons.insert_photo,
              onPressed: () {
                BlocProvider.of<CheckDataBloc>(context).add(
                  GetImageEvent(source: ImageSource.gallery),
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            BlocBuilder<CheckDataBloc, CheckDataState>(
              builder: (context, state) {
                if (state is GetImageSucces) {
                  List<int> imageBytes =
                      File(state.file.path).readAsBytesSync();
                  base64 = base64Encode(imageBytes);
                  return ImageViewer(
                    file: File(state.file.path),
                    name: state.file.name,
                  );
                }
                return Text(
                  'veuillez importer une image',
                  style: Styles.normal16.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            CustomNormalButton(
              onPressed: () async {
                var result = await DocScanService().getCin(base64!);
                debugPrint(result.toString());
              },
              textButton: "Valider",
              backgroundColor: Theme.of(context).colorScheme.primary,
              textColor: AppColors.kThirdColor,
              height: 50,
              width: 130,
            ),
          ],
        ),
      ),
    );
  }
}
