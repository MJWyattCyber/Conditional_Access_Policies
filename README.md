# Conditional_Access_Policies

This repository contains the PowerShell required to deploy a handful of example Conditional Access Policies which aim to achieve a baseline of security and implement some industry recommendations. They are not extensive and there are some key policies that may be added later down the line, but hopefully they will help to get people started. 

## Block Legacy Authentication
This policy will block all legacy protocols from connecting to any applications, this will include the use of POP3, IMAP, Exchange Activ Sync etc. Typically, these methods rely on single-factor authentication and as a result they run the risk of bypassing normal MFA controls. 

## Require MFA for all users
In today's world this is seen to be the number one priority for cloud services and is even a requirement for some accreditations. The National Cyber Security Centre have even advised organisations re-evaluate their SaaS offerings if they do not support MFA. In it's current configuration this policy will utilise Microsoft's Azure Authentication App to provide MFA, however, custom controls can be used if required. 

## Block Not allowed countries
This policy uses country codes in a named location to determine allowed locations that connections can occur from, blocking all other attempts. 

## Require MFA for Admin users
This policy ensures that all users who hold a privileged role have MFA enforced, this policy also sets no browser persistence and sets the sign-in frequency to 8 hours to ensure that admin users have to re-authenticate.

## Block Unsupported Platforms
This policy blocks unsupported platforms such as Windows Phone, Android, Linux etc. Be aware, whilst this policy seems great it does only rely on the user-agent, so it's best to be combined with other methods and policies. 

## Require MFA for Risky Sign-ins
This policy does require a higher licence than the rest in that it is required to have an **Azure AD Premium P2** licence, however, it requires MFA for any sign-in that is determined high or medium, this may be due to the user signing in from an unknown location etc. 

## No Persistence for browser sessions of guest users
This setting ensures that there is no peristence for all external or guest users, it also forces them to sign-in every hour when accessing via a browser. 

## Summary
In each PS script I have included the command to connect to the Microsoft Graph PowerShell, in theory if you connect once you will not need to re-connect each time as long as your PowerShell sessions remains the same.