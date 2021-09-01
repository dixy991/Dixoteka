using System;
using System.Collections.Generic;
using System.Text;

namespace Domain
{
    public class Cart 
    {
        public int Id { get; set; }
        public int Quantity { get; set; }
        //total/sum?

        public int? ProductId { get; set; }//ja msm da je ovo ? na nivou Dtoa..nenen ovde je ok jer ako se obrise proizvod ovde bude null? hmmm mozda ipak u order lineu
        public int UserId { get; set; }
        public virtual Product Product { get; set; }
        public virtual User User { get; set; }
    }
}
