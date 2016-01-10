//
//  Shader.fsh
//  gameGL
//
//  Created by iOS Swift Course on 1/10/16.
//  Copyright © 2016 iOS Swift Course. All rights reserved.
//

varying lowp vec4 colorVarying;

void main()
{
    gl_FragColor = colorVarying;
}
