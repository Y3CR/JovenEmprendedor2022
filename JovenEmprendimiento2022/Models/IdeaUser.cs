using System;
using System.Collections.Generic;

namespace JovenEmprendimiento2022.Models
{
    public partial class IdeaUser
    {
        public int IdIdea { get; set; }
        public string RegistredId { get; set; } = null!;
        public int IdUser2 { get; set; }

        public virtual Role IdUser2Navigation { get; set; } = null!;
    }
}
