using Application.Dto;
using DataAccess;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.Validators
{
    public class UpdateCategoryValidator : AbstractValidator<CategoryDto>
    {
        public UpdateCategoryValidator(DixotekaDbContext context)
        {
            RuleFor(x => x.Name).NotEmpty().WithMessage("Name is required").DependentRules(() =>
              {
                  RuleFor(x => x.Name).Must((dto, name) => !context.Categories.Any(x => x.Name == name && x.Id != dto.Id)).WithMessage("The name already exists!");
              });
        }
    }
}
