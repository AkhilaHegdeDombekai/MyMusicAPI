using Dapper;
using MyMusic.Data.Helper.Interfaces;
using MyMusic.Data.Model;
using MyMusic.Data.Repository.IRepository;
using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using System.Threading.Tasks;

namespace MyMusic.Data.Repository
{
    public class UserRepository :IUserRepository
    {
        private readonly IConnectionHelper _connectionHelper;

        public UserRepository(IConnectionHelper connectionHelper)
        {
            _connectionHelper = connectionHelper ?? throw new ArgumentNullException(nameof(connectionHelper));
        }

        public async Task<IEnumerable<User>> GetAllUsers()
        {
            IEnumerable<User> users = new List<User>();
            const string sql = "GetAllUsers";
            using (var connection = _connectionHelper.GetDBConnection())
            {
                users = await connection.QueryAsync<User>(sql, CommandType.StoredProcedure);
            }
            return users;

        }
    }
}
