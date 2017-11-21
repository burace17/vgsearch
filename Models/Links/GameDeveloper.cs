namespace vgsearch.Models
{
    public class GameDeveloper
    {
        public int game_id { get; set; }
        public Game Game { get; set; }
        public int developer_id { get; set; }
        public Developer Developer { get; set; }
    }
}