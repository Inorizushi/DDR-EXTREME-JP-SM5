-- todo: add danger blinking
--[[
float fPercentRed = (m_fTrailingLifePercentage<DANGER_THRESHOLD) ? sinf( RageTimer::GetTimeSinceStart()*PI*4 )/2+0.5f : 0;
m_quadBlackBackground.SetDiffuse( RageColor(fPercentRed*0.8f,0,0,1) );
--]]

return Def.Quad{
	InitCommand=cmd(zoomto,256,26;diffuse,color("0,0,0,1"));
};