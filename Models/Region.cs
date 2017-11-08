using System.ComponentModel.DataAnnotations;

namespace vgsearch.Models
{
    public class Region
    {
        [Key]
        public int region_id { get; set; }
        public string name { get; set; }
    }
}