import 'package:flutter/cupertino.dart';
import 'package:yes_app/Config/helpers/get_yes_no_answer.dart';
import 'package:yes_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier{
  final ScrollController chatScrollController = ScrollController();
  //otra forma de declarar un costructor
  final getYesNoAnswer = GetYesNoAnswer();
  List<Message> messageList=[
    Message(text: 'HolaLinda!', fromWho: FromWho.mine),
    Message(text: 'Y regresante del Trabajo ?', fromWho: FromWho.mine),
  ];

      Future<void> sendMessage(String text) async{
    //Implementacion del metodo
        if(text.isEmpty) return;
        final newMessage = Message(text: text, fromWho:FromWho.mine);
        if(text.endsWith('?')){
          herReply();
        }
        messageList.add(newMessage);
        notifyListeners();
        moveScrolltoBottom();
      }
      Future<void> herReply() async  {
        final herMessage= await getYesNoAnswer.getAnswer();
        messageList.add(herMessage);
        notifyListeners();
        moveScrolltoBottom();
      }
      Future<void> moveScrolltoBottom() async {
        await Future.delayed(const Duration(milliseconds: 100));

        chatScrollController.
        animateTo(chatScrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut
        ) ;
      }
}