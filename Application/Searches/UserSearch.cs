using Application.Queries;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Searches
{
    public class UserSearch : PagedSearch
    {
        public string Keyword { get; set; }
    }
}
