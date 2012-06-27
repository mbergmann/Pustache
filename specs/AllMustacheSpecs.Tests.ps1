Import-Module .\modules\vendor\PowerYaml\PowerYaml.psm1
Import-Module .\Pustache.psm1

$specs = Get-ChildItem ".\specs\mustacheSpecs\specs\" -Filter "*.yml"
$specs | %{
    
    $currentSpec = Get-Yaml -FromFile $_.FullName

    Describe $_ {
        $currentSpec.Tests | %{ 
            $Global:CurrentTest = $_
            it "$($_.name) `r`n  $($_.desc)" {
                $test = $Global:CurrentTest
                $testData = $test.data
                $result = Invoke-Nustache $test.template $testData
                $result.Should.Be($test.expected)
            } 
        } 
    }
}

