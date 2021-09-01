using System;
using System.Collections.Generic;
using System.Text;

namespace Domain
{
    public class User : Entity
    {
        //[Required] - umesto konfiguracije
        
        //[MinLength(3)]
        public string Username { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Password { get; set; }
        public string Email { get; set; }

        public virtual ICollection<UserUseCase> UserUserCases { get; set; } = new HashSet<UserUseCase>();
        public virtual ICollection<AuditLog> AuditLogs { get; set; } = new HashSet<AuditLog>();
        public virtual ICollection<Cart> Carts { get; set; } = new HashSet<Cart>();
        public virtual ICollection<Order> Orders { get; set; } = new HashSet<Order>();
    }
}
