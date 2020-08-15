using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using CodingTestWebApi.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Extensions.Logging;

namespace CodingTestWebApi.Controllers
{
   
    [ApiController]
    public class HomeController : ControllerBase
    {
        //Creating repository objects here
        private IItem itemRepository;
        private ICategory categoryRepository;
        private CodeTestContext DBContext;

        public HomeController()
        {
            DBContext = new CodeTestContext();
            this.itemRepository = new ItemRepository(DBContext);
            this.categoryRepository = new CategoryRepository(DBContext);
        }
        
        [Route("Home/GetItemByName")]
        [HttpGet]
        //Action Method to get Items by Name
        public IActionResult GetItemByName(string itemName=null,int pageNumber=1)
        {
            try
            {
                if (itemName == null)
                    itemName = "";
                var messages = itemRepository.GetItemByName(itemName,new Paging() { PageNumber = pageNumber });
                if (messages == null)
                {
                    return NotFound();
                }

                return Ok(messages);
            }
            catch (Exception e)
            {
                return BadRequest(e.Message);
            }
        }
        [Route("Home/DeleteItemByCategory")]
        [HttpDelete]
        //Action Method to Delete a Category
        public IActionResult DeleteItemByCategory(string CategoryName)
        {
            try
            {
                categoryRepository.DeleteCategoryName(CategoryName);
                return Ok("Successfully Deleted the Record");
            }
            catch (Exception e)
            {
                return BadRequest(e.Message);
            }
        }
        [Route("Home/GetItemByNameStoredProc")]
        [HttpGet]
        public IActionResult GetItemByNameStoredProc(string itemName = null, int pageNumber = 1)
        {
            //trying to get the datas from Stored Procedure.AS THE Foreign key is not working.
            try
            {
                if (itemName == null)
                    itemName = "";
                var messages = itemRepository.GetItemByNameStoredProc(itemName, new Paging() { PageNumber = pageNumber });
                if (messages == null)
                {
                    return NotFound();
                }

                return Ok(messages);
            }
            catch (Exception e)
            {
                return BadRequest(e.Message);
            }
        }
        
    }
}