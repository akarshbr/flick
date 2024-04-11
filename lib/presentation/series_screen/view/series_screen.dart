import 'package:flick/presentation/series_screen/controller/series_controller.dart';
import 'package:flick/presentation/series_screen/view/widgets/series_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../config/app_config.dart';
import '../../../widgets/movie_series_card.dart';

class SeriesScreen extends StatefulWidget {
  const SeriesScreen({super.key});

  @override
  State<SeriesScreen> createState() => _SeriesScreenState();
}

class _SeriesScreenState extends State<SeriesScreen> {
  @override
  void initState() {
    fetchData();
    super.initState();
  }

  fetchData() {
    Provider.of<SeriesController>(context, listen: false).fetchSeries(context);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SeriesController>(builder: (context, controller, _) {
      return controller.isLoading == true
          ? const Center(child: CircularProgressIndicator())
          : GridView.builder(
          shrinkWrap: true,
          itemCount: controller.seriesModel.results?.length,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            mainAxisSpacing: 10,
            childAspectRatio: 0.75 / 1.1,
            crossAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SeriesDetailsScreen()));
              },
              child: MovieSeriesCard(
                  poster:
                  "${AppConfig.mediaUrlPoster}${controller.seriesModel.results?[index].posterPath}"),
            );
          });
    });
  }
}
