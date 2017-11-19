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
            var game = await _context.Games.Where(x => x.game_id == id).SingleOrDefaultAsync();

            if (game == null) return NotFound();

            // Populate the collection of game releases.
            await _context.Entry(game).Collection(g => g.Releases).LoadAsync();

            _context.ReleasePlatforms.Include(rp => rp.Platform);

            foreach (var r in game.Releases)
            {
                await _context.Entry(r).Reference(re => re.Publisher).LoadAsync();
                await _context.Entry(r).Reference(re => re.Region).LoadAsync();
                await _context.Entry(r).Collection(re => re.Platforms).LoadAsync();
                foreach (var rp in r.Platforms)
                {
                    await _context.Entry(rp).Reference(x => x.Platform).LoadAsync();
                }
            }
            return View(game);
        }
    }
}