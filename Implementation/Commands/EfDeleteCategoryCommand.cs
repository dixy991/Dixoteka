using Application.Commands;
using Application.Dto;
using Application.Exceptions;
using DataAccess;
using Domain;
using Implementation.Extensions;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.Commands
{
    public class EfDeleteCategoryCommand : IDeleteCategoryCommand
    {
        private readonly DixotekaDbContext _context;

        public EfDeleteCategoryCommand(DixotekaDbContext context)
        {
            _context = context;
        }

        public int Id => 6;

        public string Name => "delete category command";

        public void Execute(int id)
        {
            var category = _context.Categories.Include(x => x.Products).FirstOrDefault(x => x.Id == id);

            if (category.Products.Any())
                throw new ConflictBetweenEntitiesException(id, typeof(Category), typeof(Product));

            if (category == null)
                throw new EntityNotFoundException(id, typeof(Category));

            category.Delete();

            _context.SaveChanges();
        }
    }
}
