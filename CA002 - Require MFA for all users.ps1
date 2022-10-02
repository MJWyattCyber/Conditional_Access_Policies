##You might have to install the Microsoft graph powershell module first with:
##Install-module Microsoft.Graph

Connect-MgGraph -Scopes "Policy.ReadWrite.ConditionalAccess"

$params = @{
    displayName = "CA002: Grant - Require MFA for all users"
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
                "EXCLUDED USER, GROUP OR ROLE IDS TO GO HERE"  
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