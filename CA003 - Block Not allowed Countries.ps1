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
        Users = @{
            IncludeUsers = @(
                "All"
            )
            ExcludeUsers = @(
                "USER ID TO EXCLUDE WOULD GO HERE" ##It is recomended to exclude a break glass account from block rules to ensure that you do not lose access. 
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