using Kutuphane.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Kutuphane.Controllers
{
    public class ReservationController : Controller
    {
        Omicron_dbEntities db = new Omicron_dbEntities();
        // GET: Reservation
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public string SaveReservation(int personID, int bookID, DateTime PurchaseDate)
        {
            TimeSpan hour = new TimeSpan(DateTime.Now.Hour, DateTime.Now.Minute, DateTime.Now.Second);
            Reservation reservation = new Reservation()
            {
                PersonID = personID,
                BookID = bookID,
                PurchaseDate = PurchaseDate.Add(hour),
                Status = 0
            };
            db.Reservation.Add(reservation);
            db.SaveChanges();
            return JsonConvert.SerializeObject("");
        }

        [HttpPost]
        public string UpdateReservation(int ID, int PersonID, int BookID, DateTime PurchaseDate, int Status)
        {
            var reservation = db.Reservation.Find(ID);
            TimeSpan hour = new TimeSpan(DateTime.Now.Hour, DateTime.Now.Minute, DateTime.Now.Second);
            if (Status == 1)
            {
                reservation.PersonID = PersonID;
                reservation.BookID = BookID;
                reservation.PurchaseDate = PurchaseDate.Add(hour);
                reservation.DeliveryDate = DateTime.Now;
                reservation.Status = Status;
            }
            else
            {
                reservation.PersonID = PersonID;
                reservation.BookID = BookID;
                reservation.PurchaseDate = PurchaseDate.Add(hour);
                reservation.DeliveryDate = null;
                reservation.Status = Status;
            }

            db.SaveChanges();
            return JsonConvert.SerializeObject("");
        }
    }
}