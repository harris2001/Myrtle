"foo.ttl" | union 'bar.ttl' | filter(_, [<http://www.cw.org/testPredA>,<http://www.cw.org/testPredList>], [(true and (false or true)) and obj>3 and obj <25, obj==true,obj==true])
where x2 = -3-2
