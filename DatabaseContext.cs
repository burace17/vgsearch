using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;
namespace vgsearch
{
       public partial class DatabaseContext : DbContext
       {
           protected override void OnConfiguring(DbContextOptionsBuilder context)
           {
                context.UseNpgsql(@"Host=localhost;Database=entitycore;Username=postgres;Password=mypassword");
           }

           protected override void OnModelCreating(ModelBuilder builder)
           {

           }
       }
}