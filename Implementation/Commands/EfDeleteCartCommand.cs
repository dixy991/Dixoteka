using Application.Commands;
using Application.Exceptions;
using DataAccess;
using Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.Commands
{
    public class EfDeleteCartCommand : IDeleteCartCommand
    {
        private readonly DixotekaDbContext _context;

        public EfDeleteCartCommand(DixotekaDbContext context)
        {
            _context = context;
        }

        public int Id => 22;

        public string Name => "delete cart command";

        public void Execute(int request)
        {
            var cart = _context.Carts.Find(request);

            if (cart == null)
                throw new EntityNotFoundException(request, typeof(Cart));

            var item = _context.Carts.Find(request);

            _context.Products.Find(item.ProductId).Quantity += item.Quantity;
            _context.Carts.Remove(cart);
            _context.SaveChanges();
        }
    }
}
