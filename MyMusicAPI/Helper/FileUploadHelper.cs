using Microsoft.AspNetCore.Http;
using MyMusicAPI.Model;
using System.IO;

namespace MyMusicAPI.Helper
{
    public static class FileUploadHelper
    {
        public static string SaveCoverImage(FileDataModel fileData)
        {
            //var fileName = ContentDispositionHeaderValue.Parse(file.ContentDisposition).FileName.Trim('"');
            var folderName = Path.Combine("wwwroot","Resources", "CoverImages");
            var pathToSave = Path.Combine(Directory.GetCurrentDirectory(), folderName);
            var fullPath = Path.Combine(pathToSave, fileData.FileName);
            var dbPath = Path.Combine("Resources", "CoverImages", fileData.FileName);
            using (var stream = new FileStream(fullPath, FileMode.Create))
            {
                fileData.File.CopyTo(stream);
            }
            return dbPath;
        }
    }
}
