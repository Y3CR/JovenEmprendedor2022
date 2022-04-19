#nullable disable
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using JovenEmprendimiento2022.Models;

namespace JovenEmprendimiento2022.Controllers
{
    public class UserInformationsController : Controller
    {
        private readonly jovenes_emprendedoresContext _context;

        public UserInformationsController(jovenes_emprendedoresContext context)
        {
            _context = context;
        }

        // GET: UserInformations
        public async Task<IActionResult> Index()
        {
            var jovenes_emprendedoresContext = _context.UserInformations.Include(u => u.IdRole1Navigation);
            return View(await jovenes_emprendedoresContext.ToListAsync());
        }

        // GET: UserInformations/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var userInformation = await _context.UserInformations
                .Include(u => u.IdRole1Navigation)
                .FirstOrDefaultAsync(m => m.IdInfoUser == id);
            if (userInformation == null)
            {
                return NotFound();
            }

            return View(userInformation);
        }

        // GET: UserInformations/Create
        public IActionResult Create()
        {
            ViewData["IdRole1"] = new SelectList(_context.Roles, "IdUser", "IdUser");
            return View();
        }

        // POST: UserInformations/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("IdInfoUser,Name,Surname,Username,Password,IdRole1,Email")] UserInformation userInformation)
        {
            if (ModelState.IsValid)
            {
                _context.Add(userInformation);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["IdRole1"] = new SelectList(_context.Roles, "IdUser", "IdUser", userInformation.IdRole1);
            return View(userInformation);
        }

        // GET: UserInformations/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var userInformation = await _context.UserInformations.FindAsync(id);
            if (userInformation == null)
            {
                return NotFound();
            }
            ViewData["IdRole1"] = new SelectList(_context.Roles, "IdUser", "IdUser", userInformation.IdRole1);
            return View(userInformation);
        }

        // POST: UserInformations/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("IdInfoUser,Name,Surname,Username,Password,IdRole1,Email")] UserInformation userInformation)
        {
            if (id != userInformation.IdInfoUser)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(userInformation);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!UserInformationExists(userInformation.IdInfoUser))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            ViewData["IdRole1"] = new SelectList(_context.Roles, "IdUser", "IdUser", userInformation.IdRole1);
            return View(userInformation);
        }

        // GET: UserInformations/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var userInformation = await _context.UserInformations
                .Include(u => u.IdRole1Navigation)
                .FirstOrDefaultAsync(m => m.IdInfoUser == id);
            if (userInformation == null)
            {
                return NotFound();
            }

            return View(userInformation);
        }

        // POST: UserInformations/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var userInformation = await _context.UserInformations.FindAsync(id);
            _context.UserInformations.Remove(userInformation);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool UserInformationExists(int id)
        {
            return _context.UserInformations.Any(e => e.IdInfoUser == id);
        }
    }
}
