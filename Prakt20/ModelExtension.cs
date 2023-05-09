using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Entity;

namespace Prakt20
{
    public partial class ДеталиEntities : DbContext
    {
        private static ДеталиEntities context;
        public static ДеталиEntities GetContext()
        {
            if(context == null) context = new ДеталиEntities();
            return context;
        }
    }
}
