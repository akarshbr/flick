import 'dart:math';
import 'package:flick/controller/language_provider.dart';
import 'package:flick/dummy_data/bagroundImage.dart';
import 'package:flick/dummy_data/langauges.dart';
import 'package:flick/view/current_Screen/current_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class SelectLanguage extends StatelessWidget {
  const SelectLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    Random random = Random();
    int randomImageIndex = random.nextInt(bgImage.length);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.black12,
        automaticallyImplyLeading: false,
        title: const Text("Pick your language"),
        titleTextStyle:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image:
                DecorationImage(image: AssetImage(bgImage[randomImageIndex]), fit: BoxFit.cover)),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: SizedBox(height: 100)),
            const SliverToBoxAdapter(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 20),
                  child: Text("What is your preferred language for movies",
                      style: TextStyle(
                        fontSize: 19,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ),
            ),
            Consumer<LanguageProvider>(builder: (context, languageProvider, child) {
              return SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 1.6),
                delegate:
                    SliverChildBuilderDelegate(childCount: languages.length, (context, index) {
                  return InkWell(
                    onTap: () {
                      if (!languageProvider.languagePreference.contains(languages[index])) {
                        languageProvider.addLanguage(languages[index]);
                      } else {
                        languageProvider.removeLanguage(languages[index]);
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
                                border: Border.all(color: Colors.white.withOpacity(.5)),
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white.withOpacity(.4)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(25, 70, 0, 0),
                          child: Text(
                            languages[index],
                            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700,color: Colors.white),
                            maxLines: 1,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(150, 15, 0, 0),
                          child: languageProvider.languagePreference.contains(languages[index])
                              ? const FaIcon(
                                  Icons.check_circle,
                                  size: 25,
                            color: Colors.white,
                                )
                              : const FaIcon(
                                  Icons.circle_outlined,
                                  size: 25,
                            color: Colors.white,
                                ),
                        )
                      ],
                    ),
                  );
                }),
              );
            })
          ],
        ),
      ),
      floatingActionButton: InkWell(
        onTap: () {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => CurrentScreen()), (route) => false);
        },
        child: Container(
            height: 50,
            width: 100,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.transparent),
                borderRadius: BorderRadius.circular(10),
                color: Colors.greenAccent.shade100),
            child: const Text("Done", style: TextStyle(fontSize: 30))),
      ),
    );
  }
}
