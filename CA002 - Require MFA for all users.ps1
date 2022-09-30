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
        Users = @{
            IncludeUsers = @(
                "All"
            )
            ExcludeUsers = @(
                "BREAK GLASS ACCOUNT ID GOES HERE" ##Replace this with any users you need to exclude, it's recommended to have at least one break glass account here. 
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