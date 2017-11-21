using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace vgsearch.Models
{
    public class Game
    {
        public Game()
        {
            Releases = new List<Release>();
            Genres = new List<GameGenre>();
            Developers = new List<GameDeveloper>();
        }
        [Key]
        public int game_id { get; set; }
        public string name { get; set; }
        public string comments { get; set; }
        public List<GameGenre> Genres { get; set; }
        public List<Release> Releases { get; set; }
        public List<GameDeveloper> Developers { get; set; }
    }
}