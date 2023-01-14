import 'package:flutter/material.dart';
class ResponsiveLayout extends StatelessWidget {
  final Widget mobileBody;
  final Widget desktopBody;

  const ResponsiveLayout({required  this.mobileBody, required this.desktopBody});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, consttrains){
      if(consttrains.maxWidth < 600){
        return mobileBody;
      }else{
        return desktopBody;
      }
    });
  }
}
