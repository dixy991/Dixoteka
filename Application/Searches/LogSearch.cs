using Application.Queries;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Searches
{
    public class LogSearch : PagedSearch
    {
        public string DateFrom { get; set; }
        public string DateTo { get; set; }
        public string UseCaseName { get; set; }
        public string Actor { get; set; }
    }
}
