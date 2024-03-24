import 'package:flutter/material.dart';

class CastCrewDesignation extends StatelessWidget {
  const CastCrewDesignation({super.key, required this.crewCastName, required this.designation});
  final String crewCastName;
  final String designation;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return  Padding(
            padding: EdgeInsets.only(left: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(backgroundColor: Colors.orange, radius: 50),
                Text(
                  crewCastName,
                  style:
                      TextStyle(fontSize: 15, color: Colors.black, decoration: TextDecoration.none),
                ),
                Text(
                  designation,
                  style:
                      TextStyle(fontSize: 15, color: Colors.black, decoration: TextDecoration.none),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
