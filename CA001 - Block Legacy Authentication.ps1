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
        ## Within the users section you can select Users, Roles or Groups. It is recomended to have at least one break glass account. 
        Users = @{
            IncludeUsers = @(
                "All"
            )
            ExcludeUsers = @(
                "BREAK GLASS ACCOUNT SHOULD GO HERE"
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