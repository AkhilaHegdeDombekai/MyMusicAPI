using MyMusic.Data.Helper.Interfaces;
using MyMusic.Data.Model;
using MyMusic.Data.Repository.IRepository;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace MyMusic.Data.Repository
{
    public class SongsRepository:ISongsRepository
    {
        private IConnectionHelper _connectionHelper;

        public SongsRepository(IConnectionHelper connectionHelper)
        {
            _connectionHelper = connectionHelper;
        }

        public Task<int> DeleteSongs(int Id)
        {
            throw new NotImplementedException();
        }

        public Task<IEnumerable<Songs>> GetAllSongs()
        {
            throw new NotImplementedException();
        }

        public Task<Songs> GetSongsById(int id)
        {
            throw new NotImplementedException();
        }

        public Task<Songs> SaveSongs(Songs Artist)
        {
            throw new NotImplementedException();
        }

        public Task<Songs> UpdateSongs(Songs Artist)
        {
            throw new NotImplementedException();
        }
    }
}
