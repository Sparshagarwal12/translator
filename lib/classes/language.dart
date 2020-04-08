class Language {
  final int id;
  // final String flag;
  final String name;
  final String languageCode;

  Language(this.id, this.name, this.languageCode);

  static List<Language> languageList() {
    return <Language>[
      Language(1, "English", "en"),
      Language(2, "Bengali", "bn"),
      Language(3, "Gujrati", "gu"),
      Language(4, "हिंदी", "hi"),
      Language(5, "Kannada", "kn"),
      Language(6, "Malayalm", "ml"),
      Language(7, "Marathi", "mr"),
      Language(8, "Punjabi", "pa"),
      Language(9, "Tamil", "ta"),
      Language(10, "Telgu", "te"),
      Language(11, "Urdu", "ur"),
      // Language(12, "हिंदी", "hi"),
    ];
  }
}
