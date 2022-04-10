union ["foo.tll",'testing.tll'] "foo.tll" | join (pred,pred) ["foo.tll"] | 
map((obj < 99 and obj > 1)? obj = 3*obj+5*3^4+obj-65*x, pred = <http://testin.com> : obj=false)
where x = "jlkjkjlkj"