using Kutuphane.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Mvc;

namespace Kutuphane.Controllers
{
    public class BookController : Controller
    {

        Omicron_dbEntities db = new Omicron_dbEntities();

        public ActionResult Index()
        {
            return View();
        }



        [HttpPost]
        public string Search(string code, DateTime Start, DateTime Finish, int Status)
        {
            var book = from p in db.Person
                       join r in db.Reservation on p.ID equals r.PersonID
                       join b in db.Book on r.BookID equals b.ID
                       where (code == "*" || p.TC.Contains(code)) && r.PurchaseDate >= Start && r.PurchaseDate <= Finish && Status == -1 ? Status == -1 : r.Status == Status
                       select new
                       {
                           p.Name,
                           p.SurName,
                           p.TC,
                           b.BookName,
                           b.ISBN,
                           r.PurchaseDate,
                           r.DeliveryDate,
                           r.Status,
                           b.ID
                       };

            return JsonConvert.SerializeObject(book);
        }

        [HttpPost]
        public string SaveBook(string BookName, string ISBN)
        {
            Book book = new Book()
            {
                BookName = BookName,
                ISBN = ISBN
            };
            db.Book.Add(book);
            db.SaveChanges();
            return JsonConvert.SerializeObject(book.ID);
        }

        [HttpPost]
        public string SelectedBook(int id)
        {
            var book = from p in db.Person
                       join r in db.Reservation on p.ID equals r.PersonID
                       join b in db.Book on r.BookID equals b.ID
                       where b.ID == id
                       select new
                       {
                           p.Name,
                           p.SurName,
                           p.TC,
                           b.BookName,
                           b.ISBN,
                           r.PurchaseDate,
                           r.DeliveryDate,
                           r.Status,
                           r.BookID,
                           r.PersonID,
                           r.ID
                       };


            return JsonConvert.SerializeObject(book.FirstOrDefault());
        }


        [HttpPost]
        public string UpdateBook(int ID, string BookName, string ISBN)
        {
            var books = db.Book.Find(ID);

            books.BookName = BookName;
            books.ISBN = ISBN;

            db.SaveChanges();
            return JsonConvert.SerializeObject("");
        }

    }
}