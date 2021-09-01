using Application.Queries;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Searches
{
    public class OrderSearch : PagedSearch
    {
        public string Keyword { get; set; }
        public bool IsGift { get; set; }
        public DateTime DeliverDate { get; set; }
        public int UserId { get; set; }
    }
}
