using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using MyMusic.Data.Model;
using MyMusic.Data.Repository.IRepository;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace MyMusicAPI.Controllers
{
    //[EnableCors("SiteCorsPolicy")]
    [Route("api/[controller]")]
    [ApiController]
    public class UserController : ControllerBase
    {
        private readonly IUserRepository _userRepo;

        public UserController(IUserRepository userRepo)
        {
            _userRepo = userRepo ?? throw new ArgumentNullException(nameof(userRepo));
        }

        [HttpGet]
        public async Task<IEnumerable<User>> GetAllUsers()
        {
           return await _userRepo.GetAllUsers();
        }
    }
}
