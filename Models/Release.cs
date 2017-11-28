using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace vgsearch.Models
{
    public class Release
    {
        public Release()
        {
            Platforms = new List<ReleasePlatform>();
        }
        [Key]
        public int release_id { get; set; }
        public int rating_id { get; set; }
        public int publisher_id { get; set; }
        public int region_id { get; set; }
        public int game_id { get; set; }
        public DateTime? dates { get; set; }
        public Rating Rating { get; set; }
        public Publisher Publisher { get; set; }
        public Region Region { get; set; }
        public List<ReleasePlatform> Platforms { get; set; }
        public Game Game { get; set; }
    }
}