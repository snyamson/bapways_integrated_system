class GenerateId {
  static String assignClientId(int id) {
    if (id < 10) {
      return 'BAS-GF/000$id';
    } else if (id < 100) {
      return 'BAS-GF/00$id';
    } else if (id < 1000) {
      return 'BAS-GF/0$id';
    } else {
      return 'BAS-GF/$id';
    }
  }

  static String assignOfficerId(int id) {
    if (id < 10) {
      return 'BAS-GS/00$id';
    } else {
      return 'BAS-GS/0$id';
    }
  }
}
