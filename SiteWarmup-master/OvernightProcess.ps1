$MyDir = Split-Path $MyInvocation.MyCommand.Definition

$precompilerFile = "C:\Projects\PerformanceTalk\Telerik.Sitefinity.Compiler.1.0.0.10\Telerik.Sitefinity.Compiler.exe"
& $precompilerFile /url="http://localhost:1003" /appdir="C:\Projects\PerformanceTalk\DevMagazineSite\SitefinityWebApp" /authKey="7hJ78G9ttuSh16kAop1w7sFV6Lv07Cvc" /strategy="Frontend"

# Please note, if you have Overlapped Recycles turned on in IIS, the application will
# not recycle immediately (the WaitForSitefinityToStart script will think it has started
# immediately, incorrectly). Make sure you diable overlapped recycles or manually recycle
# the application pool here
# Restart-WebAppPool -name ".NET v4.5"

. "$MyDir\WaitForSitefinityToStart.ps1" -url "http://localhost:1003"
. "$MyDir\SiteWarmup.ps1" -sitemapFile "C:\Projects\PerformanceTalk\DevMagazineSite\SitefinityWebApp\sitemap.xml"
