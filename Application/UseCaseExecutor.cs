using Application.Exceptions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Application
{
    public class UseCaseExecutor
    {
        private readonly IAppActor actor;
        private readonly IActivityLogger _logger;

        public UseCaseExecutor(IAppActor actor, IActivityLogger logger)
        {
            this.actor = actor;
            _logger = logger;//ovo za kraj bukvAr
        }

        public TResult ExecuteQuery<TSearch, TResult>(IQuery<TSearch, TResult> query, TSearch search)
        {
            _logger.Log(query, actor, search);

            if (!actor.AllowedUseCases.Contains(query.Id))
                throw new UnauthorizedUseCaseException(query, actor);

            return query.Execute(search);
        }

        public void ExecuteCommand<TRequest>(ICommand<TRequest> command, TRequest request)
        {
            _logger.Log(command, actor, request);
            // 1 (1,2,3,4)
            if (!actor.AllowedUseCases.Contains(command.Id))
                throw new UnauthorizedUseCaseException(command, actor);

            command.Execute(request);
        }

    }
}
