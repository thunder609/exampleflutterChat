import 'package:flutter/material.dart';
import 'package:yes_app/domain/entities/message.dart';

class MyMesaggeBubble extends StatelessWidget {
  final Message message;
  const  MyMesaggeBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colors=Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
    decoration:BoxDecoration(
    color: Colors.black,
    borderRadius: BorderRadius.circular(20) ,
    ),
    child : Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(message.text,style: TextStyle(color: Colors.white),),
    ),
        ),
        const SizedBox(height: 10)
        ]
    );
  }
}
