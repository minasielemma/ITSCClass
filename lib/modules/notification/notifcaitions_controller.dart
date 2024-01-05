import "package:get/get.dart";
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class NotificationController extends GetxController {
  RxList<String> events = <String>[].obs;

  @override
  void onInit() {
    createConnection();
    super.onInit();
  }

  createConnection() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var id = pref.getInt("uid");
    String? token = pref.getString("token");
    String url = "ws://localhost:8000/ws/notifications/$id/?token=$token";

    final channal = IOWebSocketChannel.connect(url);

    channal.stream.listen((event) {
      events.add(event);
    });
  }
}
