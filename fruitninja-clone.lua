displayMode(FULLSCREEN)
function setup()
    bf={}
    fru={}
    touches = {}
    timer=0
    fs=0
    score=0
    lf={}
    rf={}
end


function touched(touch)
    if touch.state == ENDED then

        touches[touch.id] = nil
    else

        touches[touch.id] = touch
    end
end

function draw()

physics.body(EDGE,vec2(0,0),vec2(0,HEIGHT))
physics.body(EDGE,vec2(WIDTH,0),vec2(WIDTH,HEIGHT))
physics.body(EDGE,vec2(0,HEIGHT),vec2(WIDTH,HEIGHT))
    timer = timer + DeltaTime
    background(255, 255, 255, 255)
sprite("Documents:bg",WIDTH/2,HEIGHT/2)
    for k,touch in pairs(touches) do

        math.randomseed(touch.id)

        fill(255, 0, 0, 255)

        ellipse(touch.x, touch.y,20)
        table.insert(bf,{x=touch.x,y=touch.y,t=300,s=7})
                for i,f in pairs(fru) do 
                    if math.abs(f.x-touch.x)<40 and math.abs(f.y-touch.y)<40 then
                        score = score +1
                        local r=physics.body(CIRCLE,f.size/3)
                        r.x=f.x+10
                        r.y=f.y
                        r.linearVelocity=vec2(math.random(50,100))
                        r.type=DYNAMIC
                        r.s=f.size
                        r.angle=math.deg(math.atan2(CurrentTouch.y-f.y,CurrentTouch.x-f.x))
                        table.insert(rf,r)
                                  local l=physics.body(CIRCLE,f.size/3)
                        l.x=f.x-10
                        l.y=f.y
                        l.linearVelocity=vec2(math.random(-100,-50))
                        l.type=DYNAMIC
                        l.s=f.size
                        l.angle=math.deg(math.atan2(CurrentTouch.y-f.y,CurrentTouch.x-f.x))-90
                        table.insert(lf,l)
                        table.remove(fru,i)

                    end
                    end

    for i,b in pairs(bf)  do 
        sprite("Cargo Bot:Crate Goal Red",b.x,b.y,b.s)
        strokeWidth(1)
        stroke(0, 0, 0, 255)
        b.t = b.t -40
        if b.t<=0 then
            table.remove(bf,i)
        end
        end
        end

        if timer>0 then
         local   size=math.random(60,100)
       local fruit=physics.body(CIRCLE,size/2)
    fruit.size=size
    fruit.x=math.random(100,WIDTH-100)
    fruit.y=-10
    fruit.restitution=.9
    fruit.type=DYNAMIC
    fruit.linearVelocity=vec2(math.random(-100,100),math.random(600,700))
    fruit.angle=math.random(90)
    table.insert(fru,fruit)
            timer=math.random(-4,-1)
end
for i,f in pairs(fru) do 
    pushMatrix()
    translate(f.x,f.y)
    rotate(f.angle)
    sprite("Documents:wm",0,0,f.size,f.size)
    popMatrix()

    if 
    f.y<-100 then
        table.remove(fru,i)
        end
        end
pushStyle()
            text("Score:"..score,50,HEIGHT-50)  
            popStyle()    



    for j,r in pairs(rf) do 

        pushMatrix()
        translate(r.x,r.y)
        rotate(r.angle)
        sprite("Documents:rf",0,0,r.s/2)
        if r.y<0
    then table.remove(rf,j)
    end
    popMatrix()

        end


    for j,r in pairs(lf) do 

        pushMatrix()
        translate(r.x,r.y)
        rotate(r.angle)
        sprite("Documents:lf",0,0,r.s/2)
        popMatrix()



     if r.y<0
    then table.remove(lf,j)
    end
        end

    end