import 'package:adopt_a_friend/constants/custom_functions.dart';
import 'package:adopt_a_friend/constants/custom_variables.dart';
import 'package:adopt_a_friend/objects/shelter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ViewShelter extends StatefulWidget {
  final Shelter shelter;

  const ViewShelter({Key? key , required this.shelter}) : super(key: key);

  @override
  State<ViewShelter> createState() => _ViewShelterState();
}

class _ViewShelterState extends State<ViewShelter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Info Cards' , style: TextStyle(color: textColor),),
        iconTheme: const IconThemeData(color: iconThemeDataColor),
        backgroundColor: appBarColor,
      ),
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image
            Image.network(widget.shelter.image,),
            //  name < == > share
            Row(
              children: [
                Text(widget.shelter.name , style: const TextStyle(color: textColor),),
                IconButton(onPressed: (){}, icon: const Icon(Icons.share))
              ],
            ),
            //  description
            Text(widget.shelter.description, style: const TextStyle(color: textColor),),
            // address
            Text(widget.shelter.description, style: const TextStyle(color: textColor),),
            // media buttons
            Row(
              children: [
                // email , facebook , twitter , instagram
                IconButton(onPressed: (){
                  //todo: send email
                }, icon: const FaIcon(FontAwesomeIcons.envelope)),
                IconButton(onPressed: (){
                  launchWebSiteUrl(widget.shelter.facebook);
                }, icon: const FaIcon(FontAwesomeIcons.facebook)),
                IconButton(onPressed: (){
                  launchWebSiteUrl(widget.shelter.twitter);
                }, icon: const FaIcon(FontAwesomeIcons.twitter)),
                IconButton(onPressed: (){
                  launchWebSiteUrl(widget.shelter.instagram);
                }, icon: const FaIcon(FontAwesomeIcons.instagram)),

              ],
            )
          ],
        ),
      ),
    );
  }
}
