library('data.table')
library('headtest')

a = data.table(1:10)
b = blarg(1:10)
c = blarg2(1:10)
d = blarg3(1:10)
e = blarg4(1:10)

head(a) # normal data.table
head(b) # using a copied version of head.data.table
head(c) # dispatch should be going to head.data.table, but `[` is overwritten
head(d) # dispatch to head.data.table, and `[` as well
head(e) # extend only data.frame and `[` override
