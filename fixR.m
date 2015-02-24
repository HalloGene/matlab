function u = fixR(source_)
source = fliplr(source_);
u = fliplr(fixL(source));