using Application.Dto;
using DataAccess;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Text;
using System.Linq;

namespace Implementation.Validators
{
    public class CreateOrderValidator : AbstractValidator<OrderDto>
    {
        public CreateOrderValidator(DixotekaDbContext context)
        {
            RuleFor(x => x.DeliverDate).GreaterThan(DateTime.Today).WithMessage("Order date must be in future.").LessThan(DateTime.Now.AddDays(30)).WithMessage("Order date can't be more than 30 days from today.");
            RuleFor(x => x.DeliverDate).Must(x => x.TimeOfDay.Hours >= 10 && x.TimeOfDay.Hours <= 20).WithMessage("Delivery time must be between 10:00h and 20:00h.");
            RuleFor(x => x.Address).NotEmpty().WithMessage("Address is required.");
            RuleFor(x => x.City).NotEmpty().WithMessage("City is required.");
            RuleFor(x => x.ZIPCode).NotEmpty().WithMessage("ZIPCode is required.");
            RuleFor(x => x.Phone).NotEmpty().WithMessage("Phone is required.");
            RuleFor(x => x.UserId).Must(uid => context.Carts.Any(x => x.UserId == uid)).WithMessage("You have to have at least one item in cart to purchase an order");
            //ne moze se napravi porudzbina ako nema nicega u korpi

            //ovo se pokrije prilikom kreiranja korpe jer i to ipak ide u bazu
            //RuleFor(x => x.Items).NotEmpty().WithMessage("There must be at least one order line.").Must(i => i.Select(x => x.ProductId).Distinct().Count() == i.Count()).WithMessage("Duplicate products are not allowed.")
            //    .DependentRules(() =>
            //    {
            //        RuleForEach(x => x.Items).SetValidator(new CreateOrderLineValidator(context));
            //    });
        }
    }
}
