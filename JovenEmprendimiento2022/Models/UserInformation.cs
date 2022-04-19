using System;
using System.Collections.Generic;

namespace JovenEmprendimiento2022.Models
{
    public partial class UserInformation
    {
        public int IdInfoUser { get; set; }
        public string Name { get; set; } = null!;
        public string Surname { get; set; } = null!;
        public string Username { get; set; } = null!;
        public string Password { get; set; } = null!;
        public int IdRole1 { get; set; }
        public string Email { get; set; } = null!;

        public virtual Role IdRole1Navigation { get; set; } = null!;
    }
}
