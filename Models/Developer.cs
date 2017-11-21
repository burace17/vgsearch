using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace vgsearch.Models
{
    public class Developer
    {
        public Developer()
        {
            Games = new List<GameDeveloper>();
        }
        [Key]
        public int developer_id { get; set; }
        public string name { get; set; }
        public string city_founded { get; set; }
        public string country_founded { get; set; }
        public List<GameDeveloper> Games { get; set; }
    }
}