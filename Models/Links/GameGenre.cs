namespace vgsearch.Models
{
    public class GameGenre
    {
        public int game_id { get; set; }
        public Game Game { get; set; }
        public int genre_id { get; set; }
        public Genre Genre { get; set; }
    }
}