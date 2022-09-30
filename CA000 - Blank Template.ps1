##You might have to install the Microsoft graph powershell module first with:
##Install-module Microsoft.Graph

## There are probably other options that can be used in the body parameters, these are just those that I am aware of or can think of. 

Connect-MgGraph -Scopes "Policy.ReadWrite.ConditionalAccess"

$params = @{
    displayName = "CA000 - Blank Template"
    State = "enabledForReportingButNotEnforced | enabled"
    Conditions = @{
        userRiskLevels = @(
        )
        signInRiskLevels = @(
        )
        ClientAppTypes = @(
        )
        deviceStates = @(
        )
        Applications = @{
            IncludeApplications = @(
            )
            ExcludeApplications = @(
            )
        }
        Users = @{
            IncludeGroups = @(
            )
            ExcludeGroups = @(
            )
            IncludeUsers = @(
            )
            ExcludeUsers = @(
            )
            IncludeRoles = @(
            )
            ExcludeRoles = @(
            )
        }
        Platforms = @{
            IncludePlatforms = @(
                "all"
            )
            ExcludePlatforms = @(
                "Windows"
                "macOS"
                "iOS"
                "Linux"
            )
        }
        Locations = @{
            IncludeLocations = @(
            )
            ExcludeLocations = @(
            )
        }
    }
    GrantControls = @{
        Operator = "OR"
        BuiltInControls = @(

        )
        customAuthenticationFactors = @(

        )
    }
    sessionControls = @{
        signInFrequency = @(

        )
    }
}