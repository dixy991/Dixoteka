using Application.Commands;
using Application.Exceptions;
using DataAccess;
using Domain;
using Implementation.Extensions;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Commands
{
    public class EfDeleteUserCommand : IDeleteUserCommand
    {
        private readonly DixotekaDbContext _context;

        public EfDeleteUserCommand(DixotekaDbContext context)
        {
            _context = context;
        }

        public int Id => 8;

        public string Name => "delete user command";

        public void Execute(int request)
        {
            var user = _context.Users.Find(request);

            if (user == null)
                throw new EntityNotFoundException(request, typeof(User));

            user.Delete();

            _context.SaveChanges();

        }
    }
}

