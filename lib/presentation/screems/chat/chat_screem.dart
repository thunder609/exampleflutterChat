import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_app/domain/entities/message.dart';
import 'package:yes_app/presentation/providers/chat_providers.dart';
import 'package:yes_app/presentation/widgets/chat/her_message_bubbe.dart';

import '../../widgets/chat/my_message_bubble.dart';
import '../../widgets/shared/mssage_field_box.dart';

class ChatScreem extends StatelessWidget {
  const ChatScreem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.vSTDpUiCXCBkaVd-VSjXJgHaE8%26pid%3DApi%26h%3D160&f=1&ipt=fd866783673bf2262d2769c3b491920da91d8d3c1471b72a25b7272e0787ddf9&ipo=images'),
          ),
        ),
        title: const Text('Xhateto Usuarios'),
        centerTitle: true,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();
    return SafeArea(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(children: [
              Expanded(
                  child: ListView.builder(
                     // itemCount: 100,
                    controller: chatProvider.chatScrollController,
                     itemCount: chatProvider.messageList.length,
                      itemBuilder: (context, index) {
                       final message =  chatProvider.messageList[index];
                        return (message.fromWho== FromWho.hers)
                             ?  HerMessageBubble(message: message,)
                            :  MyMesaggeBubble(message:message);
                        
                      })),
              //Caja de Texto
              MessageFieldBox(
                // dos frmas de hacerlo
               // onValue: (value)=>chatProvider.sendMessage(value),
                onValue: chatProvider.sendMessage,
              )   ,
            ])));
  }
}
