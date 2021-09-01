using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Dto
{
    public class CartDto : DtoBase
    {
        public int Quantity { get; set; }
        public decimal Price { get; set; }
        public int ProductId { get; set; }//?
        public string ProductName { get; set; }
        public int UserId { get; set; }
    }

    public class FullCartDto
    {
        public IEnumerable<CartDto> Items { get; set; } = new HashSet<CartDto>();
        public decimal Total { get; set; }
    }
}
