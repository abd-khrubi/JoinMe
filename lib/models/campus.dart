enum Campus {
  har,
  givat,
  ein_karem,
  rahovot
}



Campus stringToCampus(String campus){
  switch (campus) {
    case "Givat Ram":
      {
        return Campus.givat;
      }
    case "Ein Karem":
      {
        return Campus.ein_karem;
      }
    case "MT.Scopus":
      {
        return Campus.har;
      }
  }
  return Campus.rahovot;
}