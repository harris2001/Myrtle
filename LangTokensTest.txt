union ["foo.ttl", 'bar.ttl'] | filter(_, "hasNeg", > (10 + 5 -2 * 10 / 5 ^ 4) or < 1 or == 5) | map ((subj == s1 and pred = "hasPos")? obj = true : false) | join -l -r ["foo.ttl"]
where s1 = "s1"