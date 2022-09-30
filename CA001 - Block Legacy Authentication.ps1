##You might have to install the Microsoft graph powershell module first with:
##Install-module Microsoft.Graph

Connect-MgGraph -Scopes "Policy.ReadWrite.ConditionalAccess"

$params = @{
    displayName = "CA001: Block - Legacy Authentication"
    State = "enabledForReportingButNotEnforced"
    Conditions = @{
        ClientAppTypes = @(
            "other"
            "exchangeActiveSync"
        )
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
                "USER ID TO EXCLUDE GOES HERE" ## Replace this with any users to exclude from the policy
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