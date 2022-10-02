##You might have to install the Microsoft graph powershell module first with:
##Install-module Microsoft.Graph

Connect-MgGraph -Scopes "Policy.ReadWrite.ConditionalAccess"

$params = @{
    displayName = "CA000 - Blank Template"
    State = "enabledForReportingButNotEnforced | enabled | disabled"
    Conditions = @{
        SignInRiskLevels = @(
			"high"
			"medium"
		)
		ClientAppTypes = @(
			"mobileAppsAndDesktopClients"
			"exchangeActiveSync"
            "browser"
			"other"
		)
		Applications = @{
			IncludeApplications = @(
				"All"
			)
			ExcludeApplications = @(
				"Application ID here"
			)
			IncludeUserActions = @(
			)
		}
		Users = @{
			IncludeUsers = @(
				"All"
			)
			ExcludeUsers = @(
				"124c5b6a-ffa5-483a-9b88-04c3fce5574a"
				"GuestsOrExternalUsers"
			)
			IncludeGroups = @(
			)
			ExcludeGroups = @(
			)
			IncludeRoles = @(
				"9b895d92-2cd3-44c7-9d02-a6ac2d5ea5c3"
				"cf1c38e5-3621-4004-a7cb-879624dced7c"
				"c4e39bd9-1100-46d3-8c65-fb160da0071f"
			)
			ExcludeRoles = @(
				"b0f54661-2d74-4c50-afa3-1ec803f12efe"
			)
		}
		Platforms = @{
			IncludePlatforms = @(
				"all"
			)
			ExcludePlatforms = @(
				"iOS"
				"windowsPhone"
                "Linux"
                "Windows"
                "macOS"
			)
		}
		Locations = @{
			IncludeLocations = @(
				"AllTrusted"
			)
			ExcludeLocations = @(
				"00000000-0000-0000-0000-000000000000"
				"d2136c9c-b049-47ae-b9cf-316e04ef7198"
			)
		}
	}
	GrantControls = @{
		Operator = "OR"
		BuiltInControls = @(
			"mfa"
			"compliantDevice"
			"domainJoinedDevice"
			"approvedApplication"
			"compliantApplication"
		)
		CustomAuthenticationFactors = @(
		)
		TermsOfUse = @(
			"ce580154-086a-40fd-91df-8a60abac81a0"
			"7f29d675-caff-43e1-8a53-1b8516ed2075"
		)
	}
	SessionControls = @{
		ApplicationEnforcedRestrictions = $null
		PersistentBrowser = = @{
            Mode = "never | always"
            IsEnabled = $true
        }
		CloudAppSecurity = @{
			CloudAppSecurityType = "blockDownloads"
			IsEnabled = $true
		}
		SignInFrequency = @{
			Value = 4
			Type = "hours"
			IsEnabled = $true
		}
	}
}

New-MgIdentityConditionalAccessPolicy -BodyParameter $params