import 'package:chekunov_rick_and_morty_client/core/app_text_styles.dart';
import 'package:chekunov_rick_and_morty_client/core/app_theme_colors.dart';
import 'package:chekunov_rick_and_morty_client/features/character/domain/character_entity.dart';

import 'package:flutter/material.dart';

class CharacterCard extends StatelessWidget {
  final CharacterEntity character;

  const CharacterCard({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        splashColor: AppColors.selectedItem,
        onTap: () {
          debugPrint('Card tapped.');
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              character.image,
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) return child;
                return Container(
                  height: 300,
                  width: 300,
                  color: AppColors.cardBackground,
                  child: const Center(child: CircularProgressIndicator()),
                );
              },
            ),
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
                        character.name,
                        style: AppTextStyles.infoTextStyle,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 8,
                            width: 8,
                            decoration: BoxDecoration(
                              color: character.status == 'Alive'
                                  ? Colors.green
                                  : Colors.red,
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            '${character.status} - ${character.species}',
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        'Last known location:',
                        style: AppTextStyles.bottonNavigationBarTextStyle,
                      ),
                      Text(character.location.name,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500)),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        'First seen in:',
                        style: AppTextStyles.bottonNavigationBarTextStyle,
                      ),
                      Text(character.origin.name,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500)),
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
      ),
    );
  }
}

// const SizedBox(
//   height: 16,
// ),
// Row(
//   children: [
//     const SizedBox(
//       width: 16,
//     ),
//     Text(
//       character.name,
//       style: AppTextStyles.infoTextStyle,
//       textAlign: TextAlign.left,
//     ),
//   ],
// ),
// Row(
//   children: [
//     const SizedBox(
//       width: 16,
//     ),
//     Container(
//       height: 8,
//       width: 8,
//       decoration: BoxDecoration(
//         color:
//             character.status == 'Alive' ? Colors.green : Colors.red,
//         borderRadius: BorderRadius.circular(8),
//       ),
//     ),
//     const SizedBox(
//       width: 8,
//     ),
//     Expanded(
//       child: Text(
//         '${character.status} - ${character.species}',
//         style: const TextStyle(color: Colors.white),
//         maxLines: 1,
//         overflow: TextOverflow.ellipsis,
//       ),
//     ),
//   ],
// ),
// const SizedBox(
//   height: 16,
// ),
// Row(
//   children: [
//     const SizedBox(
//       width: 16,
//     ),
//     Text(
//       'Last known location:',
//       style: AppTextStyles.bottonNavigationBarTextStyle,
//     ),
//   ],
// ),
// Row(
//   children: [
//     const SizedBox(
//       width: 16,
//     ),
//     Text(
//       character.location.name,
//     ),
//   ],
// ),
// const SizedBox(
//   height: 16,
// ),
// Row(
//   children: [
//     const SizedBox(
//       width: 16,
//     ),
//     Text(
//       'First seen in:',
//       style: AppTextStyles.bottonNavigationBarTextStyle,
//     ),
//   ],
// ),
// Row(
//   children: [
//     const SizedBox(
//       width: 16,
//     ),
//     Text(
//       character.origin.name,
//     ),
//   ],
// ),
// const SizedBox(
//   height: 16,
// ),

class PersonCard extends StatelessWidget {
  final CharacterEntity person;

  const PersonCard({Key? key, required this.person}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        children: [
          Image.network(
            person.image,
            width: 166,
            height: 166,
            loadingBuilder: (BuildContext context, Widget child,
                ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) return child;
              return Container(
                height: 166,
                width: 166,
                color: AppColors.cardBackground,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 12,
                ),
                Text(
                  person.name,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  children: [
                    Container(
                      height: 8,
                      width: 8,
                      decoration: BoxDecoration(
                        color: person.status == 'Alive'
                            ? Colors.green
                            : Colors.red,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: Text(
                        '${person.status} - ${person.species}',
                        style: const TextStyle(color: Colors.black),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                const Text(
                  'Last known location:',
                  style: TextStyle(),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  person.location.name,
                  style: const TextStyle(color: Colors.black),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 12,
                ),
                const Text(
                  'Origin:',
                  style: TextStyle(),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  person.origin.name,
                  style: const TextStyle(color: Colors.black),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 12,
          ),
        ],
      ),
    );
  }
}
