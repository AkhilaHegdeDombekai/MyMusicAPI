using Microsoft.AspNetCore.Http;

namespace MyMusicAPI.Model
{
    public class FileDataModel
    {
        public string FileName { get; set; }
        public string FileExtension { get; set; }

        public IFormFile File { get; set; }

    }
}
