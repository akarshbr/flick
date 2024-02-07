import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../custom_widget/cast_crew_designation.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.width,
        width: MediaQuery.of(context).size.width,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width * .9,
                child: Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width * .55,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/details/Pulp-Fiction-ballo-2.jpg"),
                              fit: BoxFit.cover)),
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back, color: Colors.white)),
                    Padding(
                      padding: const EdgeInsets.only(left: 370, top: 185),
                      child: IconButton(
                          onPressed: () {}, icon: Icon(CupertinoIcons.heart, color: Colors.red)),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 200, 0, 0),
                      child: Container(
                        height: 160,
                        width: 100,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/details/pulpFiction.jpg"))),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 160, top: 230, bottom: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Pulp Fiction",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  decoration: TextDecoration.none)),
                          Text("Director: Quentin Tarantino",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  decoration: TextDecoration.none)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Length: 140",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      decoration: TextDecoration.none)),
                              SizedBox(width: 10),
                              Text("Released: 1994",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      decoration: TextDecoration.none))
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit,"
                  " sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
                  "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris "
                  "nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in "
                  "reprehenderit in voluptate velit esse cillum ",
                  style:
                      TextStyle(fontSize: 20, color: Colors.black, decoration: TextDecoration.none),
                ),
              ),
            ),
            SliverToBoxAdapter(
                child: Row(
              children: [
                TextButton(onPressed: () {}, child: Text("Cast", style: TextStyle(fontSize: 20))),
                TextButton(onPressed: () {}, child: Text("Crew", style: TextStyle(fontSize: 20))),
              ],
            )),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 140,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                              backgroundColor: Colors.black,
                              radius: 50,
                              child: Icon(
                                CupertinoIcons.person_alt_circle,
                                color: Colors.white,
                                size: 60,
                              )),
                          Text(
                            "crewCastName",
                            style: TextStyle(
                                fontSize: 15, color: Colors.black, decoration: TextDecoration.none),
                          ),
                          Text(
                            "designation",
                            style: TextStyle(
                                fontSize: 15, color: Colors.black, decoration: TextDecoration.none),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: 10),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: ElevatedButton(
                  onPressed: () {},
                  child:
                      Text("Lets Talk About", style: TextStyle(fontSize: 30, color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      minimumSize: Size.fromHeight(60),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: 10),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: ElevatedButton(
                  onPressed: () {},
                  child:
                  Text("Rating", style: TextStyle(fontSize: 30, color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      minimumSize: Size.fromHeight(60),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: 10),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: ElevatedButton(
                  onPressed: () {},
                  child:
                  Text("Watch Later", style: TextStyle(fontSize: 30, color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      minimumSize: Size.fromHeight(60),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: 10),
            ),
          ],
        ),
      ),
    );
  }
}
