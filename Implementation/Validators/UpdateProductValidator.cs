using Application.Dto;
using DataAccess;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.Validators
{
    public class UpdateProductValidator : AbstractValidator<ProductDto> 
    {
        public UpdateProductValidator(DixotekaDbContext context)
        {
            RuleFor(x => x.Name).NotEmpty().WithMessage("Name is required").DependentRules(() =>
            {
                RuleFor(x => x.Name).Must((dto, name) => !context.Products.Any(x => x.Name == name && x.Id != dto.Id)).WithMessage("The name already exists!");
            }); ;
            RuleFor(x => x.Description).NotEmpty().WithMessage("Description is required");
            RuleFor(x => x.Image).NotEmpty().WithMessage("Image is required");
            RuleFor(x => x.Price).GreaterThan(0).WithMessage("Price must be greater than 0!");
            RuleFor(x => x.CategoryId).NotEmpty().WithMessage("Category is required").DependentRules(() =>
            {
                RuleFor(x => x.CategoryId).Must(cat => context.Categories.Any(c => c.Id == cat)).WithMessage("This category does not exist!");//msm da mi nije unique u bazi al ok
            }); ;
        }
    }
}
