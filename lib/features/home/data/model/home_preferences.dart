import 'package:get_storage/get_storage.dart';

const isCinVerified = 'IS_CIN_VERIFIED';
const isMessagesReaded = 'IS_MESSAGES_READED';

class HomePreferences {
  final box = GetStorage();

  Future<void> setIsCinVerified(bool value) async {
    await box.write(isCinVerified, value);
  }

  Future<bool> getIsCinVerified() async {
    return await box.read(isCinVerified) ?? false;
  }

  Future<void> setIsMessagesReaded(bool value) async {
    await box.write(isMessagesReaded, value);
  }

  Future<bool> getIsMessagesReaded() async {
    return await box.read(isMessagesReaded) ?? false;
  }
}
