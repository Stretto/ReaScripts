-- @description Show all active track envelopes, hide unactive
-- @version 1.0
-- @author mpl
-- @website http://forum.cockos.com/member.php?u=70694
-- @changelog
--    + init release

difference = -10

function main()
  for tr = 1, reaper.CountTracks(0) do
    local track = reaper.GetTrack(0,tr-1)
    if track then 
      for i = 1,  reaper.CountTrackEnvelopes( track ) do
        local env = reaper.GetTrackEnvelope( track, i-1 )
        local br_env = reaper.BR_EnvAlloc( env, false )
        local active, visible, armed, inLane, laneHeight, defaultShape, _, _, _, _, faderScaling = reaper.BR_EnvGetProperties( br_env )
        
        if active then visible = true else visible = false end
        
        reaper.BR_EnvSetProperties( br_env, 
                                  active, 
                                  visible, 
                                  armed, 
                                  inLane, 
                                  laneHeight, 
                                  defaultShape, 
                                  faderScaling )
        reaper.BR_EnvFree( br_env, true )
      end
    end
  end
  
end
    
main()
