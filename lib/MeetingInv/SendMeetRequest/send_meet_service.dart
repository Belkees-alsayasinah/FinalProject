import 'package:http/http.dart' as http;
import '../../Config/server_config.dart';
import '../../service/info.dart';

class SendMeetService {
  var message;

  Future<bool> addReq(int projectID, int id) async {
    var response = await http.post(
      Uri.parse(ServerConfig.domainNameServer +
          ServerConfig().sendRequestMeet +
          '$projectID' +
          '/$id'),
      headers: {
        'Authorization': 'Bearer ${UserInformation.user_token}',
        'Accept': 'application/json',
      },
    );
    print(ServerConfig.domainNameServer +
        ServerConfig().sendRequestMeet +
        '$id' +
        '/$projectID');
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    } else if (response.statusCode == 404) {
      message = "Something wrong!";
      return false;
    } else {
      return false;
    }
  }
}
