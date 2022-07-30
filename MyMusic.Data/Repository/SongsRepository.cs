using Dapper;
using MyMusic.Data.Helper.Interfaces;
using MyMusic.Data.Model;
using MyMusic.Data.Repository.IRepository;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyMusic.Data.Repository
{
    public class SongsRepository : ISongsRepository
    {
        private IConnectionHelper _connectionHelper;

        public SongsRepository(IConnectionHelper connectionHelper)
        {
            _connectionHelper = connectionHelper;
        }

        public async Task<int> DeleteSongs(int Id)
        {

            const string sql = "DeleteSongs";
            using (var connection = _connectionHelper.GetDBConnection())
            {
                var parameters = new DynamicParameters();
                parameters.Add("@Id", Id, DbType.Int32);
                return await connection.ExecuteAsync(sql, parameters, commandType: CommandType.StoredProcedure);

            }
        }

        public async Task<IEnumerable<Songs>> GetAllSongs()
        {
            IEnumerable<Songs> songs = new List<Songs>();
            const string sql = "GetAllSongs";
            using (var connection = _connectionHelper.GetDBConnection())
            {
                songs = await connection.QueryAsync<Songs>(sql, CommandType.StoredProcedure);
            }
            return songs;
        }

        public async Task<Songs> GetSongsById(int id)
        {
            Songs songs = new Songs();
            const string sql = "GetSongsByID";
            using (var connection = _connectionHelper.GetDBConnection())
            {
                var parameters = new DynamicParameters();
                parameters.Add("@Id", id, DbType.Int32);
                var data = await connection.QueryAsync<Songs>(sql, parameters, commandType: CommandType.StoredProcedure);
                songs = data.ToList().FirstOrDefault();
            }
            return songs;
        }

        public async Task<Songs> SaveSongs(Songs songs)
        {
            Songs song = new Songs();
            const string sql = "AddSongs";
            using (var connection = _connectionHelper.GetDBConnection())
            {
                var parameters = new DynamicParameters();
                parameters.Add("@SongsName", songs.SongName, DbType.String);
                parameters.Add("@DOR", songs.Dor, DbType.DateTime);
                parameters.Add("@CoverImage", songs.CoverImage, DbType.String);
                parameters.Add("@ArtistID", songs.ArtistId, DbType.Int32);
                var data = await connection.QueryAsync<Songs>(sql, parameters, commandType: CommandType.StoredProcedure);
                songs = data.ToList().FirstOrDefault();
            }
            return songs;
        }

        public async Task<Songs> UpdateSongs(Songs song)
        {
            Songs songs = new Songs();
            const string sql = "UpdateSongs";
            using (var connection = _connectionHelper.GetDBConnection())
            {
                var parameters = new DynamicParameters();
                parameters.Add("@SongsId", song.SongId, DbType.Int32);
                parameters.Add("@SongsName", song.SongName, DbType.String);
                parameters.Add("@DOR", song.Dor, DbType.DateTime);
                parameters.Add("@CoverImage", song.CoverImage, DbType.String);
                parameters.Add("@ArtistID", songs.ArtistId, DbType.Int32);
                // songs = await connection.ExecuteAsync<Songs>(sql,parameters, CommandType.StoredProcedure).FirstOrDefault();
                var data = await connection.QueryAsync<Songs>(sql, parameters, commandType: CommandType.StoredProcedure);
                songs = data.ToList().FirstOrDefault();
            }
            return songs;
        }

        public async Task UpdateSongRating(int songId, int rating, int userId)
        {
            const string sql = "UpdateSongRating";
            using (var connection = _connectionHelper.GetDBConnection())
            {
                var parameters = new DynamicParameters();
                parameters.Add("@songId", songId, DbType.Int32);
                parameters.Add("@rating", rating, DbType.Int32);
                parameters.Add("@userId", userId, DbType.Int32);
                // songs = await connection.ExecuteAsync<Songs>(sql,parameters, CommandType.StoredProcedure).FirstOrDefault();
                await connection.ExecuteAsync(sql, parameters, commandType: CommandType.StoredProcedure);

            }
        }
    }
}
