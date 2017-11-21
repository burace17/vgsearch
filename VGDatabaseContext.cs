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

           // Linking entities
           // Release <-> Platform
           public DbSet<ReleasePlatform> ReleasePlatforms { get; set; }
           public DbSet<GameGenre> GameGenres { get; set; }
           public DbSet<GameDeveloper> GameDevelopers { get; set; }

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
               builder.Entity<ReleasePlatform>().ToTable("releasehasplatform");
               builder.Entity<GameGenre>().ToTable("gamehasgenre");
               builder.Entity<GameDeveloper>().ToTable("gamehasdeveloper");

               // Many Releases to One Game.
               builder.Entity<Release>().HasOne(r => r.Game)
                                        .WithMany(g => g.Releases)
                                        .HasForeignKey(r => r.game_id);

               // Many Releases to One Publisher
               builder.Entity<Release>().HasOne(r => r.Publisher).WithMany().HasForeignKey(r => r.publisher_id);

               // Many Releases to One Rating
               builder.Entity<Release>().HasOne(r => r.Rating).WithMany().HasForeignKey(r => r.rating_id);

               // Many Releases to One Region
               builder.Entity<Release>().HasOne(r => r.Region).WithMany().HasForeignKey(r => r.region_id);


               // Linking entities
               // One Release to Many Platforms
               builder.Entity<ReleasePlatform>().HasKey(t => new { t.release_id, t.platform_id });
               builder.Entity<ReleasePlatform>().HasOne(r => r.Release).WithMany(t => t.Platforms).HasForeignKey(r => r.release_id);

               // Many Games to Many Genres (these must be represented as two one-to-many relations)
               builder.Entity<GameGenre>().HasKey(gg => new { gg.game_id, gg.genre_id });
               builder.Entity<GameGenre>().HasOne(gg => gg.Game).WithMany(g => g.Genres).HasForeignKey(gg => gg.game_id);
               builder.Entity<GameGenre>().HasOne(gg => gg.Genre).WithMany(ge => ge.Games).HasForeignKey(gg => gg.genre_id);

               // Many to Many? relationship between Game and Developer.
               builder.Entity<GameDeveloper>().HasKey(gd => new { gd.game_id, gd.developer_id });
               builder.Entity<GameDeveloper>().HasOne(gd => gd.Game).WithMany(g => g.Developers).HasForeignKey(gd => gd.game_id);
               builder.Entity<GameDeveloper>().HasOne(gd => gd.Developer).WithMany(d => d.Games).HasForeignKey(gd => gd.developer_id);
           }
       }
}