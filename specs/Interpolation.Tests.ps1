Import-Module .\modules\vendor\PowerYaml\PowerYaml.psm1
Import-Module .\Pustache.psm1

$sectionSpecs = Get-Yaml -FromFile .\specs\mustacheSpecs\specs\Interpolation.yml

<#    desc: Truthy sections should have their contents rendered.
    data: { boolean: true }
    template: '"{{#boolean}}This should be rendered.{{/boolean}}"'
    expected: '"This should be rendered."' #>

Describe "Interpolation" {
    $sectionSpecs.Tests | select -skip 0 | %{ 
        $Global:CurrentTest = $_
        it "$($_.name) `r`n  $($_.desc)" {
            $test = $Global:CurrentTest
            $testData = $test.data
            $result = Invoke-Nustache $test.template $testData
            $result.Should.Be($test.expected)
        } 
    } 
}

