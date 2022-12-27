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
        child: Padding(
          padding: EdgeInsets.all(height/90),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image
              Image.network(widget.infoCard.image,),
              // species
              Row(
                children: [
                  Text('Species: ${widget.infoCard.species}', style: const TextStyle(color: textColor),),
                ],
              ),
              // breed
              Row(
                children: [
                  Text('Breed: ${widget.infoCard.breed}', style: const TextStyle(color: textColor),),
                ],
              ),
              // health
              Row(
                children: [
                  Expanded(child: Text('Health: ${widget.infoCard.health}', style: const TextStyle(color: textColor),)),
                ],
              ),
              // activity
              Row(
                children: [
                  Expanded(child:Text('Activity: ${widget.infoCard.activity}', style: const TextStyle(color: textColor),),
                  )
                ],
              ),
              // instructions
              Row(
                children: [
                  Expanded(child: Text('Good to know: ${widget.infoCard.activity}', style: const TextStyle(color: textColor),)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
