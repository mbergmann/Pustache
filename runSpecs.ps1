Import-Module .\modules\vendor\Pester\Pester.psm1
function Run-Specs($test) {
    if ($test -eq "all") {
        Invoke-Pester ".\specs" -OutputXML ".\powershell_tests.xml"
    }
    else {
        Invoke-Pester ".\specs\$test.Tests.ps1" -OutputXML ".\powershell_tests.xml"
    }
}