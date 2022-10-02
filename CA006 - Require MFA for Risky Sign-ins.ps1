Connect-MgGraph -Scopes "Policy.ReadWrite.ConditionalAccess"

## This policy does require an Azure AD P2 License as it relies on Identity Protection.
$params = @{
    displayName = "CA006: Grant - Require MFA for medium + Risk Sign-Ins"
    State = "EnabledForReportingButNotEnforced"
    Conditions = @{
        SignInRiskLevels = @(
            "high"
            "medium"
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
                "USER, ROLE OR GROUP ID TO EXCLUDE WOULD GO HERE"
            )
        }
    }
    GrantControls = @{
        operator = "OR"
        BuiltInControls = @(
            "mfa"
        )
    }
}

New-MgIdentityConditionalAccessPolicy -BodyParameter $params