using Application.Dto;
using DataAccess;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.Validators
{
    public class CreateCategoryValidator : AbstractValidator<CategoryDto>
    {
        public CreateCategoryValidator(DixotekaDbContext context)
        {
            RuleFor(x => x.Name).NotEmpty().WithMessage("Name is required").DependentRules(() =>
              {
                  RuleFor(x => x.Name).Must(n => !context.Categories.Any(c => c.Name == n)).WithMessage("This name already exists!");//msm da mi nije unique u bazi al ok
              });
        }
    }
}
