$timeout = 120
$cml_uri = $Env:cml_uri
$admin_passwd = $Env:admin_passwd

if ( !$cml_uri -or !$admin_passwd ){ 
    Write-Error "Envs are not set!"
    exit 1
}

Write-Host "Configure CML2"
do {
    try {
        $token = Invoke-RestMethod -Method Post -Uri "$cml_uri/api/v0/authenticate" `
                           -Headers @{ accept = "application/json" } `
                           -Body '{ "username": "admin", "password": "P@ssw0rd" }' `
                           -ContentType "application/json"
    } catch {
        $token = $false
    }
    Write-Host "Waiting for $($cml_uri) to obtain an access token"
    $timeout -= 2
    sleep 2
} while( !$token -or $timeout -lt 0 )

if ( !$token ) { 
    Write-Error "The script wasn't able to get an access token for $($cml_uri)"
    exit 1
}

$params = @{
 "password" = @{ 
    "old_password" = "P@ssw0rd"
    "new_password" = "$($admin_passwd)"
 }
}

Write-Host "Trying to change admin's password"
Invoke-RestMethod -Method PATCH -Uri "$($cml_uri)/api/v0/users/00000000-0000-4000-a000-000000000000" `
                    -Headers @{ "accept" = "application/json"
                                "Authorization" = "Bearer " + $token } `
                    -ContentType "application/json" `
                    -Body ($params|ConvertTo-Json)

exit 0