import 'package:flutter/material.dart';
import '../../../models/place_model.dart';
import '../../../resourses/assets_manager.dart';
import '../../../resourses/styles_manager.dart';
import '../widgets/popular_places_horiz_list.dart';
import '../widgets/places_grid_view.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  List<Place> get suggestedPlaces => [
        Place(
          name: 'Pyramids of Giza',
          governorate: 'Giza',
          image: PngAssets.pyramids,
          isFavorite: true,
        ),
        Place(
          name: 'Luxor Temple',
          governorate: 'Luxor',
          image: PngAssets.luxor,
        ),
        Place(
          name: 'Pyramids of Giza',
          governorate: 'Giza',
          image: PngAssets.pyramids,
          isFavorite: true,
        ),
        Place(
          name: 'Pyramids of Giza',
          governorate: 'Giza',
          image: PngAssets.pyramids,
          isFavorite: true,
        ),

        // TODO Add more places as needed
      ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 16.0, left: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16.0,
        children: [
          Text(
            'Popular Places',
            style: Styles.style20Bold(),
          ),
          Expanded(
            flex: 2,
            child: PopularPlacesHorizontalList(),
          ),
          Text(
            'Suggested Places to Visit',
            style: Styles.style20Bold(),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: PlacesGridView(
                places: suggestedPlaces,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
