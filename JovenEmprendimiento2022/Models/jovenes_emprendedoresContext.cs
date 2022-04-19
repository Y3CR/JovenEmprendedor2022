using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace JovenEmprendimiento2022.Models
{
    public partial class jovenes_emprendedoresContext : DbContext
    {
        public jovenes_emprendedoresContext()
        {
        }

        public jovenes_emprendedoresContext(DbContextOptions<jovenes_emprendedoresContext> options)
            : base(options)
        {
        }

        public virtual DbSet<IdeaUser> IdeaUsers { get; set; } = null!;
        public virtual DbSet<Role> Roles { get; set; } = null!;
        public virtual DbSet<UserInformation> UserInformations { get; set; } = null!;

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
                optionsBuilder.UseNpgsql("Server=localhost;Database=jovenes_emprendedores;Port=5432;Username=postgres;Password=admin");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<IdeaUser>(entity =>
            {
                entity.HasKey(e => e.IdIdea)
                    .HasName("idea_user_pkey");

                entity.ToTable("idea_user", "project");

                entity.Property(e => e.IdIdea).HasColumnName("id_idea");

                entity.Property(e => e.IdUser2).HasColumnName("id_user2");

                entity.Property(e => e.RegistredId).HasColumnName("registred_id");

                entity.HasOne(d => d.IdUser2Navigation)
                    .WithMany(p => p.IdeaUsers)
                    .HasForeignKey(d => d.IdUser2)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("user_information");
            });

            modelBuilder.Entity<Role>(entity =>
            {
                entity.HasKey(e => e.IdUser)
                    .HasName("role_pkey");

                entity.ToTable("role", "project");

                entity.Property(e => e.IdUser).HasColumnName("id_user");

                entity.Property(e => e.Role1).HasColumnName("role");
            });

            modelBuilder.Entity<UserInformation>(entity =>
            {
                entity.HasKey(e => e.IdInfoUser)
                    .HasName("user_information_pkey");

                entity.ToTable("user_information", "project");

                entity.Property(e => e.IdInfoUser).HasColumnName("id_info_user");

                entity.Property(e => e.Email).HasColumnName("email");

                entity.Property(e => e.IdRole1).HasColumnName("id_role1");

                entity.Property(e => e.Name).HasColumnName("name");

                entity.Property(e => e.Password).HasColumnName("password");

                entity.Property(e => e.Surname).HasColumnName("surname");

                entity.Property(e => e.Username).HasColumnName("username");

                entity.HasOne(d => d.IdRole1Navigation)
                    .WithMany(p => p.UserInformations)
                    .HasForeignKey(d => d.IdRole1)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("user_information");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
