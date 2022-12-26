import 'package:adopt_a_friend/constants/custom_variables.dart';
import 'package:adopt_a_friend/objects/info_card.dart';
import 'package:flutter/material.dart';

class ViewInfoCard extends StatefulWidget {
  final InfoCard infoCard;

  const ViewInfoCard({Key? key , required this.infoCard}) : super(key: key);

  @override
  State<ViewInfoCard> createState() => _ViewInfoCardState();
}

class _ViewInfoCardState extends State<ViewInfoCard> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home' , style: TextStyle(color: textColor),),
        iconTheme: const IconThemeData(color: iconThemeDataColor),
        backgroundColor: appBarColor,
      ),
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image
            Image.network(widget.infoCard.image,),
            // species
            Text('Species: ${widget.infoCard.species}', style: const TextStyle(color: textColor),),
            // breed
            Text('Breed: ${widget.infoCard.breed}', style: const TextStyle(color: textColor),),
            // health
            Text('Health: ${widget.infoCard.health}', style: const TextStyle(color: textColor),),
            // activity
            Text('Activity: ${widget.infoCard.activity}', style: const TextStyle(color: textColor),),
            // instructions
            Text('Good to know: ${widget.infoCard.activity}', style: const TextStyle(color: textColor),),
          ],
        ),
      ),
    );
  }
}
