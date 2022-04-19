using System;
using System.Collections.Generic;

namespace JovenEmprendimiento2022.Models
{
    public partial class Role
    {
        public Role()
        {
            IdeaUsers = new HashSet<IdeaUser>();
            UserInformations = new HashSet<UserInformation>();
        }

        public int IdUser { get; set; }
        public string Role1 { get; set; } = null!;

        public virtual ICollection<IdeaUser> IdeaUsers { get; set; }
        public virtual ICollection<UserInformation> UserInformations { get; set; }
    }
}
