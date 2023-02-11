import 'package:flutter/material.dart';
import 'package:sneakers_1/domain/entities/brand.dart';
import 'package:sneakers_1/domain/entities/sneaker.dart';
import 'package:sneakers_1/screen/home/widgets/sneakers_view.dart';

class SneakersContent extends StatefulWidget {
  const SneakersContent({
    required this.brand,
    super.key,
  });

  final Brand brand;

  static const sneakerTypes = [SneakerType.upcoming, SneakerType.featured, SneakerType.newModel];

  @override
  State<SneakersContent> createState() => _SneakersContentState();
}

class _SneakersContentState extends State<SneakersContent> {
  int activeTypeIndex = 1;

  @override
  Widget build(BuildContext context) {
    final sneakers = widget.brand.sneakersByType(SneakersContent.sneakerTypes[activeTypeIndex]);

    return Stack(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(
            left: 16,
            top: 8,
            bottom: 16,
          ),
          child: Column(
            children: [
              for (var i = 0; i < SneakersContent.sneakerTypes.length; i++)
                Expanded(
                  child: RotatedBox(
                    quarterTurns: -1,
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          activeTypeIndex = i;
                        });
                      },
                      child: Text(
                        SneakersContent.sneakerTypes[i].name,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: i == activeTypeIndex ? Colors.black : Colors.grey[400],
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
        if (sneakers.isNotEmpty) SneakersView(sneakers: sneakers),
      ],
    );
  }
}
