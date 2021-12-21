import 'package:chekunov_rick_and_morty_client/core/app_theme_colors.dart';
import 'package:chekunov_rick_and_morty_client/features/character/domain/character_entity.dart';

import 'package:flutter/material.dart';

class CharacterDetailPage extends StatelessWidget {
  final CharacterEntity character;

  const CharacterDetailPage({Key? key, required this.character})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${character.id}. ${character.name}'),
        backgroundColor: Colors.white,
        foregroundColor: AppColors.logoColor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.network(character.image),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 8,
                  width: 8,
                  decoration: BoxDecoration(
                    color: character.status == 'Alive'
                        ? Colors.green
                        : character.status == 'Dead'
                            ? Colors.red
                            : Colors.grey,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  '${character.status} - ${character.species}',
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            if (character.type.isNotEmpty)
              ...buildText('Type:', character.type),
            ...buildText('Gender:', character.gender),
            ...buildText('First seen in:', character.origin.name),
            ...buildText('Last known location:', character.location.name),
            ...buildText('Created at:', character.created.toString()),
            ...buildText(
                'Screen time: ',
                character.episode.length == 1
                    ? '${character.episode.length.toString()} ${'episode'}'
                    : '${character.episode.length.toString()} ${'episodes'}'),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}

List<Widget> buildText(String text, String value) {
  return [
    Text(
      text,
      style: const TextStyle(
          color: AppColors.greyColor, fontWeight: FontWeight.bold),
    ),
    const SizedBox(
      height: 4,
    ),
    Text(
      value,
      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    ),
    const SizedBox(
      height: 16,
    ),
  ];
}
