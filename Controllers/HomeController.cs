using System.Diagnostics;
using System.Linq;
using Microsoft.AspNetCore.Mvc;
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
            return View(_context.Games.ToList());
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

        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
