function TakeOwnership-RegKey($hive, $subkey)
{
$definition = @"
using System;
using System.Runtime.InteropServices;
 
namespace Win32Api
{
 
        public class NtDll
        {
                [DllImport("ntdll.dll", EntryPoint="RtlAdjustPrivilege")]
                public static extern int RtlAdjustPrivilege(ulong Privilege, bool Enable, bool CurrentThread, ref bool Enabled);
        }
}
"@
 
    Add-Type -TypeDefinition $definition -PassThru
   
    $bEnabled = $false
 
    # Enable SeTakeOwnershipPrivilege
    $res = [Win32Api.NtDll]::RtlAdjustPrivilege(9, $true, $false, [ref]$bEnabled)
 
    # Taking ownership
    switch ($hive.ToString().tolower())
    {
        "classesroot" { $key = [Microsoft.Win32.Registry]::ClassesRoot.OpenSubKey($subkey, [Microsoft.Win32.RegistryKeyPermissionCheck]::ReadWriteSubTree,[System.Security.AccessControl.RegistryRights]::TakeOwnership) }
        "currentuser" { $key = [Microsoft.Win32.Registry]::CurrentUser.OpenSubKey($subkey, [Microsoft.Win32.RegistryKeyPermissionCheck]::ReadWriteSubTree,[System.Security.AccessControl.RegistryRights]::TakeOwnership) }
        "localmachine" { $key = [Microsoft.Win32.Registry]::LocalMachine.OpenSubKey($subkey, [Microsoft.Win32.RegistryKeyPermissionCheck]::ReadWriteSubTree,[System.Security.AccessControl.RegistryRights]::TakeOwnership) }
    }
    $acl = $key.GetAccessControl()
    $acl.SetOwner([System.Security.Principal.NTAccount]"Administrators")
    $key.SetAccessControl($acl)
 
    # Setting access to the key
    $acl = $key.GetAccessControl()
    $person = [System.Security.Principal.NTAccount]"Administrators"
    $access = [System.Security.AccessControl.RegistryRights]"FullControl"
    $inheritance = [System.Security.AccessControl.InheritanceFlags]"ContainerInherit"
    $propagation = [System.Security.AccessControl.PropagationFlags]"None"
    $type = [System.Security.AccessControl.AccessControlType]"Allow"
 
    $rule = New-Object System.Security.AccessControl.RegistryAccessRule($person,$access,$inheritance,$propagation,$type)
    $acl.SetAccessRule($rule)
    $key.SetAccessControl($acl)
 
    $key.Close()
}