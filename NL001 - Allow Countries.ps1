Connect-MgGraph -Scopes "Policy.ReadWrite.ConditionalAccess"

$params = @{
    "@odata.type" = "#microsoft.graph.countryNamedLocation"
    displayName = "Allow Countries"
    ## Countries and regions must be in the ISO 3166 country code format
    CountriesAndRegions = @(
        "GB"
        "ES"
        "BE"
        "FR"
        "IM"
    )
    IncludeUnknownCountriesAndRegions = $false
}

New-MgIdentityConditionalAccessNamedLocation -BodyParameter $params