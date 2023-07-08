import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:teacher_app/utils/functions/print.dart';
class SocketManager {
  static SocketManager? _instance;
  IO.Socket? socket;

  factory SocketManager() {
    return _instance ??= SocketManager();
  }

  SocketManager._() {
    // Create a new Socket.io client
    socket = IO.io('https://joker.animeraa.com/', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });
  }

  void connect() {
    // Connect to the server
    try{
      socket!.connect();

    }catch(e){
      checkDebugMode(e);
    }
  }

  void disconnect() {
    // Disconnect from the server
    socket!.disconnect();
  }

  void sendMessage(String key, var data) {
    // Send a message to the server
    socket!.emit(key, data);
  }



   listenToEvent (String key ){

    socket!.on(key, (data) {
      checkDebugMode(data["msg"]);

    });
  }

// Add other methods to manage the Socket.io connection as needed
}