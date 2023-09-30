


import 'package:dio/dio.dart';
import 'package:yes_app/infraestructure/models/yes_no_model.dart';

import '../../domain/entities/message.dart';

class GetYesNoAnswer{
  final _dio = Dio();
Future<Message> getAnswer() async{
  final response = await _dio.get('https://yesno.wtf/api');
  final yesNoModel = YesNoModel.fromJsonMap(response.data);
return Message(
    text: yesNoModel.answer,
    fromWho:FromWho.hers,
    imageUrl: yesNoModel.image);
}
}