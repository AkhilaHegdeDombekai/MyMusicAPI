using MyMusic.Data.Model;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace MyMusic.Data.Repository.IRepository
{
    public interface IUserRepository
    {
        Task<IEnumerable<User>> GetAllUsers();
    }
}
