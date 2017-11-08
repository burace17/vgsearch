using System.ComponentModel.DataAnnotations;

namespace vgsearch.Models
{
    public class Developer
    {
        [Key]
        public int developer_id { get; set; }
        public string name { get; set; }
        public string city_founded { get; set; }
        public string country_founded { get; set; }
    }
}