// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pfe_projet/core/configures/app_colors.dart';
import 'package:pfe_projet/core/configures/app_router.dart';
import 'package:pfe_projet/core/configures/styles.dart';
import 'package:pfe_projet/core/utils/customs/custom_loading_circle.dart';
import 'package:pfe_projet/core/utils/customs/custom_normal_button.dart';
import 'package:pfe_projet/core/utils/dark_mode_logic.dart';
import 'package:pfe_projet/core/utils/helpers/custom_show_toast.dart';
import 'package:pfe_projet/features/checkdata/presentation/views/manager/check%20cin%20bloc/check_cin_bloc.dart';
import 'package:pfe_projet/features/checkdata/presentation/views/manager/get%20image%20bloc/get_image_bloc.dart';
import 'package:pfe_projet/features/checkdata/presentation/views/widgets/iconbutton_with_text.dart';
import 'package:pfe_projet/features/checkdata/presentation/views/widgets/image_viewer.dart';
import 'package:provider/provider.dart';

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
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return BlocListener<CheckCinBloc, CheckCinState>(
      listener: (context, state) {
        if (state is CheckCinLoading) {
          setState(() {
            isLoding = true;
          });
        }
        if (state is CheckCinSuccess) {
          setState(() {
            isLoding = false;
          });
          myShowToastSuccess(context, 'CIN est compatible avec l\'image');
          AppRouter.pop(context);
        }
      },
      child: SingleChildScrollView(
        child: Center(
          child: BlocBuilder<GetImageBloc, GetImageState>(
            builder: (context, state) {
              if (state is GetImageSucces) {
                List<int> imageBytes = File(state.file.path).readAsBytesSync();
                base64 = base64Encode(imageBytes);
                return Column(
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    ImageViewer(
                      file: File(state.file.path),
                      name: state.file.name,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    isLoding
                        ? LoadingCircle(
                            color: Theme.of(context).colorScheme.primary,
                          )
                        : CustomNormalButton(
                            onPressed: () async {
                              if (base64 == null) {
                                myShowToastInfo(
                                    context, 'Veulliez choisir une image');
                              } else {
                                BlocProvider.of<CheckCinBloc>(context).add(
                                  CheckCin(
                                    cin: widget.cin,
                                    base64: base64!,
                                  ),
                                );
                              }
                            },
                            textButton: "Valider",
                            backgroundColor:
                                Theme.of(context).colorScheme.primary,
                            textColor: AppColors.kThirdColor,
                            height: 50,
                            width: 130,
                          ),
                  ],
                );
              }
              return Column(
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  IconButtonWithText(
                    text: 'Prendre en photo la CIN :',
                    icon: Icons.camera_alt,
                    onPressed: () {
                      BlocProvider.of<GetImageBloc>(context).add(
                        PickImageEvent(source: ImageSource.camera),
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
                      BlocProvider.of<GetImageBloc>(context).add(
                        PickImageEvent(source: ImageSource.gallery),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'veuillez importer une image',
                    style: Styles.normal18.copyWith(
                      color: themeChange.darkTheme
                          ? AppColors.kThirdColor
                          : Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
