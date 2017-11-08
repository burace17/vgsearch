using System.ComponentModel.DataAnnotations;

namespace vgsearch.Models
{
    public class Platform
    {
        [Key]
        public int platform_id { get; set; }
        public string name { get; set; }
    }
}