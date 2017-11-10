using System.ComponentModel.DataAnnotations;

namespace vgsearch.Models
{
    public class Rating
    {
        [Key]
        public int rating_id { get; set; }
        public string name { get; set; }
        public int age { get; set; }
        public override string ToString() => name;
    }
}