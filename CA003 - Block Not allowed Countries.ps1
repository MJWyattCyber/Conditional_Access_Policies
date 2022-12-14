Connect-MgGraph -Scopes "Policy.ReadWrite.ConditionalAccess"

$params = @{
    displayName = "CA003: Block - Not allowed countries"
    State = "enabledForReportingButNotEnforced"
    Conditions = @{
        Applications = @{
            IncludeApplications = @(
                "All"
            )
        }
        ## Within the users section you can select Users, Roles or Groups. It is recomended to have at least one break glass account.
        Users = @{
            IncludeUsers = @(
                "All"
            )
            ExcludeUsers = @(
                "USER ID TO EXCLUDE WOULD GO HERE"  
            )
        }
        Locations = @{
            IncludeLocations = @(
                "All"
            )
            ExcludeLocations = @(
                "Include Name of Named Location for Allowed Connections"
            )
        }
    }
    GrantControls = @{
        Operator = "OR"
        BuiltInControls = @(
            "mfa"
        )
    }
}

New-MgIdentityConditionalAccessPolicy -BodyParameter $params