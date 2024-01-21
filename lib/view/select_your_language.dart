import 'dart:math';

import 'package:flick/controller/language_provider.dart';
import 'package:flick/dummy_data/background.dart';
import 'package:flick/dummy_data/langauges.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class SelectLanguage extends StatefulWidget {
  const SelectLanguage({super.key});

  @override
  State<SelectLanguage> createState() => _SelectLanguageState();
}

class _SelectLanguageState extends State<SelectLanguage> {
  @override
  Widget build(BuildContext context) {
    var languageS = context.watch<LanguageProvider>().languagePreference;
    Random random = Random();
    int randomImageIndex = random.nextInt(bgImage.length);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.black12,
        automaticallyImplyLeading: false,
        title: Text("Pick your language"),
        titleTextStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image:
                DecorationImage(image: AssetImage(bgImage[randomImageIndex]), fit: BoxFit.cover)),
        child: CustomScrollView(
          slivers: [
            // SliverToBoxAdapter(
            //     child: Center(
            //         child: Padding(
            //   padding: EdgeInsets.only(top: 10, bottom: 10),
            //   child: Text("What is your preferred language for movies",
            //       style: TextStyle(fontSize: 15)),
            // ))),
            SliverToBoxAdapter(child: SizedBox(height: 70)),
            SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 1.6),
              delegate: SliverChildBuilderDelegate(childCount: languages.length, (context, index) {
                return InkWell(
                  onTap: () {
                    if (!languageS.contains(languages[index])) {
                      context.read<LanguageProvider>().addLanguage(languages[index]);
                    } else {
                      context.read<LanguageProvider>().removeLanguage(languages[index]);
                    }
                  },
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 17),
                        child: Container(
                          //color: Colors.greenAccent,
                          height: 100,
                          width: 170,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.green.shade800),
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.greenAccent.shade100.withOpacity(.7)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 70, 0, 0),
                        child: Text(
                          languages[index],
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                          maxLines: 1,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(150, 15, 0, 0),
                        child: languageS.contains(languages[index])
                            ? FaIcon(
                                Icons.check_circle,
                                size: 25,
                              )
                            : FaIcon(
                                Icons.circle_outlined,
                                size: 25,
                              ),
                      )
                    ],
                  ),
                );
              }),
            )
          ],
        ),
      ),
      floatingActionButton: InkWell(
          onTap: () {},
          child: Container(
              height: 50,
              width: 100,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blueAccent.shade100),
              child: Text("Done", style: TextStyle(fontSize: 30)))),
    );
  }
}
