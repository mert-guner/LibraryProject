using Kutuphane.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Kutuphane.Controllers
{
    public class PersonController : Controller
    {
        Omicron_dbEntities db = new Omicron_dbEntities();
        // GET: Person
        public ActionResult Index()
        {
            return View();
        }


        [HttpPost]
        public string SavePerson(string Name, string Surname, string TC)
        {
            Person person = new Person()
            {
                Name = Name,
                SurName = Surname,
                TC = TC
            };
            db.Person.Add(person);
            db.SaveChanges();
            return JsonConvert.SerializeObject(person.ID);
        }

        [HttpPost]
        public string UpdatePerson(int ID,string Name, string Surname, string TC)
        {
            var person = db.Person.Find(ID);

            person.Name = Name;
            person.SurName = Surname;
            person.TC = TC;

            db.SaveChanges();
            return JsonConvert.SerializeObject("");
        }
    }
}