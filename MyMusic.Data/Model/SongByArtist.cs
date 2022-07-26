using System;
using System.Collections.Generic;
using System.Text;

namespace MyMusic.Data.Model
{
   public class SongByArtist
    {
        public int Id { get; set; }
        public int SongId { get; set; }
        public int ArtistId { get; set; }
        public decimal AvgRating { get; set; }

    }
}
