using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BA_ERPMVC.UtilityClasses
{
    public enum OrdersStatus
    {
        ReadyForDispatched = 1,
        PreDispatched = 2,
        Dispatched = 3,
        InTransact = 4,
        ReDispatched = 5,
        Delivery = 6,
        EmptyDropOff = 7,
        Completed = 8
    }
}