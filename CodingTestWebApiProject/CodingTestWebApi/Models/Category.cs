using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace CodingTestWebApi.Models
{
    public partial class Category
    {
        public Category()
        {
            SubCategory = new HashSet<SubCategory>();
        }

        public int Id { get; set; }
        [Required]
        [StringLength(50, MinimumLength = 3)]
        public string Name { get; set; }

        public virtual ICollection<SubCategory> SubCategory { get; set; }
    }
}
