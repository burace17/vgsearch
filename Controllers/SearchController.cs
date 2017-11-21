using System.Collections.Generic;
using System.Threading.Tasks;
using System.Linq;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using vgsearch.Models;
using Microsoft.Extensions.Logging;

namespace vgsearch.Controllers
{
    public class SearchController : Controller
    {
        private readonly VGDatabaseContext _context;
        private readonly ILogger<SearchController> _logger;
        public SearchController(VGDatabaseContext context, ILogger<SearchController> logger)
        {
            _context = context;
            _logger = logger;
        }

        // Simple name search. Returns all matches
        [HttpGet]
        [Route("/Search/Search")]
        public async Task<IActionResult> Search([FromQuery]string query)
        {
            _logger.LogInformation(1002, "Searching for {query}", query);
            if (query == null) return View("/Views/Search/Search.cshtml", new List<Game>());
            
            // For each game, see if its name contains the input string and do a case insensitive comparison
            var result = await _context.Games.Where(x => x.name.ToLower().Contains(query.ToLower())).ToListAsync();

            return View("/Views/Search/Search.cshtml", result);
        }

        // Advanced search
        [HttpGet]
        [Route("/Search/AdvancedSearch")]
        public async Task<IActionResult> AdvancedSearch([FromQuery]string name = null, [FromQuery]string comment = null,
                                                        [FromQuery]string date = null, [FromQuery]string publisher = null,
                                                        [FromQuery]string rating = null, [FromQuery]string platform = null,
                                                        [FromQuery]string region = null, [FromQuery]string genre = null,
                                                        [FromQuery]string developer = null)
        {
            IQueryable<Game> queryable = _context.Games.Include(game => game.Releases);
            _context.Releases.Include(r => r.Publisher).Include(r => r.Rating).Include(r => r.Region);
            _context.GameGenres.Include(gg => gg.Genre);
            _context.GameDevelopers.Include(gd => gd.Developer);

            if (name != null)
            {
                queryable = queryable.Where(x => x.name.ToLower().Contains(name.ToLower()));
            }
            if (comment != null)
            {
                queryable = queryable.Where(x => x.comments.ToLower().Contains(comment.ToLower()));
            }
            if (date != null)
            {
                queryable = queryable.Where(x => x.Releases.Any(r => r.dates.ToString() == date)); // TODO: Check date formatting...
            }
            if (publisher != null)
            {
                queryable = queryable.Where(x => x.Releases.Any(r => r.Publisher.name == publisher));
            }
            if (rating != null)
            {
                queryable = queryable.Where(x => x.Releases.Any(r => r.Rating.name == rating));
            }
            if (region != null)
            {
                queryable = queryable.Where(x => x.Releases.Any(r => r.Region.name == region));
            }
            if (genre != null)
            {
                queryable = queryable.Where(x => x.Genres.Any(g => g.Genre.name == genre)); // TODO: allow searching by multiple genres..
            }
            if (developer != null)
            {
                queryable = queryable.Where(x => x.Developers.Any(d => d.Developer.name == developer));
            }

            var result = await queryable.ToListAsync();

            return View("/Views/Search/Search.cshtml", result);
        }
    }
}