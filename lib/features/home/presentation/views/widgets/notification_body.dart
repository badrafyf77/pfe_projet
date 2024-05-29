import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pfe_projet/core/model/message_model.dart';
import 'package:pfe_projet/core/utils/helpers/custom_show_toast.dart';
import 'package:pfe_projet/features/home/presentation/manager/get%20messages/get_messages_cubit.dart';
import 'package:pfe_projet/features/home/presentation/views/widgets/notification_item.dart';

class NotificationBody extends StatelessWidget {
  const NotificationBody({super.key});

  @override
  Widget build(BuildContext context) {
    List<Message> messagesList = [];
    return Center(
      child: BlocConsumer<GetMessagesCubit, GetMessagesState>(
        listener: (context, state) {
          if (state is GetMessagesSuccess) {
            messagesList = state.messages;
            myShowToastSuccess(context, 'state');
          }
        },
        builder: (context, state) {
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
                        height: 25,
                      ),
                    ],
                  );
                }),
          );
        },
      ),
    );
  }
}
