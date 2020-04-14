class Language {
  final int id;
  // final String flag;
  final String name;
  final String languageCode;

  Language(this.id, this.name, this.languageCode);

  static List<Language> languageList() {
    return <Language>[
      Language(1, "English", "en"),
      Language(2, "বাংলা", "bn"),
      Language(3, "ગુજરાતી", "gu"),
      Language(4, "हिंदी", "hi"),
      Language(5, "ಕನ್ನಡ", "kn"),
      Language(6, "മലയാളം", "ml"),
      Language(7, "मराठी", "mr"),
      Language(8, "ਪੰਜਾਬੀ", "pa"),
      Language(9, "தமிழ்", "ta"),
      Language(10, "తెలుగు", "te"),
      Language(11, "اردو", "ur"),
      Language(12, "oriya", "or")
      // Language(12, "हिंदी", "hi"),
    ];
  }
}
