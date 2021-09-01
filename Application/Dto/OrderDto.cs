using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Dto
{
    public class OrderDto : DtoBase
    {
        public string Phone { get; set; }
        public string Address { get; set; }
        public string City { get; set; }
        public string ZIPCode { get; set; }
        public bool IsGift { get; set; }
        public string Note { get; set; }
        public DateTime DeliverDate { get; set; }
        public int UserId { get; set; }
        public IEnumerable<CartDto> Items { get; set; } = new List<CartDto>(); //dolazi iz korpe iz baze ovo, ali zbog citanja porudzbine treba
    }
}
