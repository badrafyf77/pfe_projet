// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'package:pfe_projet/core/configures/app_colors.dart';
import 'package:pfe_projet/core/configures/styles.dart';
import 'package:pfe_projet/core/utils/customs/custom_loading_circle.dart';
import 'package:pfe_projet/core/utils/customs/custom_normal_button.dart';
import 'package:pfe_projet/core/utils/helpers/custom_show_toast.dart';
import 'package:pfe_projet/features/checkdata/presentation/views/manager/check%20data%20bloc/check_data_bloc.dart';
import 'package:pfe_projet/features/checkdata/presentation/views/widgets/iconbutton_with_text.dart';
import 'package:pfe_projet/features/checkdata/presentation/views/widgets/image_viewer.dart';

class PickFileBody extends StatefulWidget {
  const PickFileBody({
    super.key,
    required this.cin,
  });

  final String cin;

  @override
  State<PickFileBody> createState() => _PickFileBodyState();
}

class _PickFileBodyState extends State<PickFileBody> {
  String? base64;
  bool isLoding = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CheckDataBloc, CheckDataState>(
      listener: (context, state) {
        if (state is CheckCinLoading) {
          isLoding = true;
        }
        if (state is CheckCinSuccess) {
          isLoding = false;
          myShowToastSuccess(context, 'CIN est compatible avec l\'image');
        }
      },
      child: SingleChildScrollView(
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
                  if (!isLoding) {
                    BlocProvider.of<CheckDataBloc>(context).add(
                      GetImageEvent(source: ImageSource.camera),
                    );
                  }
                },
              ),
              const SizedBox(
                height: 15,
              ),
              IconButtonWithText(
                text: 'Choisir une photo  de la CIN :',
                icon: Icons.insert_photo,
                onPressed: () {
                  if (!isLoding) {
                    BlocProvider.of<CheckDataBloc>(context).add(
                      GetImageEvent(source: ImageSource.gallery),
                    );
                  }
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
              isLoding
                  ? const LoadingCircle()
                  : CustomNormalButton(
                      onPressed: () async {
                        if (base64 == null) {
                          myShowToastInfo(
                              context, 'Veulliez choisir une image');
                        } else {
                          BlocProvider.of<CheckDataBloc>(context).add(
                            CheckCinEvent(
                              cin: widget.cin,
                              base64: base64!,
                            ),
                          );
                        }
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
      ),
    );
  }
}
