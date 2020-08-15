using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CodingTestWebApi.Models
{
    public class ItemRepository : IItem
    {

        private CodeTestContext db;

        public ItemRepository(CodeTestContext DB)
        {
            this.db = DB;
        }
        public List<Item> GetItemByNameStoredProc(string ItemName, Paging pagingParams)
        {
            //trying to get the datas from Stored Procedure.AS THE Foreign key is not working.
            if (db != null)
            {
                List<Item> items = new List<Item>();

                var productCategory = ItemName;

                var ItemList = db.Item.FromSqlRaw("GetItems @item_name",
               new SqlParameter("@item_name", ItemName)).ToList<Item>();

                return ItemList;
            }
            else
                return null;
        }
      

        //Get Item by Name Business Logic
        public List<Item> GetItemByName(string ItemName,Paging pagingParams)
        {
            if (db != null)
            {
                List<Item> items = new List<Item>();

                var result = ItemName=="" ? from o in db.Item
                             select o : from o in db.Item
                                        where o.Name == ItemName
                                        select o;

                foreach (var r in result)
                {
                    
                    Item i1 = new Item();
                    i1.Id = r.Id;
                    i1.Name = r.Name;
                    i1.Description = r.Description;
                    items.Add(i1);
                }

                return items.OrderBy(on => on.Name)
        .Skip((pagingParams.PageNumber - 1) * pagingParams.PageSize)
        .Take(pagingParams.PageSize)
        .ToList();
            }

            return null;
        }
    }
}
