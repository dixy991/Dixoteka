using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Dto
{
    public class UserDto : DtoBase
    {
        public string Username { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Password { get; set; }
        public string Email { get; set; }
        public IEnumerable<int> AllowedUseCases { get; set; } = new List<int> { 4, 11, 12, 20, 21, 22, 23, 24, 9, 35 };
    }
}
