using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using MyMusic.Data.Model;
using MyMusic.Data.Repository.IRepository;
using MyMusicAPI.Helper;
using MyMusicAPI.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Threading.Tasks;

namespace MyMusicAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SongsController : ControllerBase
    {
        private ISongsRepository _songsRepository;

        public SongsController(ISongsRepository songsRepository)
        {
            _songsRepository = songsRepository ?? throw new ArgumentNullException(nameof(songsRepository));
        }
        [HttpGet]
        [Route("GetAllSongs")]
        public async Task<IEnumerable<Songs>> GetAllSongs()
        {
            var songs = await _songsRepository.GetAllSongs();
            return songs;
        }
        [HttpGet]
        [Route("GetAllSongById")]
        public async Task<Songs> GetSongById(int Id)
        {
            var song = await _songsRepository.GetSongsById(Id);
            return song;
        }

        [HttpPost, DisableRequestSizeLimit]
        public async Task<Songs> SaveSong(IFormFile file,string songname,int artistId, DateTime Dor)
        {
            Songs songs = new Songs();
            if(file.Length > 0)
            {
                //song.coverImage = coverImageFile;
                var fileName = ContentDispositionHeaderValue.Parse(file.ContentDisposition).FileName.Trim('"');
                var songFileData = new FileDataModel { File = file, FileExtension = "", FileName = fileName };
                songs.CoverImage = FileUploadHelper.SaveCoverImage(songFileData);
            }
            songs.SongName = songname;
            songs.ArtistId = artistId;
            songs.Dor= Dor;
            var savedSong = await _songsRepository.SaveSongs(songs);
            return savedSong;
        }
        [HttpPut]
        public async Task<Songs> UpdateSong(Songs song)
        {
            var updatedSong = await _songsRepository.UpdateSongs(song);
            return updatedSong;
        }
        [HttpDelete]
        public async Task<HttpResponseMessage> DeleteSong(int Id)
        {
            await _songsRepository.DeleteSongs(Id);
            return new HttpResponseMessage(HttpStatusCode.OK);
        }
    }
}
