using System.Diagnostics;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using vgsearch.Models;

namespace vgsearch.Controllers
{
    public class HomeController : Controller
    {
        private readonly VGDatabaseContext _context;

        public HomeController(VGDatabaseContext context)
        {
            _context = context;   
        }

        public IActionResult Index()
        {
            return View();
        }

        public IActionResult About()
        {
            ViewData["Message"] = "Your application description page.";

            return View();
        }

        public IActionResult Contact()
        {
            ViewData["Message"] = "Your contact page.";

            return View();
        }

        public async Task<IActionResult> AdvancedSearch()
        {
            ViewData["Regions"] = await _context.Regions.ToListAsync();
            ViewData["Genres"] = await _context.Genres.ToListAsync();
            return View();
        }

        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
