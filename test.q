union "foo.ttl" | union 'bar.ttl' | filter(_, [<http://www.cw.org/testPredA>,<http://www.cw.org/testPredList>], [(true and (false or true)) and obj>3 and obj <25, obj==true,obj==x2])
where x2 = 1+2
      x3 = x2+10
      x4 = 1+2*3/4-6^7
      xx = true
      x6 = "literalstring"
      x5 = false or (false or xx)