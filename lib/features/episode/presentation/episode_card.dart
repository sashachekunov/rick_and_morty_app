import 'package:chekunov_rick_and_morty_client/core/app_text_styles.dart';
import 'package:chekunov_rick_and_morty_client/features/episode/domain/episode_entity.dart';

import 'package:flutter/material.dart';

class EpisodeCard extends StatelessWidget {
  final EpisodeEntity episode;

  const EpisodeCard({Key? key, required this.episode}) : super(key: key);

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
                      '${episode.id}. ${episode.name} (${episode.code})',
                      style: AppTextStyles.infoTextStyle,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Air Date:',
                      style: AppTextStyles.bottonNavigationBarTextStyle,
                    ),
                    Text(episode.airDate,
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w500)),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Text(
                          'Characters in episode:',
                          style: AppTextStyles.bottonNavigationBarTextStyle,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          '${episode.characters.length}',
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
