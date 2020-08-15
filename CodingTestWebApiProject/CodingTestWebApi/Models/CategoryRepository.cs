using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CodingTestWebApi.Models
{
    public class CategoryRepository : ICategory
    {

        private CodeTestContext db;

        public CategoryRepository(CodeTestContext db)
        {
            this.db = db;
        }

        public void DeleteCategoryName(string CategoryName)
        {
            if (db != null)
            {

                var stud = (from s1 in db.Category
                           where s1.Name == CategoryName
                           select s1).SingleOrDefault();

                db.Remove(stud);
                //Save to database
                db.SaveChanges();
            }
        }
    }
}
