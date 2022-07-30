using MyMusic.Data.Model;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace MyMusic.Data.Repository.IRepository
{
    public interface ISongsRepository
    {
        Task<IEnumerable<Songs>> GetAllSongs();

        Task<Songs> GetSongsById(int id);
        Task<Songs> SaveSongs(Songs Artist);
        Task<Songs> UpdateSongs(Songs Artist);
        Task<int> DeleteSongs(int Id);
        Task UpdateSongRating(int songId, int rating, int userId);

    }
}
