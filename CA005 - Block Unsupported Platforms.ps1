Connect-MgGraph -Scopes "Policy.ReadWrite.ConditionalAccess"

$params = @{
    displayName = "CA005: Block - Unsupported Devices"
    State = "EnabledForReportingButNotEnforced"
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
                "USER, GROUP OR ROLE ID TO EXCLUDE WOULD GO HERE" 
            )
        }
        Platforms = @{
            IncludePlatforms =@(
                "All"
            )
            ## Specify any platforms in this section that you would like to allow access to. 
            ExcludePlatforms = @(
                "iOS"
                "Windows"
                "macOS"
                "Linux"
            )
        }
    }
    GrantControls = @{
        Operator = "OR"
        BuiltInControls = @(
            "block"
        )
    }
}

New-MgIdentityConditionalAccessPolicy -BodyParameter $params