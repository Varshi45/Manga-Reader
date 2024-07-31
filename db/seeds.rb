# Ensure the existence of required records for the application
User.find_or_create_by!(email: 'john@doe.com') do |user|
  user.password = '1234'
  user.admin = true
end

# Manga records to seed
mangas = [
  {
    title: "Attack On Titan",
    author: "Hajime Isayama",
    first_published_date: "2009-09-09",
    description: "After his hometown is destroyed, young Eren Jaeger vows to cleanse the earth of the giant humanoid Titans that have brought humanity to the brink of extinction.",
    category: ["Action", "Mystery", "Fantasy"],
    rating: 4.8,
    views_count: 6
  },
  {
    title: "Your Name",
    author: "Makoto Shinkai",
    first_published_date: "2016-08-26",
    description: "Two teenagers share a profound, magical connection upon discovering they are swapping bodies. Things manage to become even more complicated when the boy and girl decide to meet in person.",
    category: ["Romance", "Drama", "Slice of Life"],
    rating: 0.0,
    views_count: 5
  },
  {
    title: "Frieren: Beyond Journey's End",
    author: "Kanehito Yamada",
    first_published_date: "2020-04-28",
    description: "An elf and her friends defeat a demon king in a great war. But the war is over, and the elf must search for a new way of life.",
    category: ["Fiction", "Adventure", "Fantasy"],
    rating: 4.3,
    views_count: 7
  },
  {
    title: "Demon Slayer: Kimetsu no Yaiba",
    author: "Koyoharu Gotouge",
    first_published_date: "2016-02-15",
    description: "A family is attacked by demons and only two members survive - Tanjiro and his sister Nezuko, who is turning into a demon slowly. Tanjiro sets out to become a demon slayer to avenge his family and cure his sister.",
    category: ["Action", "Adventure", "Fantasy"],
    rating: 0.0,
    views_count: 6
  },
  {
    title: "Death Note",
    author: "Tsugumi Ohba",
    first_published_date: "2003-12-01",
    description: "An intelligent high school student goes on a secret crusade to eliminate criminals from the world after discovering a notebook capable of killing anyone whose name is written into it.",
    category: ["Fiction", "Horror", "Sci-Fi"],
    rating: 4.5,
    views_count: 9
  }
]

# Seed the Manga records
mangas.each do |manga|
  Manga.find_or_create_by!(title: manga[:title]) do |m|
    m.author = manga[:author]
    m.first_published_date = manga[:first_published_date]
    m.description = manga[:description]
    m.category = manga[:category]
    m.rating = manga[:rating]
    m.views_count = manga[:views_count]
  end
end

# Image records to seed
images = [
  {
    link: "https://m.media-amazon.com/images/M/MV5BMjVjZGU5ZTktYTZiNC00N2Q1LThiZjMtMDVmZDljN2I3ZWIwXkEyXkFqcGdeQXVyMTUzMTg2ODkz._V1_FMjpg_UX1000_.jpg",
    manga_id: Manga.find_by(title: "Frieren: Beyond Journey's End").id
  },
  {
    link: "https://m.media-amazon.com/images/M/MV5BNjRiNmNjMmMtN2U2Yi00ODgxLTk3OTMtMmI1MTI1NjYyZTEzXkEyXkFqcGdeQXVyNjAwNDUxODI@._V1_FMjpg_UX1000_.jpg",
    manga_id: Manga.find_by(title: "Death Note").id
  },
  {
    link: "https://m.media-amazon.com/images/M/MV5BZjZjNzI5MDctY2Y4YS00NmM4LTljMmItZTFkOTExNGI3ODRhXkEyXkFqcGdeQXVyNjc3MjQzNTI@._V1_.jpg",
    manga_id: Manga.find_by(title: "Demon Slayer: Kimetsu no Yaiba").id
  },
  {
    link: "https://m.media-amazon.com/images/M/MV5BNDFjYTIxMjctYTQ2ZC00OGQ4LWE3OGYtNDdiMzNiNDZlMDAwXkEyXkFqcGdeQXVyNzI3NjY3NjQ@._V1_FMjpg_UX1000_.jpg",
    manga_id: Manga.find_by(title: "Attack On Titan").id
  },
  {
    link: "https://m.media-amazon.com/images/M/MV5BNGYyNmI3M2YtNzYzZS00OTViLTkxYjAtZDIyZmE1Y2U1ZmQ2XkEyXkFqcGdeQXVyMTA4NjE0NjEy._V1_.jpg",
    manga_id: Manga.find_by(title: "Your Name").id
  },
  {
    link: "https://m.media-amazon.com/images/M/MV5BZjJlNzE5YzEtYzQwYS00NTBjLTk5YzAtYzUwOWQyM2E3OGI2XkEyXkFqcGdeQXVyNTgyNTA4MjM@._V1_.jpg",
    manga_id: Manga.find_by(title: "Frieren: Beyond Journey's End").id
  }
]

# Seed the Image records
images.each do |image|
  Image.find_or_create_by!(link: image[:link], manga_id: image[:manga_id])
end

# Chapter records to seed
chapters = [
  {
    title: "Chapter-1: To You In 2000 Years",
    link: "https://mangareader.to/read/attack-on-titan-37/en/chapter-1",
    manga_id: Manga.find_by(title: "Attack On Titan").id
  },
  {
    title: "Chapter-2: That Day",
    link: "https://mangareader.to/read/attack-on-titan-37/en/chapter-2",
    manga_id: Manga.find_by(title: "Attack On Titan").id
  },
  {
    title: "Chapter-3: Night of the Disbanding Ceremony",
    link: "https://mangareader.to/read/attack-on-titan-37/en/chapter-3",
    manga_id: Manga.find_by(title: "Attack On Titan").id
  },
  {
    title: "Chapter-4: First Battle",
    link: "https://mangareader.to/read/attack-on-titan-37/en/chapter-4",
    manga_id: Manga.find_by(title: "Attack On Titan").id
  },
  {
    title: "Chapter-5: A Dull Glow in the Middle of Despair",
    link: "https://mangareader.to/read/attack-on-titan-37/en/chapter-5",
    manga_id: Manga.find_by(title: "Attack On Titan").id
  },
  {
    title: "Chapter-6: The World That the Girl Saw",
    link: "https://mangareader.to/read/attack-on-titan-37/en/chapter-6",
    manga_id: Manga.find_by(title: "Attack On Titan").id
  },
  {
    title: "Chapter-7: Small Blade",
    link: "https://mangareader.to/read/attack-on-titan-37/en/chapter-7",
    manga_id: Manga.find_by(title: "Attack On Titan").id
  },
  {
    title: "Chapter-8: Roar",
    link: "https://mangareader.to/read/attack-on-titan-37/en/chapter-8",
    manga_id: Manga.find_by(title: "Attack On Titan").id
  },
  {
    title: "Chapter-1: The End of Adventure",
    link: "https://mangareader.to/read/frieren-beyond-journeys-end-72/en/chapter-1",
    manga_id: Manga.find_by(title: "Frieren: Beyond Journey's End").id
  },
  {
    title: "Chapter-2: The Priest's Life",
    link: "https://mangareader.to/read/frieren-beyond-journeys-end-72/en/chapter-2",
    manga_id: Manga.find_by(title: "Frieren: Beyond Journey's End").id
  },
  {
    title: "Chapter-3: A Place for Happiness",
    link: "https://mangareader.to/read/frieren-beyond-journeys-end-72/en/chapter-3",
    manga_id: Manga.find_by(title: "Frieren: Beyond Journey's End").id
  },
  {
    title: "Chapter-4: The Trial of the Witch",
    link: "https://mangareader.to/read/frieren-beyond-journeys-end-72/en/chapter-4",
    manga_id: Manga.find_by(title: "Frieren: Beyond Journey's End").id
  },
  {
    title: "Chapter-5: Memories",
    link: "https://mangareader.to/read/frieren-beyond-journeys-end-72/en/chapter-5",
    manga_id: Manga.find_by(title: "Frieren: Beyond Journey's End").id
  }
]

# Seed the Chapter records
chapters.each do |chapter|
  Chapter.find_or_create_by!(title: chapter[:title], link: chapter[:link], manga_id: chapter[:manga_id])
end
