union ["foo.ttl",'testing.ttl'] "foo.ttl" | join (pred,subj) ["foo.ttl"] | 
map((obj < 99 and obj > 1)? obj = 3+x, pred = <http://testin.com> : obj=false) |
filter ([<http://subject1.com>,<http://subject2.com>],[<http://pred1.com>,<http://pred2.com>],object+3)
where x = "teset"