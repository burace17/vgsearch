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
        public async Task<List<Game>> Search([FromQuery]string query)
        {
            _logger.LogInformation(1002, "Searching for {query}", query);
            if (query == null) return new List<Game>();
            
            // For each game, see if its name contains the input string and do a case insensitive comparison
            return await _context.Games.Where(x => x.name.ToLower().Contains(query.ToLower())).ToListAsync();
        }

        // Advanced search
        [HttpGet]
        [Route("/Search/AdvancedSearch")]
        public async Task<List<Game>> AdvancedSearch([FromQuery]string name = null, [FromQuery]string comment = null)
        {
            IQueryable<Game> queryable = _context.Games;
            if (name != null)
            {
                queryable = queryable.Where(x => x.name.ToLower().Contains(name.ToLower()));
            }
            if (comment != null)
            {
                queryable = queryable.Where(x => x.comment.ToLower().Contains(comment.ToLower()));
            }
            return await queryable.ToListAsync();
        }
    }
}