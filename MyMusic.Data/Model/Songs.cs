using System;
using System.Collections.Generic;
using System.Text;

namespace MyMusic.Data.Model
{
    public class Songs
    {
        public int SongId { get; set; }
        public string SongName { get; set; }
        public DateTime Dor { get; set; }
        public string CoverImage { get; set; }        
        public int ArtistId { get; set; }
        public decimal Rating { get; set; }
        public string ArtistsName { get; set; }
    }
}
