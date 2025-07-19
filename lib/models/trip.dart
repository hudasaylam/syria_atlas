// ignore_for_file: constant_identifier_names

enum TripType { Adventure, Chill, History, Nature }

enum Governorate {
  Aleppo,
  Raqqa,
  Suwayda,
  Damascus,
  Daraa,
  Deir_ezzor,
  Hama,
  Al_Hasaka,
  Homs,
  Idlib,
  Latakia,
  Quneitra,
  Tartus,
  Rif_Dimashq,
}

class Trip {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> properities;

  final TripType tripType;
  final bool isInSummer;
  final bool isInWinter;
  final Governorate governorate;
  final String description;

  const Trip({
    required this.id,
    required this.categories,
    required this.title,
    required this.imageUrl,
    required this.isInSummer,
    required this.isInWinter,
    required this.properities,
    required this.tripType,
    required this.governorate,
    required this.description,
  });
}
