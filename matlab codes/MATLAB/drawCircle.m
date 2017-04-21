function img = drawCircle(pic,x,y,r)


yellow = uint8([255 255 0]); % [R G B]; class of yellow must match class of I
shapeInserter = vision.ShapeInserter('Shape','Circles','BorderColor','Custom','CustomBorderColor',yellow);
circles = int32(  [x y r] );
J = step(shapeInserter, pic, circles);
img=J;
end