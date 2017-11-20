using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace vgsearch.Models
{
    public class Genre
    {
        [Key]
        public int genre_id { get; set; }
        public string name { get; set; }
        public List<GameGenre> Games { get; set; }
        public override string ToString() => name;
    }
}