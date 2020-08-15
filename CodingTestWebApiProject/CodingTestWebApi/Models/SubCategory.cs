using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace CodingTestWebApi.Models
{
    public partial class SubCategory
    {
        public SubCategory()
        {
            Item = new HashSet<Item>();
        }

        public int Id { get; set; }
        public int CategoryId { get; set; }
        [Required]
        [StringLength(50, MinimumLength = 3)]
        public string Name { get; set; }

        public virtual Category Category { get; set; }
        public virtual ICollection<Item> Item { get; set; }
    }
}
