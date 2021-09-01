using Application.Dto;
using Application.Queries;
using Application.Searches;
using AutoMapper;
using DataAccess;
using Domain;
using Implementation.Extensions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.Queries
{
    public class EFGetLogsQuery : IGetLogsQuery
    {
        private readonly DixotekaDbContext _context;
        private readonly IMapper _mapper;

        public EFGetLogsQuery(DixotekaDbContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public int Id => 30;

        public string Name => "get audit logs query";

        public PagedResponse<LogDto> Execute(LogSearch search)
        {
            var logs = _context.AuditLogs.AsQueryable();

            if (!string.IsNullOrEmpty(search.Actor))
            {
                search.Actor = search.Actor.ToLower().Trim();
                logs = logs.Where(x => x.Actor.ToLower().Contains(search.Actor));
            }

            if (!string.IsNullOrEmpty(search.UseCaseName))
            {
                search.UseCaseName = search.UseCaseName.ToLower().Trim();
                logs = logs.Where(x => x.UseCaseName.ToLower().Contains(search.UseCaseName));
            }

            if (search.DateFrom != null)
                logs = logs.Where(x => x.Date.Date >= DateTime.Parse(search.DateFrom).Date);

            if (search.DateTo != null)
                logs = logs.Where(x => x.Date.Date <= DateTime.Parse(search.DateTo).Date);

            return logs.Paged<LogDto, AuditLog>(search, _mapper);
        }
    }
}
