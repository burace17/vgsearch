using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;
using vgsearch.Models;
namespace vgsearch
{
       public partial class VGDatabaseContext : DbContext
       {
           public DbSet<Console> Consoles { get; set; }
           public DbSet<Developer> Developers { get; set; }
           public DbSet<Game> Games { get; set; }
           public DbSet<Genre> Genres { get; set; }
           public DbSet<PC> PCs { get; set; }
           public DbSet<Platform> Platforms { get; set; }
           public DbSet<Publisher> Publishers { get; set; }
           public DbSet<Rating> Ratings { get; set; }
           public DbSet<Region> Regions { get; set; }
           public DbSet<Release> Releases { get; set; }

           protected override void OnConfiguring(DbContextOptionsBuilder context)
           {
                context.UseNpgsql(@"Host=localhost;Database=vgsearch;Username=vgsearch;Password=mypassword");
           }

           protected override void OnModelCreating(ModelBuilder builder)
           {

           }
       }
}