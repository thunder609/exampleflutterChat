import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_app/Config/theme/app_theme.dart';
import 'package:yes_app/presentation/providers/chat_providers.dart';

import 'package:yes_app/presentation/screems/chat/chat_screem.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return MultiProvider(
       providers :[ChangeNotifierProvider(create: (_)=> ChatProvider())
     ],
      child:MaterialApp(
      title: 'Yes no App',
        debugShowCheckedModeBanner:false ,
      theme: AppTheme(selectedColor: 4).theme(),
      home: const ChatScreem(),
     )
     );
  }
}
