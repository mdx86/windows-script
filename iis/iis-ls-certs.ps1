import-module WebAdministration

ls cert:\LocalMachine\my | select * | foreach {

  $found = $false
  $tp = $_.Thumbprint

  ls IIS:\SslBindings | Foreach {
    if ($_.Thumbprint -eq $tp)
    {
      Write-Host "Used in $($_.IpAddress) $($_.Host)"
      $found = $true
    }    
  }
  if ($found)
  {
    Write-Host $tp -foregroundcolor green
    Write-Host $_.Subject -foregroundcolor green
    Write-Host $_.NotAfter -foregroundcolor green
  }
  else
  {
    Write-Host "Not in use"
    Write-Host $tp -foregroundcolor red
    Write-Host $_.Subject -foregroundcolor red
    Write-Host $_.NotAfter -foregroundcolor red
  }
  Write-Host "***************************************************************"
}