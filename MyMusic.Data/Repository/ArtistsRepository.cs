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
    public class ArtistsRepository: IArtistsRepository
    {
        private IConnectionHelper _connectionHelper;

        public ArtistsRepository(IConnectionHelper connectionHelper)
        {
            _connectionHelper = connectionHelper ?? throw new ArgumentNullException(nameof(connectionHelper));
        }

        public async Task<int> DeleteArtist(int Id)
        {
            
            const string sql = "DeleteArtist";
            using (var connection = _connectionHelper.GetDBConnection())
            {
                var parameters = new DynamicParameters();
                parameters.Add("@ArtistId", Id, DbType.Int32);
                return await connection.ExecuteAsync(sql, parameters, commandType: CommandType.StoredProcedure);
                
            }            
        }

        public async Task<IEnumerable<Artists>> GetAllArtists()
        {
           IEnumerable<Artists> artists = new List<Artists>();
            const string sql = "GetAllArtists";
            using (var connection = _connectionHelper.GetDBConnection())
            {
                artists = await connection.QueryAsync<Artists>(sql, CommandType.StoredProcedure);
            }
            return artists;
        }

        public async Task<Artists> GetArtistsById(int Id)
        {
            Artists artists = new Artists();
            const string sql = "GetArtistById";
            using (var connection = _connectionHelper.GetDBConnection())
            {
                var parameters = new DynamicParameters();
                parameters.Add("@ArtistId", Id, DbType.Int32);
                // artists = await connection.ExecuteAsync<Artists>(sql,parameters, CommandType.StoredProcedure).FirstOrDefault();
                var data = await connection.QueryAsync<Artists>(sql, parameters, commandType: CommandType.StoredProcedure);
                artists = data.ToList().FirstOrDefault();
            }
            return artists;
        }

        public async Task<Artists> SaveArtist(Artists artist)
        {
            Artists artists = new Artists();
            const string sql = "AddArtist";
            using (var connection = _connectionHelper.GetDBConnection())
            {
                var parameters = new DynamicParameters();
                parameters.Add("@ArtistName", artist.ArtistName, DbType.String);
                parameters.Add("@DOB", artist.Dob, DbType.DateTime);
                parameters.Add("@Bio", artist.Bio, DbType.String);
                // artists = await connection.ExecuteAsync<Artists>(sql,parameters, CommandType.StoredProcedure).FirstOrDefault();
                var data = await connection.QueryAsync<Artists>(sql, parameters, commandType: CommandType.StoredProcedure);
                artists = data.ToList().FirstOrDefault();
            }
            return artists;
        }

        public async Task<Artists> UpdateArtist(Artists artist)
        {
            Artists artists = new Artists();
            const string sql = "UpdateArtist";
            using (var connection = _connectionHelper.GetDBConnection())
            {
                var parameters = new DynamicParameters();
                parameters.Add("@ArtistId", artist.ArtistId, DbType.Int32);
                parameters.Add("@ArtistName", artist.ArtistName, DbType.String);
                parameters.Add("@DOB", artist.Dob, DbType.DateTime);
                parameters.Add("@Bio", artist.Bio, DbType.String);
                // artists = await connection.ExecuteAsync<Artists>(sql,parameters, CommandType.StoredProcedure).FirstOrDefault();
                var data = await connection.QueryAsync<Artists>(sql, parameters, commandType: CommandType.StoredProcedure);
                artists = data.ToList().FirstOrDefault();
            }
            return artists;
        }
    }
}
