using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Exceptions
{
    public class ConflictBetweenEntitiesException : Exception
    {
        public ConflictBetweenEntitiesException(int id, Type type, Type referencedType)
           : base($"Entity of type {type.Name} with an id of {id} cannon be deleted because it has reference to another table - {referencedType.Name}.")
        {

        }
    }
}
