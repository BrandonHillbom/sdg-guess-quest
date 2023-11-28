import 'package:flutter/material.dart';
import 'package:sdg_guess_quest/src/constants/card.dart';
import 'package:sdg_guess_quest/src/constants/sdg_info.dart';

class InfoPopoverWidget extends StatelessWidget {
  final SDGCard card;

  InfoPopoverWidget({required this.card});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Exit button at the top
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),

              // Display the image with rounded borders
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: Colors.grey[200],
                ),
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Image.asset(
                      card.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Display card name as a header
              Text(
                card.name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),

              // Display card description
              Text(
                card.description,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 24),

              // Display information for each applied SDG
              for (int sdgNumber in card.appliedSDGs) ...[
                // Subheader with SDG title
                Text(
                  'SDG ${sdgInformation[sdgNumber - 1].number}: ${sdgInformation[sdgNumber - 1].title}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),

                // Description of the SDG
                Text(
                  sdgInformation[sdgNumber - 1].description,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 16),

                // Subheader for Actionable Steps
                const Text(
                  'What can you do?',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),

                // List of Actionable Steps
                for (var step
                    in sdgInformation[sdgNumber - 1].actionableSteps) ...[
                  // Bullet point for each actionable step
                  Text(
                    '• $step',
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
                const SizedBox(height: 24),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
