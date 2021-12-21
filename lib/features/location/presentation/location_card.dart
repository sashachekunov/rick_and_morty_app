import 'package:chekunov_rick_and_morty_client/core/app_text_styles.dart';
import 'package:chekunov_rick_and_morty_client/features/location/domain/location_entity.dart';

import 'package:flutter/material.dart';

class LocationCard extends StatelessWidget {
  final LocationEntity location;

  const LocationCard({Key? key, required this.location}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${location.id}. ${location.name}',
                      style: AppTextStyles.infoTextStyle,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Type:',
                      style: AppTextStyles.bottonNavigationBarTextStyle,
                    ),
                    Text(location.type,
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w500)),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Dimension:',
                      style: AppTextStyles.bottonNavigationBarTextStyle,
                    ),
                    Text(location.dimension,
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w500)),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Text(
                          'Residents of location:',
                          style: AppTextStyles.bottonNavigationBarTextStyle,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          '${location.residents.length}',
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
