//
//  shiny.h
//  SwiftyBucket
//
//  Created by Tamir Duberstein on 4/11/16.
//  Copyright © 2016 Tamir Duberstein. All rights reserved.
//

#ifndef shiny_h
#define shiny_h

#include <stdlib.h>

void callSetterWithRandom(void setter(const uint32_t, const void *), const void *context);

#endif /* shiny_h */
