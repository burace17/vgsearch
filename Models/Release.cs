using System;
using System.ComponentModel.DataAnnotations;

namespace vgsearch.Models
{
    public class Release
    {
        [Key]
        public int release_id { get; set; }
        public DateTime dates { get; set; }
    }
}