--------------------------------------------------- Creates the Screen Background Effects ----------------------------------------------------(1)
local function Background(Logo,Aura0,Aura1,r,g,b,ar,ag,ab)
    
    local rx, ry = getResolution()
    local vw = rx/100
    local vh = ry/100

    --- Main Color ---
    local r = r or 0
    local g = g or 0.2
    local b = b or 0.8
    
    --- Accent Color ---
    local ar = ar or 0
    local ag = ag or 0.4
    local ab = ab or 0.8

    setBackgroundColor(0.05*r,0.05*g,0.05*b)

    for ii = 3,165,8 do
        setNextStrokeColor(Aura0,r,g,b,0.05)
        setNextStrokeWidth(Aura0,0.05*vh)
        addLine(Aura0,ii*vh,0,ii*vh,ry)
    end

    for ii = 6,98,8 do
        setNextStrokeColor(Aura0,r,g,b,0.05)
        setNextStrokeWidth(Aura0,0.05*vh)
        addLine(Aura0,0,ii*vh,rx,ii*vh)
    end

    local PX = {0,1}
    local PY = {0.03,0.03}

    for ii = 1,#PX-1,1 do
        setNextStrokeColor(Aura1,ar,ag,ab, 1) 
        addLine(Aura1, PX[ii]*rx, PY[ii]*ry, PX[ii+1]*rx, PY[ii+1]*ry) 
    end

    for ii = 1,#PX-1,1 do
        setNextStrokeColor(Aura1,ar,ag,ab, 1) 
        addLine(Aura1, PX[ii]*rx, ry-PY[ii]*ry, PX[ii+1]*rx, ry-PY[ii+1]*ry) 
    end

end

--------------------------------------------------- Draws Center Spinner of a Mining Unit ----------------------------------------------------(2)
local function MiningModule(Front,Back,X,Y,Scale,ThetaOffset,ThetaMultiplier,r,g,b,a,Angle,thickness)
    
    local rx, ry = getResolution()
    local vw = rx/100
    local vh = ry/100

    local CubeO = {{-0.45,-0.23,0},{-0.45,-0.11,0},{-0.38,-0.11,0.07},{-0.11,0.4,0.34},{-0.11,0.5,0.34},{0,0.5,0.45},{0,-0.23,0.45},{-0.45,-0.23,0},{-0.45,-0.11,0},{-0.38,-0.11,-0.07},{-0.11,0.4,-0.34},{-0.11,0.5,-0.34},{0,0.5,-0.45},{0,-0.23,-0.45},{-0.45,-0.23,0}}

    local CubeI = {{-0.38,-0.11,0},{-0.11,0.4,0.27},{-0.11,0.5,0.27},{-0.38,0.5,0},{-0.38,-0.11,0},{-0.11,0.4,-0.27},{-0.11,0.5,-0.27},{-0.38,0.5,0}}

    local Wing1 = {{-0.89,-0.02,0},{-0.82,-0.05,0.07},{-0.41,0.36,0.34},{-0.38,0.45,0.34},{-0.71,0.56,0},{-0.89,-0.02,0},{-0.82,-0.05,-0.07},{-0.41,0.36,-0.34},{-0.38,0.45,-0.34},{-0.71,0.56,0}}

    local Wing2 = {{-0.94,-0.22,0},{-0.88,-0.24,0.06},{-0.68,-0.04,0.19},{-0.65,0.04,0.19},{-0.44,0.26,0.33},{-0.41,0.36,0.33},{-0.88,-0.03,0},{-0.94,-0.22,0},{-0.88,-0.24,-0.06},{-0.68,-0.04,-0.19},{-0.65,0.04,-0.19},{-0.44,0.26,-0.33},{-0.41,0.36,-0.33},{-0.88,-0.03,0}}

    local Wing3 = {{-0.99,-0.42,0},{-0.94,-0.44,0.05},{-0.74,-0.23,0.18},{-0.68,-0.04,0.18},{-0.93,-0.23,0},{-0.99,-0.42,0},{-0.94,-0.44,-0.05},{-0.74,-0.23,-0.18},{-0.68,-0.04,-0.18},{-0.93,-0.23,0}}
    
    local CubeOM = {{0.45,-0.23,0},{0.45,-0.11,0},{0.38,-0.11,0.07},{0.11,0.4,0.34},{0.11,0.5,0.34},{0,0.5,0.45},{0,-0.23,0.45},{0.45,-0.23,0},{0.45,-0.11,0},{0.38,-0.11,-0.07},{0.11,0.4,-0.34},{0.11,0.5,-0.34},{0,0.5,-0.45},{0,-0.23,-0.45},{0.45,-0.23,0}}

    local CubeIM = {{0.38,-0.11,0},{0.11,0.4,0.27},{0.11,0.5,0.27},{0.38,0.5,0},{0.38,-0.11,0},{0.11,0.4,-0.27},{0.11,0.5,-0.27},{0.38,0.5,0}}

    local Wing1M = {{0.89,-0.02,0},{0.82,-0.05,0.07},{0.41,0.36,0.34},{0.38,0.45,0.34},{0.71,0.56,0},{0.89,-0.02,0},{0.82,-0.05,-0.07},{0.41,0.36,-0.34},{0.38,0.45,-0.34},{0.71,0.56,0}}

    local Wing2M = {{0.94,-0.22,0},{0.88,-0.24,0.06},{0.68,-0.04,0.19},{0.65,0.04,0.19},{0.44,0.26,0.33},{0.41,0.36,0.33},{0.88,-0.03,0},{0.94,-0.22,0},{0.88,-0.24,-0.06},{0.68,-0.04,-0.19},{0.65,0.04,-0.19},{0.44,0.26,-0.33},{0.41,0.36,-0.33},{0.88,-0.03,0}}

    local Wing3M = {{0.99,-0.42,0},{0.94,-0.44,0.05},{0.74,-0.23,0.18},{0.68,-0.04,0.18},{0.93,-0.23,0},{0.99,-0.42,0},{0.94,-0.44,-0.05},{0.74,-0.23,-0.18},{0.68,-0.04,-0.18},{0.93,-0.23,0}}

    local theta = ThetaOffset - ThetaMultiplier*getTime() 
    local pers = Angle
    
    local thickness = thickness or 0.1*vh
    
    local sin = math.sin
    local cos = math.cos
    local rad = math.rad
    
    local function Rotate3DYX(TableRowXYZ,theta,pers)
        
        local X,Y,Z = table.unpack(TableRowXYZ)
        
        local C1 = X*cos(rad(-theta)) + Z*sin(rad(-theta))
        local C3 = - X*sin(rad(-theta)) + Z*cos(rad(-theta))

        local C2 = Y*cos(rad(pers)) - C3*sin(rad(pers))
        local C3 = Y*sin(rad(pers)) + C3*cos(rad(pers))

        return {-C1,C2,C3}
        
    end
    
    local sa = 0
    
    setDefaultStrokeColor(Front,Shape_Line,r,g,b,a)
    setDefaultStrokeColor(Back,Shape_Line,r,g,b,a)
    
    setDefaultStrokeWidth(Front,Shape_Line,thickness)
    setDefaultStrokeWidth(Back,Shape_Line,thickness)
    
    setDefaultShadow(Front,Shape_Line,0.5*vh,r,g,b,sa)
    setDefaultShadow(Back,Shape_Line,0.5*vh,r,g,b,sa)

    for ii = 1,#CubeO do       
        CubeO[ii] = Rotate3DYX(CubeO[ii],theta,pers) 
        CubeOM[ii] = Rotate3DYX(CubeOM[ii],theta,pers) 
        if ii > 1 then
            if CubeO[ii][3] >= 0 then
                addLine(Front,CubeO[ii][1]*Scale + X,CubeO[ii][2]*Scale + Y,CubeO[ii -1][1]*Scale + X,CubeO[ii -1][2]*Scale + Y)
            else
                addLine(Back,CubeO[ii][1]*Scale + X,CubeO[ii][2]*Scale + Y,CubeO[ii -1][1]*Scale + X,CubeO[ii -1][2]*Scale + Y)
            end
            if CubeOM[ii][3] >= 0 then
                addLine(Front,CubeOM[ii][1]*Scale + X,CubeOM[ii][2]*Scale + Y,CubeOM[ii -1][1]*Scale + X,CubeOM[ii -1][2]*Scale + Y)
            else
                addLine(Back,CubeOM[ii][1]*Scale + X,CubeOM[ii][2]*Scale + Y,CubeOM[ii -1][1]*Scale + X,CubeOM[ii -1][2]*Scale + Y)
            end
        end
    end

    for ii = 1,#CubeI do
        CubeI[ii] = Rotate3DYX(CubeI[ii],theta,pers)
        CubeIM[ii] = Rotate3DYX(CubeIM[ii],theta,pers)       
        if ii > 1 then
            if CubeI[ii][3] >= 0 then
                addLine(Front,CubeI[ii][1]*Scale + X,CubeI[ii][2]*Scale + Y,CubeI[ii -1][1]*Scale + X,CubeI[ii -1][2]*Scale + Y)
            else
                addLine(Back,CubeI[ii][1]*Scale + X,CubeI[ii][2]*Scale + Y,CubeI[ii -1][1]*Scale + X,CubeI[ii -1][2]*Scale + Y)
            end
            if CubeOM[ii][3] >= 0 then
                addLine(Front,CubeIM[ii][1]*Scale + X,CubeIM[ii][2]*Scale + Y,CubeIM[ii -1][1]*Scale + X,CubeIM[ii -1][2]*Scale + Y)
            else
                addLine(Back,CubeIM[ii][1]*Scale + X,CubeIM[ii][2]*Scale + Y,CubeIM[ii -1][1]*Scale + X,CubeIM[ii -1][2]*Scale + Y)
            end
        end
    end

    for ii = 1,#Wing1 do
        Wing1[ii] = Rotate3DYX(Wing1[ii],theta,pers)
        Wing1M[ii] = Rotate3DYX(Wing1M[ii],theta,pers)
        if ii > 1 then
            if Wing1[ii][3] >= 0 then
                addLine(Front,Wing1[ii][1]*Scale + X,Wing1[ii][2]*Scale + Y,Wing1[ii -1][1]*Scale + X,Wing1[ii -1][2]*Scale + Y)
            else
                addLine(Back,Wing1[ii][1]*Scale + X,Wing1[ii][2]*Scale + Y,Wing1[ii -1][1]*Scale + X,Wing1[ii -1][2]*Scale + Y)
            end
            if Wing1M[ii][3] >= 0 then
                addLine(Front,Wing1M[ii][1]*Scale + X,Wing1M[ii][2]*Scale + Y,Wing1M[ii -1][1]*Scale + X,Wing1M[ii -1][2]*Scale + Y)
            else
                addLine(Back,Wing1M[ii][1]*Scale + X,Wing1M[ii][2]*Scale + Y,Wing1M[ii -1][1]*Scale + X,Wing1M[ii -1][2]*Scale + Y)
            end
        end
    end

    for ii = 1,#Wing2 do
        Wing2[ii] = Rotate3DYX(Wing2[ii],theta,pers)
        Wing2M[ii] = Rotate3DYX(Wing2M[ii],theta,pers)
        if ii > 1 then
            if Wing2[ii][3] >= 0 then
                addLine(Front,Wing2[ii][1]*Scale + X,Wing2[ii][2]*Scale + Y,Wing2[ii -1][1]*Scale + X,Wing2[ii -1][2]*Scale + Y)
            else
                addLine(Back,Wing2[ii][1]*Scale + X,Wing2[ii][2]*Scale + Y,Wing2[ii -1][1]*Scale + X,Wing2[ii -1][2]*Scale + Y)
            end
            if Wing2M[ii][3] >= 0 then
                addLine(Front,Wing2M[ii][1]*Scale + X,Wing2M[ii][2]*Scale + Y,Wing2M[ii -1][1]*Scale + X,Wing2M[ii -1][2]*Scale + Y)
            else
                addLine(Back,Wing2M[ii][1]*Scale + X,Wing2M[ii][2]*Scale + Y,Wing2M[ii -1][1]*Scale + X,Wing2M[ii -1][2]*Scale + Y)
            end
        end
    end

    for ii = 1,#Wing3 do
        Wing3[ii] = Rotate3DYX(Wing3[ii],theta,pers)
        Wing3M[ii] = Rotate3DYX(Wing3M[ii],theta,pers)
        if ii > 1 then
            if Wing3[ii][3] >= 0 then
                addLine(Front,Wing3[ii][1]*Scale + X,Wing3[ii][2]*Scale + Y,Wing3[ii -1][1]*Scale + X,Wing3[ii -1][2]*Scale + Y)
            else
                addLine(Back,Wing3[ii][1]*Scale + X,Wing3[ii][2]*Scale + Y,Wing3[ii -1][1]*Scale + X,Wing3[ii -1][2]*Scale + Y)
            end
            if Wing3M[ii][3] >= 0 then
                addLine(Front,Wing3M[ii][1]*Scale + X,Wing3M[ii][2]*Scale + Y,Wing3M[ii -1][1]*Scale + X,Wing3M[ii -1][2]*Scale + Y)
            else
                addLine(Back,Wing3M[ii][1]*Scale + X,Wing3M[ii][2]*Scale + Y,Wing3M[ii -1][1]*Scale + X,Wing3M[ii -1][2]*Scale + Y)
            end
        end
    end
    
end

--------------------------------------------------- Draws Base Support of a Mining Unit ----------------------------------------------------(3)
local function DrawBase(Front,Back,X,Y,Scale,r,g,b,a)
    
    local rx, ry = getResolution()
    local vw = rx/100
    local vh = ry/100
    
    local CX = 114

    local X1 = { 26, 2, 31, 34, 44, 52, 58, 66, 66, 114, 114, 73, 58, 51, 41, 26, 55, 51, 38, 27, 48, 60, 72, 93, 93, 96, 101, 101, 87, 87, 101, 101, 91, 76}
    local Y1 = {190, 175, 98, 96,65, 59, 44, 42, 11, 21,129,112,155, 157, 186, 190, 107, 98, 132, 127,73, 77, 83, 58, 38, 34, 41, 63, 84, 93, 96, 110, 105, 103}

    local X2 = {51,59}
    local Y2 = {98,76.65}

    local X3 = {34,40.7}
    local Y3 = {96,91.77}

    local X4 = {72,77,80,73}
    local Y4 = {83,86,92,112}

    local X5 = {101,101,96,80,75,77}
    local Y5 = {119.5,41,34,29,36,77}

    local X6 = {66,68}
    local Y6 = {42,81}

    local X7 = {66,114}
    local Y7 = {11,1}

    local X8 = {101,78,78}
    local Y8 = {119,110,103.5}

    local sa = 0
    
    setDefaultStrokeColor(Front,Shape_Line,r,g,b,a)
    setDefaultStrokeColor(Back,Shape_Line,r,g,b,a)

    setDefaultStrokeWidth(Front,Shape_Line,0.25*vh)
    setDefaultStrokeWidth(Back,Shape_Line,0.25*vh)

    setDefaultShadow(Front,Shape_Line,0.5*vh,r,g,b,sa)
    setDefaultShadow(Back,Shape_Line,0.5*vh,r,g,b,sa)

    for ii = 1,#X1 - 1 do

        addLine(Front,(X1[ii] - CX)*Scale + X,Y1[ii]*Scale + Y,(X1[ii+1] - CX)*Scale + X,Y1[ii+1]*Scale + Y)
        addLine(Front,-(X1[ii] - CX)*Scale + X,Y1[ii]*Scale + Y,-(X1[ii+1] - CX)*Scale + X,Y1[ii+1]*Scale + Y)

    end

    addLine(Front,(X2[1] - CX)*Scale + X,Y2[1]*Scale + Y,(X2[2] - CX)*Scale + X,Y2[2]*Scale + Y)
    addLine(Front,(X3[1] - CX)*Scale + X,Y3[1]*Scale + Y,(X3[2] - CX)*Scale + X,Y3[2]*Scale + Y)
    addLine(Front,(X6[1] - CX)*Scale + X,Y6[1]*Scale + Y,(X6[2] - CX)*Scale + X,Y6[2]*Scale + Y)
    addLine(Back,(X7[1] - CX)*Scale + X,Y7[1]*Scale + Y,(X7[2] - CX)*Scale + X,Y7[2]*Scale + Y)
    
    addLine(Front,-(X2[1] - CX)*Scale + X,Y2[1]*Scale + Y,-(X2[2] - CX)*Scale + X,Y2[2]*Scale + Y)
    addLine(Front,-(X3[1] - CX)*Scale + X,Y3[1]*Scale + Y,-(X3[2] - CX)*Scale + X,Y3[2]*Scale + Y)
    addLine(Front,-(X6[1] - CX)*Scale + X,Y6[1]*Scale + Y,-(X6[2] - CX)*Scale + X,Y6[2]*Scale + Y)
    addLine(Back,-(X7[1] - CX)*Scale + X,Y7[1]*Scale + Y,-(X7[2] - CX)*Scale + X,Y7[2]*Scale + Y)

    for ii = 1,#X4 - 1 do

        addLine(Front,(X4[ii] - CX)*Scale + X,Y4[ii]*Scale + Y,(X4[ii+1] - CX)*Scale + X,Y4[ii+1]*Scale + Y)
        addLine(Front,-(X4[ii] - CX)*Scale + X,Y4[ii]*Scale + Y,-(X4[ii+1] - CX)*Scale + X,Y4[ii+1]*Scale + Y)

    end

    for ii = 1,#X5 - 1 do

        addLine(Front,(X5[ii] - CX)*Scale + X,Y5[ii]*Scale + Y,(X5[ii+1] - CX)*Scale + X,Y5[ii+1]*Scale + Y)
        addLine(Front,-(X5[ii] - CX)*Scale + X,Y5[ii]*Scale + Y,-(X5[ii+1] - CX)*Scale + X,Y5[ii+1]*Scale + Y)

    end

    for ii = 1,#X8 - 1 do

        addLine(Front,(X8[ii] - CX)*Scale + X,Y8[ii]*Scale + Y,(X8[ii+1] - CX)*Scale + X,Y8[ii+1]*Scale + Y)
        addLine(Front,-(X8[ii] - CX)*Scale + X,Y8[ii]*Scale + Y,-(X8[ii+1] - CX)*Scale + X,Y8[ii+1]*Scale + Y)
        
    end

end

--------------------------------------------------- Draws Static Top Cap of a Mining Unit ----------------------------------------------------(4)
local function MiningModuleCap(Front,X,Y,Scale,ThetaOffset,ThetaMultiplier,r,g,b,a)
    
    local rx, ry = getResolution()
    local vw = rx/100
    local vh = ry/100

    local CubeO = {{-0.45,-0.23,0},{0,-0.23,-0.45},{0.45,-0.23,0},{0,-0.23,0.45},{-0.45,-0.23,0},{-0.45,0.1,0},{0,0.1,0.45},{0.45,0.1,0},{0.45,-0.23,0}}
    
    local pers = -15
    local sa = 0
    
    local sin = math.sin
    local cos = math.cos
    local rad = math.rad

    for ii = 1,#CubeO do
        local C = CubeO[ii]
       
        local C2 = C[2]*cos(rad(pers)) - C[3]*sin(rad(pers))
        local C3 = C[2]*sin(rad(pers)) + C[3]*cos(rad(pers))

        CubeO[ii][2] = C2
        CubeO[ii][3] = C3
    end
    
    setDefaultStrokeColor(Front,Shape_Polygon,r,g,b,a)
    setDefaultStrokeWidth(Front,Shape_Polygon,0.25*vh)
    setDefaultShadow(Front,Shape_Polygon,0.5*vh,r,g,b,sa)
    setDefaultFillColor(Front,Shape_Polygon,0,0.05*0.2,0.05*0.8,0)

    addQuad(Front,CubeO[1][1]*Scale + X,CubeO[1][2]*Scale + Y,CubeO[2][1]*Scale + X,CubeO[2][2]*Scale + Y,CubeO[3][1]*Scale + X,CubeO[3][2]*Scale + Y,CubeO[4][1]*Scale + X,CubeO[4][2]*Scale + Y)
    addQuad(Front,CubeO[4][1]*Scale + X,CubeO[4][2]*Scale + Y,CubeO[5][1]*Scale + X,CubeO[5][2]*Scale + Y,CubeO[6][1]*Scale + X,CubeO[6][2]*Scale + Y,CubeO[7][1]*Scale + X,CubeO[7][2]*Scale + Y)
    addQuad(Front,CubeO[4][1]*Scale + X,CubeO[4][2]*Scale + Y,CubeO[9][1]*Scale + X,CubeO[9][2]*Scale + Y,CubeO[8][1]*Scale + X,CubeO[8][2]*Scale + Y,CubeO[7][1]*Scale + X,CubeO[7][2]*Scale + Y)
        
end

---------------------------------------------- Draws a Partial or Full Hexagon with Perspective -------------------------------------------------(5)
local function addHexagon(Front,Center,Back,CX,CY,EdgeLength,pers,r,g,b,a,str,stg,stb,sta,strokewidth,hextype)
    
    local rx, ry = getResolution()
    local vw = rx/100
    local vh = ry/100
    
    local ii = 0
    local jj = 0
    
    local sin = math.sin
    local cos = math.cos
    local rad = math.rad
    local sqrt = math.sqrt
    
    local X1 = (ii - EdgeLength/2)*vh
    local Y1 = (jj - EdgeLength*sqrt(3)/2)*vh
    local X2 = (ii - EdgeLength)*vh
    local Y2 = (jj - 0)*vh
    local X3 = (ii - EdgeLength/2)*vh
    local Y3 = (jj + EdgeLength*sqrt(3)/2)*vh
    local X4 = (ii + EdgeLength/2)*vh
    local Y4 = (jj + EdgeLength*sqrt(3)/2)*vh
    local X5 = (ii + EdgeLength)*vh
    local Y5 = (jj - 0)*vh
    local X6 = (ii + EdgeLength/2)*vh
    local Y6 = (jj - EdgeLength*sqrt(3)/2)*vh
    
    local Y1 = (Y1-jj)*cos(rad(pers))
    local Z1 = (Y1-jj)*sin(rad(pers))
    local Y2 = (Y2-jj)*cos(rad(pers))
    local Z2 = (Y2-jj)*sin(rad(pers))
    local Y3 = (Y3-jj)*cos(rad(pers))
    local Z3 = (Y3-jj)*sin(rad(pers))
    local Y4 = (Y4-jj)*cos(rad(pers))
    local Z4 = (Y4-jj)*sin(rad(pers))
    local Y5 = (Y5-jj)*cos(rad(pers))
    local Z5 = (Y5-jj)*sin(rad(pers))
    local Y6 = (Y6-jj)*cos(rad(pers))
    local Z6 = (Y6-jj)*sin(rad(pers))

    local X1 = X1 + CX
    local Y1 = Y1 + CY
    local X2 = X2 + CX
    local Y2 = Y2 + CY
    local X3 = X3 + CX
    local Y3 = Y3 + CY
    local X4 = X4 + CX
    local Y4 = Y4 + CY
    local X5 = X5 + CX
    local Y5 = Y5 + CY
    local X6 = X6 + CX
    local Y6 = Y6 + CY

    setDefaultFillColor(Back,Shape_Polygon,r,g,b,a)
    setDefaultStrokeColor(Back,Shape_Polygon,r,g,b,0)
    setDefaultStrokeWidth(Back,Shape_Polygon,0.1)         

    addQuad(Back,X6 - 0.55,Y6,X1,Y1,X2,Y2,X3 - 0.55,Y3)
    addQuad(Back,X3 + 0.55,Y3,X4,Y4,X5,Y5,X6 + 0.55,Y6)

    setDefaultStrokeColor(Front,Shape_Line,str,stg,stb,sta)
    setDefaultStrokeWidth(Front,Shape_Line,strokewidth)
    
    setDefaultStrokeColor(Center,Shape_Line,str,stg,stb,sta)
    setDefaultStrokeWidth(Center,Shape_Line,strokewidth)
    
    if hextype == 1 then

        addLine(Center,X1,Y1,X2,Y2)
        addLine(Center,X2,Y2,X3,Y3)
        addLine(Front,X3,Y3,X4,Y4)
        addLine(Center,X4,Y4,X5,Y5)
        addLine(Center,X5,Y5,X6,Y6)
        addLine(Center,X6,Y6,X1,Y1)
        
    elseif hextype == 2 then
        
        addLine(Center,X1,Y1,X2,Y2)        
        addLine(Front,X3,Y3,X4,Y4)        
        addLine(Center,X5,Y5,X6,Y6)       
        
    elseif hextype == 3 then
        
        addLine(Center,X2,Y2,X3,Y3)
        addLine(Center,X4,Y4,X5,Y5)
        addLine(Center,X6,Y6,X1,Y1)
        
    end

end

---------------------------------------------- Draws a Fully Assembled Mining Unit Top Down -------------------------------------------------(6)
local function DrawMiningUnitTopDown(Front,Center,Back,X,Y,working)
    
    local rx, ry = getResolution()
    local vw = rx/100
    local vh = ry/100
    
    local r,g,b,a = 0.8,0.8,0.2,1
    local rot = 0
    local offset = 0
    local phase = 90
    
    if working == 2 then 
        if GColorblind == 1 then
            r,g,b,a = 0,0.5,1,1
        else
            r,g,b,a = 0,1,0.5,1
        end
        rot = 120
        offset = 45
        phase = 0
    elseif working == 1 then
        if RColorblind == 1 then
            r,g,b,a = 0,0.5,1,1
        else
            r,g,b,a = 1,0.2,0.2,1
        end      
        rot = 0
        offset = 45
        phase = 0
    end

    MiningModule(Front,Back,X,Y,10*vh,offset,rot,r,g,b,a,-90,0.25*vh)
    MiningModule(Front,Back,X,Y,10*vh,phase-offset,-rot,r,g,b,a,-90,0.25*vh)

    addHexagon(Back,Back,Back,X,Y,9,0,0,0,0,0,0.75,0.75,0.75,1,0.5*vh,2)
    addHexagon(Back,Back,Back,X,Y,6,0,0,0,0,0,0.75,0.75,0.75,1,0.5*vh,3)
    addHexagon(Back,Back,Back,X,Y,2,0,0,0,0,0,0.75,0.75,0.75,1,0.5*vh,1)

end

------------------------------------------------- Draws Cards per Mining Unit with Stats ----------------------------------------------------(7)
function DrawMiningUnitCard(Top,Front,Center,Back,Font,XX,YY,DataRow)
    
    local rx, ry = getResolution()
    local vw = rx/100
    local vh = ry/100

    DrawMiningUnitTopDown(Front,Center,Back,XX,YY,tonumber(DataRow.State) )

    local ocr,ocg,ocb = table.unpack(OreTable[DataRow.OreID].color)
    setNextTextAlign(Front, AlignH_Right, AlignV_Middle)
    setNextFillColor(Front, ocr/255,ocg/255,ocb/255, 1)
    setFontSize(Font,3*vh)
    addText(Front, Font, OreTable[DataRow.OreID].displayNameWithSize, XX + 18*vw, YY - 7*vh)  

    setNextFillColor(Front, 1,1,1, 1)
    setNextTextAlign(Front, AlignH_Right, AlignV_Middle)
    setFontSize(Font,3*vh)
    addText(Front, Font, tostring(math.floor(round(100*tonumber(DataRow.CalibrationRate),1))) .. 
        "|" .. tostring(math.floor(round(100*tonumber(DataRow.OptimalRate),1))) .. " %", XX + 18*vw, YY - 3.5*vh)
  
    local BaseRate = round(tonumber(DataRow.BaseRate))
    setNextTextAlign(Front, AlignH_Right, AlignV_Middle)
    setNextFillColor(Front, 1,1,1, 1)
    setFontSize(Font,3*vh)
    addText(Front, Font, 
        tostring(math.ceil(round(DataRow.ProductionRate))) .. 
        "|".. 
        tostring(math.ceil(BaseRate)) .. " L/h"
        , XX + 18*vw, YY)

        
    if (86400-tonumber(DataRow.Cooldown)) > 0 then
        
        setNextFillColor(Front, 1,1,0, 1)
        
        local CDHours = (86400-tonumber(DataRow.Cooldown))/60/60
        local CDMinutes = round((CDHours - math.floor(CDHours))*60)
        
        CooldownText = math.floor(CDHours) .. "H" .. math.floor(CDMinutes) .. "M"
        
    else
                
        setNextFillColor(Front, 1,1,0, 1)
        CooldownText = "CALIBRATE"        
        
    end

    setNextTextAlign(Front, AlignH_Right, AlignV_Middle)
    setNextFillColor(Front, 0,0.5,1, 1)
    setFontSize(Font,3*vh)
    addText(Front, Font, CooldownText, XX + 18*vw, YY + 7*vh)
    
    local CalibrationMargin = tonumber(DataRow.CalibrationRate)-tonumber(DataRow.OptimalRate)
        
    if CalibrationMargin < 0 then
        if (86400-tonumber(DataRow.Cooldown)) > 0 then

            setNextFillColor(Front, 1,0,1, 1)
            CalibrationText = CooldownText

        else

            setNextFillColor(Front, 1,0,0, 1)
            CalibrationText = "CALIBRATE"     

        end
        
    else
        setNextFillColor(Front, 0,0.5,1, 1)
                
        local Days = (3-math.min(tonumber(DataRow.Cooldown)/60/60/24 ,3)) + CalibrationMargin/0.15
        local Hours = (Days - math.floor(Days))*24
        local Minutes = (Hours - math.floor(Hours))*60
        
        local DaysText = tostring(math.floor(Days))
        local HoursText = tostring(math.floor(Hours))
        local MinutesText = tostring(math.floor(Minutes))
        
        CalibrationText = DaysText .. "D" .. HoursText .. "H" .. MinutesText .. "M"
    end
            
    setNextTextAlign(Front, AlignH_Right, AlignV_Middle) 
    setFontSize(Font,3*vh)
    addText(Front, Font, CalibrationText , XX + 18*vw, YY + 3.5*vh)

    local url = OreTable[DataRow.OreID].iconPath
    local image = loadImage(url)
    addImage(Top, image, XX - 5*vh, YY - 5*vh, 10*vh, 10*vh)
        
    if getCursorReleased() then
        x,y = getCursor()
        if (x > (XX - 10*vh)) and (x < (XX + 30*vh)) and (y > (YY - 10*vh)) and (y < (YY + 10*vh)) then
            LocationMessageWillBeSent = true
            local OutMessage = 'Location&::pos{0,0,' .. DataRow.Position .. '}'
            setOutput(OutMessage)
        end    
    end
    
end

------------------------------------- Draws Fully Assembled Mining Unit at 15 Degree Perspective ----------------------------------------------(8)
function DrawMiningUnitProfile15Degrees(Front,Center,Back,X,Y,running)
    
    local rx, ry = getResolution()
    local vw = rx/100
    local vh = ry/100

    if running == 1 then
        if GColorblind == 1 then
            r,g,b,a = 0,0.5,1,1
        else
            r,g,b,a = 0,1,0.5,1
        end
        rot = 120
    else
        if RColorblind == 1 then
            r,g,b,a = 0,0.5,1,1
        else
            r,g,b,a = 1,0.2,0.2,1
        end 
        rot = 0
    end

    
    MiningModule(Front,Back,X,Y+6*vh,10*vh,0,rot,r,g,b,a,-15,0.25*vh)
    MiningModule(Front,Back,X,Y+16*vh,10*vh,0,-rot,r,g,b,a,-15,0.25*vh)
    MiningModule(Front,Back,X,Y+26*vh,10*vh,0,rot,r,g,b,a,-15,0.25*vh)
    MiningModule(Front,Back,X,Y+36*vh,10*vh,0,-rot,r,g,b,a,-15,0.25*vh)
    MiningModule(Front,Back,X,Y+46*vh,10*vh,0,rot,r,g,b,a,-15,0.25*vh)
    MiningModule(Front,Back,X,Y+56*vh,10*vh,0,-rot,r,g,b,a,-15,0.25*vh)

    DrawBase(Front,Back,X,Y+63*vh,0.55,r,g,b,a)

    MiningModuleCap(Front,X,Y,10*vh,0,120,r,g,b,a)

    addHexagon(Front,Center,Back,X,Y + 77.5*vh,14,-70,0,0,0,0,1,1,1,1,0.5*vh,2)
    addHexagon(Front,Center,Back,X,Y + 77.5*vh,8,-70,0,0,0,0,1,1,1,1,0.5*vh,3)
    addHexagon(Front,Center,Back,X,Y + 77.5*vh,3,-70,0,0,0,0,1,1,1,1,0.5*vh,1)

    
    if running then
        setNextStrokeColor(Center,200/255, 255/255, 255/255,1)
        setNextStrokeWidth(Center,0.25*vh)
        setNextShadow(Center, 1.5*vh,100/255, 180/255, 255/255,1)
        addLine(Center,89*vw,Y+2.8*vh,89*vw,Y+77.75*vh)
    end
    
end

------------------------------------------------- Draws Summary Stats Bar at the Bottom -----------------------------------------------------(9)
function HorizontalGauge(layer,font,Data,Mass,Vol,X,Y,SX,SY,n,r,g,b,CalibrationTime,StorageTime)
    
    local rx, ry = getResolution()
    local vw = rx/100
    local vh = ry/100

    local Height = math.ceil(Data/(100/n))

    for jj = 1,Height,1 do
        setNextFillColor(layer,r,g,b,0.2+(jj^3)*(0.4/(Height^3)))
        addQuad(layer,
            X - SX/2 + (jj-1)*SX/n + SX/n*0.2,
            Y - SY/2,
            X - SX/2 + (jj-1)*SX/n + SX/n*0.2,
            Y + SY/2,
            X - SX/2 + (jj-1)*SX/n + SX/n*0.8,
            Y + SY/2,
            X - SX/2 + (jj-1)*SX/n + SX/n*0.8,
            Y - SY/2)
    end

    -- Flair --
    
    setDefaultStrokeColor(layer,Shape_Line,r,g,b,1)
    setDefaultStrokeWidth(layer,Shape_Line,0.5*vh)   

    addLine(layer, X - SX/2 - vh, Y - SY/2 - vh, X - SX/2 - vh, Y - SY/2 - vh + SY*0.6 )
    addLine(layer, X - SX/2 - vh, Y - SY/2 - vh, X - SX/2 - vh + SX*0.4, Y - SY/2 - vh )

    setNextFillColor(layer,r,g,b,1)
    addCircle(layer,X - SX/2 - vh, Y - SY/2 - vh, 1*vh)
    
    setDefaultStrokeColor(layer,Shape_Line,r,g,b,0.5)
    setDefaultStrokeWidth(layer,Shape_Line,0.25*vh) 
 
    addLine(layer, X + SX/2 + vh, Y + SY/2 + vh, X + SX/2 + vh, Y + SY/2 + vh - SY*0.5 )
    addLine(layer, X + SX/2 + vh, Y + SY/2 + vh, X + SX/2 + vh - SX*0.4, Y + SY/2 + vh )

    setNextFillColor(layer,r,g,b,1)
    addCircle(layer,X + SX/2 + vh, Y + SY/2 + vh, 0.5*vh)
    
    -- Text --
    
    setNextTextAlign(layer, AlignH_Left, AlignV_Middle)
    setNextFillColor(layer, r, g, b, 1)
    addText(layer, font, string.format("%.1f",Data) .. "%", X+SX/2+2*vh, Y)
    
    setNextTextAlign(layer, AlignH_Right, AlignV_Middle)
    setNextFillColor(layer, r, g, b, 1)
    addText(layer, font, string.format("%.1f",Vol) .. "t", X + SX/2 + 25*vh, Y)
    
    setNextTextAlign(layer, AlignH_Right, AlignV_Middle)
    setNextFillColor(layer, r, g, b, 1)
    addText(layer, font, string.format("%.1f",Mass) .. "kL", X + SX/2 + 39*vh, Y)
    
    -- Icon -- 
    
    local image = loadImage("resources_generated/elements/containers/container_001_xl/icons/env_container_001_xl_icon.png")
    addImage(layer, image,X - SX/2 - 12*vh, Y - 4*vh, 8*vh, 8*vh)
    
    -- Global Cooldown
          
    setFontSize(font,3*vh)
    if CalibrationTime <= 0 then
        setNextFillColor(layer, 1,0,0, 1)
        CalibrationText = "CALIBRATE"
    else
        setNextFillColor(layer, 0,0,1, 1)
                
        local Days = math.floor(CalibrationTime)
        local Hours = (CalibrationTime - Days)*24
        local Minutes = (Hours - math.floor(Hours))*60
        
        local DaysText = tostring(math.floor(Days))
        local HoursText = tostring(math.floor(Hours))
        local MinutesText = tostring(math.floor(Minutes))
        
        CalibrationText = DaysText .. "D" .. HoursText .. "H" .. MinutesText .. "M"
    end
    
    setNextTextAlign(layer, AlignH_Right, AlignV_Middle)
    addText(layer, font, CalibrationText, X - SX/2 - 15*vh, Y)
    setFontSize(font,3*vh)
    
    -- Storage Time --
    setNextTextAlign(layer, AlignH_Center, AlignV_Middle)
    setNextFillColor(layer, 1, g, 1, 1)
    
    if StorageTime <= 0 then
        setNextFillColor(layer, 1,0,0, 1)
        StorageText = "FULL"
    else
        setNextFillColor(layer, 1,1,1, 1)
                
        local Days = math.floor(StorageTime/24)
        local Hours = StorageTime - Days*24
        local Minutes = (Hours - math.floor(Hours))*60
        
        local DaysText = tostring(math.floor(Days))
        local HoursText = tostring(math.floor(Hours))
        local MinutesText = tostring(math.floor(Minutes))
        
        StorageText = ">" .. DaysText .. "D" .. HoursText .. "H" .. MinutesText .. "M"
    end
    
    addText(layer, font, StorageText, X, Y)

end

------------------------------------------------------------ General Helpers -----------------------------------------------------------------(10)

--- Splits String at Delimiter ---
function mysplit(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t={}
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        table.insert(t, str)
    end
    return t
end

-- Rounds Number to Precision ---
function round(num, numDecimalPlaces)
  local mult = 10^(numDecimalPlaces or 0)
  return math.floor(num * mult + 0.5) / mult
end

------------------------------------------------------------ Reference Tables -----------------------------------------------------------------(11)

OreTable = {    
    ["4234772167"]={color={255,255,129},displayNameWithSize="Hematite",iconPath="resources_generated/env/voxel/ore/iron-ore/icons/env_iron-ore_icon.png"},
    ["3724036288"]={color={159,209,255},displayNameWithSize="Quartz",iconPath="resources_generated/env/voxel/ore/silicon-ore/icons/env_silicon-ore_icon.png"},
    ["299255727"]={color={192,255,255},displayNameWithSize="Coal",iconPath="resources_generated/env/voxel/ore/carbon-ore/icons/env_carbon-ore_icon.png"},
    ["262147665"]={color={255,188,68},displayNameWithSize="Bauxite",iconPath="resources_generated/env/voxel/ore/aluminium-ore/icons/env_aluminium-ore_icon.png"},
    
    ["2289641763"]={color={70,255,197},displayNameWithSize="Malachite",iconPath="resources_generated/env/voxel/ore/copper-ore/icons/env_copper-ore_icon.png"},
    ["3086347393"]={color={255,128,88},displayNameWithSize="Limestone",iconPath="resources_generated/env/voxel/ore/calcium-ore/icons/env_calcium-ore_icon.png"},
    ["2029139010"]={color={129,255,129},displayNameWithSize="Chromite",iconPath="resources_generated/env/voxel/ore/chromium-ore/icons/env_chromium-ore_icon.png"},
    ["343766315"]={color={255,139,157},displayNameWithSize="Natron",iconPath="resources_generated/env/voxel/ore/sodium-ore/icons/env_sodium-ore_icon.png"},
        
    ["4041459743"]={color={74,255,74},displayNameWithSize="Pyrite",iconPath="resources_generated/env/voxel/ore/sulfur-ore/icons/env_sulfur-ore_icon.png"}, 
    ["3837858336"]={color={108,255,255},displayNameWithSize="Petalite",iconPath="resources_generated/env/voxel/ore/lithium-ore/icons/env_lithium-ore_icon.png"},    
    ["1050500112"]={color={75,255,166},displayNameWithSize="Acanthite",iconPath="resources_generated/env/voxel/ore/silver-ore/icons/env_silver-ore_icon.png"},
    ["1065079614"]={color={255,148,124},displayNameWithSize="Garnierite",iconPath="resources_generated/env/voxel/ore/nickel-ore/icons/env_nickel-ore_icon.png"},
    
    ["1866812055"]={color={255,103,63},displayNameWithSize="Gold Nuggets",iconPath="resources_generated/env/voxel/ore/gold-ore/icons/env_gold-ore_icon.png"},
    ["271971371"]={color={255,166,104},displayNameWithSize="Kolbeckite",iconPath="resources_generated/env/voxel/ore/scandium-ore/icons/env_scandium-ore_icon.png"},
    ["3546085401"]={color={255,132,79},displayNameWithSize="Cobaltite",iconPath="resources_generated/env/voxel/ore/cobalt-ore/icons/env_cobalt-ore_icon.png"},
    ["1467310917"]={color={168,255,73},displayNameWithSize="Cryolite",iconPath="resources_generated/env/voxel/ore/fluorine-ore/icons/env_fluorine-ore_icon.png"},
    
    ["3934774987"]={color={90,206,255},displayNameWithSize="Rhodonite",iconPath="resources_generated/env/voxel/ore/manganese-ore/icons/env_manganese-ore_icon.png"},
    ["629636034"]={color={255,203,255},displayNameWithSize="Ilmenite",iconPath="resources_generated/env/voxel/ore/titanium-ore/icons/env_titanium-ore_icon.png"},
    ["2162350405"]={color={184,184,255},displayNameWithSize="Vanadinite",iconPath="resources_generated/env/voxel/ore/vanadium-ore/icons/env_vanadium-ore_icon.png"},    
    ["789110817"]={color={231,229,74},displayNameWithSize="Columbite",iconPath="resources_generated/env/voxel/ore/niobium-ore/icons/env_niobium-ore_icon.png"}
}
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------- Compose --------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------

local rx, ry = getResolution()
local vw = rx/100
local vh = ry/100

local Logo = createLayer()
local Aura0 = createLayer()
local Aura1 = createLayer()
local Back = createLayer()
local Center = createLayer()
local Front = createLayer()
local Top = createLayer()

local Font = loadFont(getAvailableFontName(5), 6*vh)

if not _init then
    
    NMUs = 0
    DataTable = {}
    Empty = {}
    LocationMessageWillBeSent = false
    
    _init = true
    
end

Payload = getInput()

if Payload ~= nil and Payload ~= '' then
        
    PayloadType = mysplit(Payload, "&")    
    
    Info = mysplit(PayloadType[1], "$")
    NMUs = tonumber(Info[1])
    Mass = tonumber(Info[2])
    Vol = tonumber(Info[3])
    MaxVol = tonumber(Info[4])
    ConstructName = Info[5]
    RColorblind = tonumber(Info[6])
    GColorblind = tonumber(Info[7])
    ConstructPos = Info[8]
    AcquiredTime = Info[9]
       
    if PayloadType[2] ~= nil and PayloadType[2] ~= '' then
        
        DataRows = mysplit(PayloadType[2], "#")  
        DataTable = {}
        for idx, v in ipairs(DataRows) do
            CurrentRow = mysplit(v, "$") 
            DataTable[idx] = {
                State = CurrentRow[1],
                OreID = CurrentRow[2],
                BaseRate = CurrentRow[3],
                Efficiency = CurrentRow[4],
                Adjacency = CurrentRow[5],
                CalibrationRate = CurrentRow[6],
                OptimalRate = CurrentRow[7],
                ProductionRate = CurrentRow[8],
                Cooldown = CurrentRow[9],
                Position = CurrentRow[10]
            }
        end
        
    end

end

Background(Logo,Aura0,Aura1)

counter = 0
for ii = 1,2 do
    for jj = 1,4 do
        
        counter = counter + 1
        
        if counter <= NMUs then
        
            DrawMiningUnitCard(Top,Front,Center,Back,Font,30*vw + (ii-1)*27.5*vw,15*vh + (jj-1)*20*vh, DataTable[counter])    
            
        end
        
    end
end

local Productions = {}
local TotalProduction = 0
local CalibTimes = {}
local CDTimes = {}

for i ,v in ipairs(DataTable) do
    
    if Productions[v.OreID] then 
        Productions[v.OreID] = Productions[v.OreID] + tonumber(v.ProductionRate)
    else
        Productions[v.OreID] = tonumber(v.ProductionRate)
    end
    
    TotalProduction = TotalProduction + tonumber(v.ProductionRate)
    
    CalibrationMargin = tonumber(v.CalibrationRate)-tonumber(v.OptimalRate)
    CDTimes[i] = (86400-tonumber(v.Cooldown))/60/60
    if CalibrationMargin > 0 then
        CalibTimes[i] = (3-math.min(tonumber(v.Cooldown)/60/60/24 ,3)) + CalibrationMargin/0.15             
    else
        CalibTimes[i] = CDTimes[i]  
    end
end

StorageTime = (MaxVol - Vol)/TotalProduction

table.sort(CalibTimes)
CalibrationTime = CalibTimes[1]

table.sort(CDTimes)
CDTime = CDTimes[1]

HorizontalGauge(Front,Font,100*Vol/MaxVol,Mass/1000,Vol/1000,79.5*vh,90*vh,15*vw,5*vh,20,0.75,0.75,0.1,CalibrationTime,StorageTime)
DrawMiningUnitProfile15Degrees(Front,Center,Back,89*vw,11*vh,1)
DrawMiningUnitProfile15Degrees(Front,Center,Back,11*vw,11*vh,0)

ProdText = ''
for k,v in pairs(Productions) do
    ProdText = ProdText .. "#" .. k .. "$" .. round(v,1)
end

MessageOut = round(StorageTime,2) .. "$" .. Vol .. "$" .. Mass .. "$" .. round(CalibrationTime,2) .. "$" .. round(CDTime) .. "$" .. ConstructName ..
 "$" .. ConstructPos .. "$" .. AcquiredTime .. "&" .. ProdText 

if not LocationMessageWillBeSent then
    setOutput(MessageOut)
end

requestAnimationFrame(1)