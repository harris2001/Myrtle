union "foo.ttl" | union 'bar.ttl' | get(_, [<http://www.cw.org/testPredA>,<http://www.cw.org/testPredList>], [(true and (false or true)) and obj>3 and obj <15 and 1+2*3/4-6^7>0])
where x2 = 1+2
      x3 = x2+10