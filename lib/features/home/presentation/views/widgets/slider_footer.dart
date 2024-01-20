import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:pfe_projet/features/home/presentation/views/widgets/slider_item_and_icon.dart';

class SliderFooter extends StatelessWidget {
  const SliderFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SliderItem(
          onPressed: () {},
          icon: CupertinoIcons.moon_fill,
          text: 'Mode Claire',
        ),
        SliderItem(
          onPressed: () {
            FirebaseAuth.instance.signOut();
          },
          icon: CupertinoIcons.power,
          text: 'Déconnexion',
        ),
      ],
    );
  }
}
