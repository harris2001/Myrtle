union "foo.ttl" | union 'bar.ttl' | get(_, [<http://www.cw.org/testPredA>,<http://www.cw.org/testPredList>], [(true and (false or true)) and obj>3 and obj <25, obj==true])
where x2 = 1+2
      x3 = x2+10
      x4 = 1+2*3/4-6^7