function u = fixR(source_)
source = fliplr(source_);
u = fliplr(fixLeftStraight(source));