using System.Threading.Tasks;
using System.Diagnostics;
using System.Linq;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using vgsearch.Models;

namespace vgsearch.Controllers
{
    public class GameController : Controller
    {
        private readonly VGDatabaseContext _context;
        public GameController(VGDatabaseContext context)
        {
            _context = context;
        }

        public IActionResult Index(int? gameId)
        {
            if (gameId == null) return NotFound();

            // This will query the database for the game with the specified ID.
            var game = _context.Games.Where(x => x.id == gameId);

            if (game == null) return NotFound();

            return View(game);
        }
    }
}