using System.ComponentModel.DataAnnotations;

namespace vgsearch.Models
{
    public class Game
    {
        [Key]
        public int game_id { get; set; }
        public string name { get; set; }
        public string comments {get; set; }
    }
}