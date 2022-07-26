using MyMusic.Data.Model;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace MyMusic.Data.Repository.IRepository
{
    public interface IArtistsRepository
    {
        Task<IEnumerable<Artists>> GetAllArtists();
        Task<Artists> GetArtistsById(int Id);
        Task<Artists> SaveArtist(Artists Artist);
        Task<Artists> UpdateArtist(Artists Artist);
        Task<int> DeleteArtist(int Id);

    }
}
