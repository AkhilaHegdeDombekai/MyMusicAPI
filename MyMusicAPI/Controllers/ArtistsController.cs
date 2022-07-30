using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using MyMusic.Data.Model;
using MyMusic.Data.Repository.IRepository;
using System;
using System.Collections.Generic;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;

namespace MyMusicAPI.Controllers
{
    //[EnableCors("SiteCorsPolicy")]
    [Route("api/[controller]")]
    [ApiController]
    public class ArtistsController : ControllerBase
    {
        private IArtistsRepository _artistsRepository;

        public ArtistsController(IArtistsRepository artistsRepository)
        {
            _artistsRepository = artistsRepository ?? throw new ArgumentNullException(nameof(artistsRepository));
        }

        [HttpGet]
        [Route("GetAllArtists")]
        public async Task<IEnumerable<Artists>> GetAllArtists()
        {
            var artists = await _artistsRepository.GetAllArtists();
            return artists;
        }
        [HttpGet]
        [Route("GetAllArtistById")]
        public async Task<Artists> GetArtistById(int Id)
        {
            var artist= await _artistsRepository.GetArtistsById(Id);
            return artist;
        }

        [HttpPost]
        public async Task<Artists> SaveArtist(Artists artist)
        {
            var savedArtist = await _artistsRepository.SaveArtist(artist);
            return savedArtist;
        }
        [HttpPut]
        public async Task<Artists> UpdateArtist(Artists artist)
        {
            var updatedArtist = await _artistsRepository.UpdateArtist(artist);
            return updatedArtist;
        }
        [HttpDelete]
        public async Task<HttpResponseMessage> DeleteArtist(int Id)
        {
            await _artistsRepository.DeleteArtist(Id);
            return new HttpResponseMessage(HttpStatusCode.OK);
        }
    }
}
