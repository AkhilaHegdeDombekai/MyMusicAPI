using Microsoft.Extensions.Configuration;
using MyMusic.Data.Helper.Interfaces;
using System.Data.SqlClient;

namespace MyMusic.Data.Helper
{
    public class ConnectionHelper :IConnectionHelper
    {
        private static IConfiguration _configuration;
        public ConnectionHelper(IConfiguration configuration)
        {
            if (configuration != null)
            {
               _configuration = configuration;
            }
        }

        public  SqlConnection GetDBConnection()
        {
            var conn = new SqlConnection(_configuration.GetConnectionString("MMDBConnectionString"));
            conn.Open();
            return conn;
        }
    }
}
