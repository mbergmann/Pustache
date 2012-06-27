@echo off

IF [%1]==[] (
	set ARGS='All'
	goto :runpester
)

set ARGS=%1
:runpester
powershell -c ". .\runSpecs.ps1; Run-Specs %ARGS%"