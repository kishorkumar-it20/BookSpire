class Genredetail{
  String image;
  String genre;

Genredetail({required this.genre,required this.image});
}
List<Genredetail> getGenres(){
  List<Genredetail> genres=<Genredetail>[];
  Genredetail genredetail = Genredetail(genre: "Sci-fic", image: "assets/sci-fiction.jpg",);
  genres.add(genredetail);
  genredetail = Genredetail(genre: "Adventure", image: "assets/adventure.jpg",);
  genres.add(genredetail);
  genredetail = Genredetail(genre: "Biography", image: "assets/biography.jpg",);
  genres.add(genredetail);
  genredetail = Genredetail(genre: "Fantasy", image: "assets/fantasy.jpg",);
  genres.add(genredetail);
  genredetail = Genredetail(genre: "Horror", image: "assets/horrer.jpg",);
  genres.add(genredetail);
  genredetail = Genredetail(genre:  "Memoir", image: "assets/memior.jpg",);
  genres.add(genredetail);
  genredetail = Genredetail(genre: "Mystery", image:"assets/mystery.png",);
  genres.add(genredetail);
  genredetail = Genredetail(genre: "Romance", image: "assets/romance.jpg",);
  genres.add(genredetail);
  genredetail = Genredetail(genre: "Self", image: "assets/self-help.jpg",);
  genres.add(genredetail);
  genredetail = Genredetail(genre: "Thriller", image:  "assets/thriller.jpg",);
  genres.add(genredetail);
  return genres;
}