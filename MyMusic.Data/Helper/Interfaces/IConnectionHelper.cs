using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Text;

namespace MyMusic.Data.Helper.Interfaces
{
    public interface IConnectionHelper
    {
         SqlConnection GetDBConnection();
    }
}
