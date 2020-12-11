 function SubRegStatus(
) {
    $subscriptionNameList = [System.Collections.ArrayList]@()
    $subscriptionIdList = [System.Collections.ArrayList]@()
        $subInAcc = Get-AzSubscription 
       ForEach($sub in $subInAcc) 
       {
            $subName = $sub | Select-Object -ExpandProperty Name
            $tmp = $subscriptionNameList.Add('"'+$subName+'"') 
            $subId = $sub | Select-Object -ExpandProperty Id
            $tmp1 = $subscriptionIdList.Add('"'+$subId+'"')
            $oput = Set-AzContext  -SubscriptionId $subId -ErrorAction Stop;
            $tmp2 = Get-AzProviderFeature -FeatureName BulkRegistration -ProviderNamespace Microsoft.SqlVirtualMachine
            write-output "Subscription : "  $subName " "  $tmp2
            write-output " "
        }
    return , $subscriptionList
    }