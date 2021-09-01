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
    public class EfDeleteProductCommand : IDeleteProductCommand
    {
        private readonly DixotekaDbContext _context;

        public EfDeleteProductCommand(DixotekaDbContext context)
        {
            _context = context;
        }

        public int Id => 13;

        public string Name => "delete product command";

        public void Execute(int request)
        {
            var product = _context.Products.Find(request);

            if (product == null)
                throw new EntityNotFoundException(request, typeof(Product));

            product.Delete();

            _context.SaveChanges();
        }
    }
}
