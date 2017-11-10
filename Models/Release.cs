using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace vgsearch.Models
{
    public class Release
    {
        [Key]
        public int release_id { get; set; }
        public int rating_id { get; set; }
        public int publisher_id { get; set; }
        public int region_id { get; set; }
        public int platform_id { get; set; }
        public int game_id { get; set; }
        public DateTime dates { get; set; }

        [ForeignKey("rating_id")]
        public Rating Rating { get; set; }

        [ForeignKey("publisher_id")]
        public Publisher Publisher { get; set; }

        [ForeignKey("region_id")]
        public Region Region { get; set; }

        [ForeignKey("platform_id")]
        public Platform Platform { get; set; }

        public Game Game { get; set; }
    }
}