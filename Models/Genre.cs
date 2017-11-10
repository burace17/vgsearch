using System.ComponentModel.DataAnnotations;

namespace vgsearch.Models
{
    public class Genre
    {
        [Key]
        public int genre_id { get; set; }
        public string name { get; set; }
        public override string ToString() => name;
    }
}