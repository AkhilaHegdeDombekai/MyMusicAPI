using Microsoft.AspNetCore.Http;
using System;

namespace MyMusicAPI.Model
{
    public class SongsViewModel
    {
        public string SongName { get; set; }
        public int SongId { get; set; }
        public int ArtistId { get; set; }
        public DateTime Dor { get; set; }


    }
}
