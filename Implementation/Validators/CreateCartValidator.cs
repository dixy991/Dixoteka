using Application.Dto;
using DataAccess;
using Domain;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.Validators
{
    public class CreateCartValidator : AbstractValidator<CartDto>
    {
        private readonly DixotekaDbContext _context;

        public CreateCartValidator(DixotekaDbContext context)
        {
            _context = context;

            RuleFor(x => x.ProductId).Must(ProductExists).WithMessage("Product with an id of {PropertyValue} doesn't exist.").DependentRules(() => 
                {
                    RuleFor(x => x.Quantity).GreaterThan(0).WithMessage("Quantity must be greater than 0").Must(QuantityDoesentExeedProductQuantity).WithMessage(dto => {
                        var leftInStore = _context.Products.Find(dto.ProductId).Quantity;
                        return $"Defined quantity ({dto.Quantity}) is unavailable. Theres only {leftInStore} left in the store.";
                    });
                });
        }

        private bool ProductExists(int productId)
        {
            return _context.Products.Any(x => x.Id == productId);
        }

        public bool QuantityDoesentExeedProductQuantity(CartDto dto, int quantity)
        {
            return _context.Products.Find(dto.ProductId).Quantity >= quantity;
            //NEAM U BAZI OO
        }
    }
}
