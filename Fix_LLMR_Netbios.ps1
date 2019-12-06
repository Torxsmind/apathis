Configuration Fix_LLMR_Netbios
{
	Import-DSCResource -ModuleName 'PSDesiredStateConfiguration'
	Import-DSCResource -ModuleName 'AuditPolicyDSC'
	Import-DSCResource -ModuleName 'SecurityPolicyDSC'
	Import-DscResource -ModuleName 'NetworkingDsc'

		Node localhost
			{
       NetBios DisableNetBios
       	{
        	InterfaceAlias = 'Ethernet'
          Setting        = 'Disable'
        }
        
			Registry "QID: 45290 - Microsoft Windows Link-Local Multicast Name Resolution (LLMNR) Not Disabled"
	    	{
        	ValueName = 'EnableMulticast'
          ValueType = 'Dword'
          Key = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\DNSClient'
          ValueData = 0
        }
   		}
}
