using System.Threading.Tasks;
using System.Diagnostics;
using System.Linq;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using vgsearch.Models;
using Microsoft.Extensions.Logging;

namespace vgsearch.Controllers
{
    public class GameController : Controller
    {
        private readonly VGDatabaseContext _context;
        private readonly ILogger<GameController> _logger;
        public GameController(VGDatabaseContext context, ILogger<GameController> logger)
        {
            _context = context;
            _logger = logger;
        }

        public async Task<IActionResult> Detail(int? id)
        {
            _logger.LogInformation(1002, "Getting game {ID}", id);
            if (id == null) return NotFound();

            // This will query the database for the game with the specified ID.
            var game = await _context.Games.Where(x => x.id == id).SingleOrDefaultAsync();

            if (game == null) return NotFound();

            return View(game);
        }
    }
}