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
        }
        [Key]
        public int game_id { get; set; }
        public string name { get; set; }
        public string comments { get; set; }
        public ICollection<Release> Releases { get; set; }
    }
}