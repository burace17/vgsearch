namespace vgsearch.Models
{
    public class ReleasePlatform
    {
        public int release_id { get; set; }
        public Release Release { get; set; }
        public int platform_id { get; set; }
        public Platform Platform { get; set; }
    }
}