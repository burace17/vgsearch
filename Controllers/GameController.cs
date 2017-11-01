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
        public GameController(VGDatabaseContext context)
        {
            _context = context;
        }

        [HttpGet]
        [Route("/Game/Detail")]
        public async Task<IActionResult> Detail([FromQuery]int? id)
        {
            if (id == null) return NotFound();

            // This will query the database for the game with the specified ID.
            var game = await _context.Games.Where(x => x.id == id).SingleOrDefaultAsync();

            if (game == null) return NotFound();

            return View(game);
        }
    }
}