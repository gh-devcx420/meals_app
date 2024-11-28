import 'package:flutter/material.dart';
import 'package:meals_app/constants.dart';

class CustomAlertDialogue extends StatelessWidget {
  const CustomAlertDialogue(
      {super.key,
      required this.onSelectAppColour,
      required this.currentThemeColour});

  final void Function(Color) onSelectAppColour;
  final Color currentThemeColour;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: kUniversalAlertDialogueTitlePadding,
      contentPadding: kUniversalAlertDialogueContentPadding,
      title: Text(
        'Choose Theme Color',
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
      ),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          ...kAppColourList.map(
            (colour) {
              return InkWell(
                onTap: () {
                  onSelectAppColour(colour);
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    border: Border.all(
                      width: 2,
                      color: currentThemeColour == colour
                          ? colour
                          : Colors.transparent,
                    ),
                  ),
                  child: Icon(
                    Icons.circle_rounded,
                    color: colour,
                    size: 28,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
