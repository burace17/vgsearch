using System.ComponentModel.DataAnnotations;

namespace vgsearch.Models
{
    public class Publisher
    {
        [Key]
        public int publisher_id { get; set; }
        public string name { get; set; }
        public string city_founded { get; set; }
        public string country_founded { get; set; }
    }
}