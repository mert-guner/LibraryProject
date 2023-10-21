using Kutuphane.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Kutuphane.Controllers
{
    public class ReportController : Controller
    {
        Omicron_dbEntities db = new Omicron_dbEntities();

        // GET: Report
        public ActionResult Index()
        {
            return View();
        }




        [HttpPost]
        public string GetReport()
        {
            var reservations = db.Reservation.ToList();

            var list = reservations.Select(u => new Reservation
            {
                ID = u.ID,
                PurchaseDate = u.PurchaseDate,
                DeliveryDate = u.DeliveryDate,
                Status = u.Status,
                Book = new Book
                {
                    ID = u.Book.ID,
                    BookName = u.Book.BookName,
                    ISBN = u.Book.ISBN
                }
            }).ToList();

            list = list.Where(x => x.Status == 1).ToList();

            var report = list.GroupBy(x => new { x.Book.ISBN }).Select(g => new
            {
                ISBN = g.Key.ISBN,
                BookNames = g.Select(item => item.Book.BookName).FirstOrDefault(),
                Duration = g.Sum(r=> (r.DeliveryDate.Value - r.PurchaseDate.Value).TotalHours)

            }).ToList();



            return JsonConvert.SerializeObject(report);
        }
    }
}