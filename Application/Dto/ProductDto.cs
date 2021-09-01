using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Dto
{
    public class ProductDto : DtoBase
    {
        public string Name { get; set; }
        public string Description { get; set; }
        public IFormFile UploadedImage { get; set; }
        public string Image { get; set; }
        public decimal Price { get; set; }
        public bool IsNew { get; set; }
        public int? CategoryId { get; set; }
        public int Quantity { get; set; }
    }
}
