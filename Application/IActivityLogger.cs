using System;
using System.Collections.Generic;
using System.Text;

namespace Application
{
    public interface IActivityLogger
    {
        void Log(IUseCase userCase, IAppActor actor, object useCaseData);
    }
}
