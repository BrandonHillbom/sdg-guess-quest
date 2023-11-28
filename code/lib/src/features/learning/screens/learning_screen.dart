import 'package:flutter/material.dart';
import 'package:sdg_guess_quest/src/constants/colors.dart';
import 'package:sdg_guess_quest/src/constants/sdg_info.dart';

class LearningScreen extends StatelessWidget {
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
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              // Title
              Text(
                'United Nations Sustainable Development Goals', // Your title here
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: primaryColor, // Adjust color as needed
                ),
              ),
              const SizedBox(height: 16),

              // Some text below the title
              Text(
                'The UN SDGs, or United Nations Sustainable Development Goals, are a set of 17 big goals that people from all around the world are working together to achieve. These goals aim to make our planet a better place by solving problems like poverty, hunger, and protecting the environment. This is in place so everyone can have a good life.',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 24),

              // Display information for each SDG in sdgInformation list
              for (int i = 0; i < 17; i++) ...[
                // Subheader with SDG title
                Text(
                  'SDG ${sdgInformation[i].number}: ${sdgInformation[i].title}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),

                // Description of the SDG
                Text(
                  sdgInformation[i].description,
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 16),

                // Subheader for Actionable Steps
                Text(
                  'What can you do?',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),

                // List of Actionable Steps
                for (var step in sdgInformation[i].actionableSteps) ...[
                  // Bullet point for each actionable step
                  Text(
                    '• $step',
                    style: TextStyle(
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
