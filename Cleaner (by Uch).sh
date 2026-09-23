$src = "C:\Users\Administrateur\Documents\Projets\Cleaner by Uchi"
$dst = "C:\Users\Administrateur\Documents\GitHub\Cleaner-by-Uchi-src"

# Version PowerShell diffusion (jamais le .ps1 admin, jamais les .exe)
Copy-Item "$src\Cleaner (by Uchi) 1.0\Cleaner (by Uchi).ps1" $dst
Copy-Item "$src\Cleaner (by Uchi) 1.0\Uchi.ico" $dst

# Version C# — copier tout le dossier source, sans bin/obj
robocopy "$src\4. C#" "$dst\4. C#" /E /XD bin obj