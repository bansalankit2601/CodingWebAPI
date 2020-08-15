using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace CodingTestWebApi.Models
{
    public partial class Item
    {
        public int Id { get; set; }
        public int SubCategoryId { get; set; }
        [Required]
        [StringLength(50, MinimumLength = 3)]
        public string Name { get; set; }
        public string Description { get; set; }

        public  virtual SubCategory SubCategory { get; set; }
    }
}
