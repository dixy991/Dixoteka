using Application;
using DataAccess;
using Domain;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Logging
{
    public class DatabaseUseCaseLogger : IActivityLogger
    {
        private readonly DixotekaDbContext _context;

        public DatabaseUseCaseLogger(DixotekaDbContext context)
        {
            _context = context;
        }

        public void Log(IUseCase userCase, IAppActor actor, object useCaseData)
        {
            var newActivity = new AuditLog
            {
                Actor = actor.Identity,
                UseCaseName = userCase.Name,
                Data = JsonConvert.SerializeObject(useCaseData),
                Date = DateTime.UtcNow
            };

            _context.AuditLogs.Add(newActivity);

            _context.SaveChanges();
        }
    }
}
