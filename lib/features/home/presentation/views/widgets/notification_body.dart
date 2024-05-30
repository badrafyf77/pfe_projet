import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pfe_projet/core/model/message_model.dart';
import 'package:pfe_projet/core/utils/customs/custom_loading_circle.dart';
import 'package:pfe_projet/core/utils/helpers/custom_show_toast.dart';
import 'package:pfe_projet/features/home/presentation/manager/get%20messages/get_messages_cubit.dart';
import 'package:pfe_projet/features/home/presentation/views/widgets/notification_item.dart';

class NotificationBody extends StatelessWidget {
  const NotificationBody({super.key});

  @override
  Widget build(BuildContext context) {
    List<Message> messagesList = [];
    return Center(
      child: BlocBuilder<GetMessagesCubit, GetMessagesState>(
        builder: (context, state) {
          if (state is GetMessagesFailure) {
            myShowToastError(context, state.err);
          }
          if (state is GetMessagesSuccess) {
            messagesList =
                BlocProvider.of<GetMessagesCubit>(context).messagesList;
            return SizedBox(
              width: MediaQuery.of(context).size.width * .8,
              child: ListView.builder(
                  itemCount: messagesList.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        if (index == 0)
                          const SizedBox(
                            height: 20,
                          ),
                        NotificationItem(
                          message: messagesList[index],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    );
                  }),
            );
          }
          return LoadingCircle(
            color: Theme.of(context).colorScheme.primary,
          );
        },
      ),
    );
  }
}
