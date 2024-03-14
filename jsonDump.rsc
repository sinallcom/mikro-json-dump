:global fJDump
:if (!any $fJDump) do={ :global fJDump do={
    :global JDumpOut; :global fJDump
    :local TempPath

    :if ([:len $1] = 0) do={
        :set $1 "\$JDumpOut"
        :set $2 $JDumpOut
    }
    :local locOut ""
    :local myFirstComma ""
    :local setOrList "set"
    :foreach k,v in=$2 do={
        :if ([:typeof $k] = "str") do={
            :if ([:typeof $v] = "str" ) do={
                :set locOut ($locOut.$myFirstComma." \"".$k. "\": \"".[:tostr $v]."\"")
                :set myFirstComma ", "
            }
            :if ([:typeof $v] = "num" || [:typeof $v] = "bool") do={
                :set locOut ($locOut.$myFirstComma." \"".$k. "\": ".[:tostr $v]."")
                :set myFirstComma ", "
            }
            :set k "\"$k\""
        }
        :if ([:typeof $k] = "num") do={
            :if ([:typeof $v] = "str" ) do={
                :set setOrList "list"
                :set locOut ($locOut.$myFirstComma." \"".[:tostr $v]."\"")
                :set myFirstComma ", "
            }
            :if ([:typeof $v] = "num" || [:typeof $v] = "bool") do={
                :set setOrList "list"
                :set locOut ($locOut.$myFirstComma." ".[:tostr $v]."")
                :set myFirstComma ", "
            }
        }
        :set TempPath ($1. "->" . $k)

        :if ([:typeof $v] = "array") do={
            :if ([:len $v] > 0) do={
                :set locOut ($locOut.$myFirstComma." ".$k. ": ". ([$fJDump $TempPath $v]))
                :set myFirstComma ", "
            } 
        } 
    }
if ($setOrList="set") do={
    :return ("{".$locOut."}")
} else={
    :return ("[".$locOut."]")
}
}}
