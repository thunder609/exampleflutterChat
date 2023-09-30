import "package:flutter/material.dart";






const   Color _personalizadoColor = Color(0xFF49149F);
const List<Color>  _colorThemes=[
  _personalizadoColor ,
  Colors.white,
  Colors.green,
  Colors.teal,
  Colors.yellow,
  Colors.orange,
  Colors.pink,


] ;

class AppTheme{
  final int selectedColor;
  AppTheme({
    this.selectedColor=0
}):assert(selectedColor>=0 && selectedColor<= _colorThemes.length-1,'Color must be between 0 abd ${_colorThemes.length}');

  ThemeData theme(){

    return ThemeData(

        useMaterial3: true,
     colorSchemeSeed:_colorThemes[selectedColor]);

  }
}