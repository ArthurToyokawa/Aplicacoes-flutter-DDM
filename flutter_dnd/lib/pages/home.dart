import 'package:flutter/material.dart';
import 'package:flutter_dnd/components/big_button.dart';
import 'package:flutter_dnd/components/leading_bar.dart';
import 'package:flutter_dnd/routes.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  
  @override
  State<StatefulWidget> createState() {
    return _MyStatefulWidgetState();
  }
}
class _MyStatefulWidgetState extends State<StatefulWidget> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LeadingBar('Home', showHomeButton: false),
      body: Align(
        child: Column(
          children: [
            const SizedBox(height: 16.0),
            BigButton(
              'Personagens', 
              () {Navigator.pushNamed(context, Routes.personagens);}
            ),
            const SizedBox(height: 16.0),
            BigButton(
              'Grupos', 
              () {Navigator.pushNamed(context, Routes.grupos);}
            ),
            const SizedBox(height: 16.0),
            BigButton(
              'Monstros', 
              () {Navigator.pushNamed(context, Routes.monstros);}
            ),
            const SizedBox(height: 16.0),
            BigButton(
              'Armas', 
              () {Navigator.pushNamed(context, Routes.armas);}
            ),
            const SizedBox(height: 16.0),
            BigButton(
              'Calculos', 
              () {Navigator.pushNamed(context, Routes.calculos);}
            ),
            const Expanded(child: SizedBox()),
            BigButton(
              'Nos contate', 
              () { launchUrl(Uri(scheme: 'mailto', path: "test.email@mail.com")); }
            ),
            const SizedBox(height: 16.0)
          ],
        ),
      )
    );
  }

}