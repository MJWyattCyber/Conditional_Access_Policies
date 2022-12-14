Connect-MgGraph -Scopes "Policy.ReadWrite.ConditionalAccess"

$params = @{
    displayName = "CA004: Grant - Require MFA for Administrators"
    State = "EnabledForReportingButNotEnforced"
    Conditions = @{
        Applications = @{
            IncludeApplications = @(
                "All"
            )
        }
        ## Within the users section you can select Users, Roles or Groups. It is recomended to have at least one break glass account.
        Users = @{
            IncludeRoles = @(
                "62e90394-69f5-4237-9190-012177145e10"
                "29232cdf-9323-42fd-ade2-1d097af3e4de"
                "f28a1f50-f6e7-4571-818b-6a12f2af6b6c"
                "baf37b3a-610e-45da-9e62-d9d1e5e8914b"
                "f70938a0-fc10-4177-9e90-2178f8765737"
                "fcf91098-03e3-41a9-b5ba-6f0ec8188a12"
                "69091246-20e8-4a56-aa4d-066075b2a7a8"
                "fe930be7-5e62-47db-91af-98c3a49a38b1"
                "75941009-915a-4869-abe7-691bff18279e"
                "f023fd81-a637-4b56-95fd-791ac0226033"
                "5d6b6bb7-de71-4623-b4af-96380a352509"
                "5f2222b1-57c3-48ba-8ad5-d4759f1fde6f"
                "194ae4cb-b126-40b2-bd5b-6091b380977d"
                "7be44c8a-adaf-4e2a-84d6-ab2649e08a13"
                "e8611ab8-c189-46e8-94e1-60213ab1f814"
                "0964bb5e-9bdb-4d7b-ac29-58e794862a40"
                "a9ea8996-122f-4c74-9520-8edcd192826c"
                "966707d0-3269-4727-9be2-8c3a10f19b9d"
                "ac16e43d-7b2d-40e0-ac05-243ff356ab5b"
                "4d6ac14f-3453-41d0-bef9-a3e0c569773a"
                "74ef975b-6605-40af-a5d2-b9539d836353"
                "3a2c62db-5318-420d-8d74-23affee5d9d5"
                "729827e3-9c14-49f7-bb1b-9608f156bbb8"
                "be2f45a1-457d-42af-a067-6ec1fa63bc45"
                "44367163-eba1-44c3-98af-f5787879f96a"
                "d29b2b05-8046-44ba-8758-1e26182fcf32"
                "b1be1c3e-b65d-4f19-8427-f6fa0d97feb9"
                "e6d1a23a-da11-4be4-9570-befc86d067a7"
                "17315797-102d-40b4-93e0-432062caca18"
                "7698a772-787b-4ac8-901f-60d6b08affd2"
                "158c047a-c907-4556-b7ef-446551a6b5f7"
                "b0f54661-2d74-4c50-afa3-1ec803f12efe"
                "0f971eea-41eb-4569-a71e-57bb8a3eff1e"
                "6e591065-9bad-43ed-90f3-e9424366d2f0"
                "3edaf663-341e-4475-9f94-5c398ef6c070"
                "aaf43236-0c0d-4d5f-883a-6955382ac081"
                "7495fdc4-34c4-4d15-a289-98788ce399fd"
                "c4e39bd9-1100-46d3-8c65-fb160da0071f"
                "9b895d92-2cd3-44c7-9d02-a6ac2d5ea5c3"
                "cf1c38e5-3621-4004-a7cb-879624dced7c"
                "5c4f9dcd-47dc-4cf7-8c9a-9e4207cbfc91"
                "38a96431-2bdf-4b4c-8b6e-5d3d8abac1a4"
                "88d8e3e3-8f55-4a1e-953a-9b9898b8876b"
                "95e79109-95c0-4d8e-aee3-d01accf2d47b"
                "790c1fb9-7f7d-4f88-86a1-ef1f95c05c1b"
                "4a5d8f65-41da-4de4-8968-e035b65339cf"
                "8835291a-918c-4fd7-a9ce-faa49f0cf7d9"
            )
            ExcludeUsers = @(
                "USER, GROUP OR ROLE ID TO EXCLUDE GOES HERE" 
            )
        }
    }
    GrantControls = @{
        Operator = "OR"
        BuiltInControls = @(
            "mfa"
        )
    }
    ## This section is arguably optional but will stop browser persistence for all admin users and require them to sign in every working day (8 hours), providing mfa when they do so. 
    SessionControls = @{
		PersistentBrowser = @{
            Mode = "never"
            IsEnabled = $true
        }
		SignInFrequency = @{
			Value = 8
			Type = "hours"
			IsEnabled = $true
		}
	}
}

New-MgIdentityConditionalAccessPolicy -BodyParameter $params