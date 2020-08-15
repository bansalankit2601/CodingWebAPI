using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CodingTestWebApi.Models
{
    public interface IItem
    {
        List<Item> GetItemByName(string Name,Paging param);
        List<Item> GetItemByNameStoredProc(string Name, Paging param);
        
    }
}
