using Application.Dto;
using Application.Queries;
using AutoMapper;
using Domain;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;

namespace Implementation.Extensions
{
    public static class QueryableExtensions
    {
        public static PagedResponse<TDto> Paged<TDto, TEntity>(
            this IQueryable<TEntity> query, PagedSearch search, IMapper mapper)
            where TDto : class
        {
            var skipCount = search.PerPage * (search.Page - 1);

            var skipped = query.Skip(skipCount).Take(search.PerPage);

            var response = new PagedResponse<TDto>
            {
                CurrentPage = search.Page,
                ItemsPerPage = search.PerPage,
                TotalCount = query.Count(),
                Items = mapper.Map<IEnumerable<TDto>>(skipped)
            };

            return response;
        }
        
    }

    public static class CommandableExtensions
    {
        public static void Delete(this Entity entity)
        {
            entity.IsDeleted = true;
            entity.IsActive = false;
            entity.DeletedAt = DateTime.UtcNow;
        }

        public static void UploadImage(this ProductDto dto)
        {
            var guid = Guid.NewGuid();
            var extension = Path.GetExtension(dto.UploadedImage.FileName);

            var newFileName = guid + extension;

            var path = Path.Combine("wwwroot", "images", newFileName);

            using (var fileStream = new FileStream(path, FileMode.Create))
            {
                dto.UploadedImage.CopyTo(fileStream);
            }

            dto.Image = newFileName;
        }
    }
}
