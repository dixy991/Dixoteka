using System;
using System.Collections.Generic;
using System.Text;

namespace Domain
{
    public class Order : Entity
    {
        public string Phone { get; set; }
        public string Address { get; set; }
        public string City { get; set; }
        public string ZIPCode { get; set; }
        public bool IsGift { get; set; }
        public string Note { get; set; }
        public DateTime DeliverDate { get; set; }
        //public DateTime OrderDate { get; set; }//created at?

        public int UserId { get; set; }
        public virtual User User { get; set; }
        public virtual ICollection<OrderLine> OrderLines { get; set; } = new HashSet<OrderLine>();
    }
    //order status?!
}
