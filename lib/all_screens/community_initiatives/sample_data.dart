import 'initiative.dart';

final List<Initiative> initiatives = List.generate(
  25,
      (index) => Initiative(
    titleEn: "Dental Checkup Camp #$index",
    titleKn: "ದಂತ ತಪಾಸಣೆ ಶಿಬಿರ #$index",
    descriptionEn: "Free dental checkup and awareness program for all ages.",
    descriptionKn: "ಎಲ್ಲ ವಯೋಮಾನದವರಿಗೆ ಉಚಿತ ದಂತ ತಪಾಸಣೆ ಮತ್ತು ಜಾಗೃತಿ ಕಾರ್ಯಕ್ರಮ.",
    date: "25th Sept 2025, 10 AM - 4 PM",
    locationEn: "Community Hall, Main Road",
    locationKn: "ಸಮುದಾಯ ಸಭಾಂಗಣ, ಮುಖ್ಯ ರಸ್ತೆ",
    imageUrl: "https://via.placeholder.com/400x200.png?text=Camp+$index",
    year: 2025,
    month: 9,
  ),
);
