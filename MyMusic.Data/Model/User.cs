using System;
using System.Collections.Generic;
using System.Text;

namespace MyMusic.Data.Model
{
   public class User
    {
        public int UserId { get; set; }
        public string EmailId { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }
    }
}
