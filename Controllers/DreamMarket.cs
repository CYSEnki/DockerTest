using Microsoft.AspNetCore.Mvc;

namespace DockerTest.Controllers
{
    public class DreamMarket : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
