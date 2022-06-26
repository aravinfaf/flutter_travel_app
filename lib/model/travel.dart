class Travel {
  String name;
  String location;
  String url;

  Travel(this.name, this.location, this.url);

  static List<Travel> getTravelBlog() {
    return [
      Travel('Chennai', 'Industrial hub', 'assets/images/top1.jpg'),
      Travel('Coimbatore', 'Automobiles', 'assets/images/top2.jpg'),
      Travel('Madurai', 'Meenakshi temple', 'assets/images/top3.jpg'),
      Travel('Salem', 'Mango', 'assets/images/top4.jpg'),
    ];
  }

  static List<Travel> getPopularBlog() {
    return [
      Travel('Chennai', 'Guindy', 'assets/images/bottom1.jpg'),
      Travel('Coimbatore', 'Saravanampatti', 'assets/images/bottom2.jpg'),
      Travel('Madurai', 'Nagamalai', 'assets/images/bottom2.jpg'),
      Travel('Salem', '5 roads', 'assets/images/bottom4.jpg'),
    ];
  }
}
