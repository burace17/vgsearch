using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;
using vgsearch.Models;
namespace vgsearch
{
       public partial class VGDatabaseContext : DbContext
       {
           public VGDatabaseContext(DbContextOptions<VGDatabaseContext> options) : base(options)
           {

           }
           public DbSet<Developer> Developers { get; set; }
           public DbSet<Game> Games { get; set; }
           public DbSet<Genre> Genres { get; set; }
           public DbSet<Platform> Platforms { get; set; }
           public DbSet<Publisher> Publishers { get; set; }
           public DbSet<Rating> Ratings { get; set; }
           public DbSet<Region> Regions { get; set; }
           public DbSet<Release> Releases { get; set; }

           protected override void OnModelCreating(ModelBuilder builder)
           {
               builder.Entity<Developer>().ToTable("developer");
               builder.Entity<Game>().ToTable("game");
               builder.Entity<Genre>().ToTable("genre");
               builder.Entity<Platform>().ToTable("platform");
               builder.Entity<Publisher>().ToTable("publisher");
               builder.Entity<Rating>().ToTable("ratings");
               builder.Entity<Region>().ToTable("region");
               builder.Entity<Release>().ToTable("releases");

               // Many Releases to One Game.
               builder.Entity<Release>().HasOne(r => r.Game)
                                        .WithMany(g => g.Releases)
                                        .HasForeignKey(r => r.game_id);

               // Many Releases to One Publisher
               builder.Entity<Release>().HasOne(r => r.Publisher).WithMany().HasForeignKey(r => r.platform_id);

               // Many Releases to One Rating
               builder.Entity<Release>().HasOne(r => r.Rating).WithMany().HasForeignKey(r => r.rating_id);

               // Many Releases to One Platform
               builder.Entity<Release>().HasOne(r => r.Platform).WithMany().HasForeignKey(r => r.platform_id);

               // Many Releases to One Region
               builder.Entity<Release>().HasOne(r => r.Region).WithMany().HasForeignKey(r => r.region_id);
           }
       }
}