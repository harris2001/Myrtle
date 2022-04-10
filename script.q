union ["foo.tll",'testing.tll'] "foo.tll" | join (pred,subj) ["foo.tll"] | 
map((obj < 99 and obj > 1)? obj = 3+x, pred = <http://testin.com> : obj=false) |
filter ([<http://subject1.com>,<http://subject2.com>],[<http://pred1.com>,<http://pred2.com>],obj=="sgsdgsd")
where x = "teset"