;================================================;
;  maponly_9.ncl
;================================================;
;
; Concepts illustrated:
;   - Drawing Mexico and U.S. states
;   - Improving the resolution of map outlines
;   - Zooming in on a particular area on the map
;

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"

begin

  wks  = gsn_open_wks("pdf","mexico")              ; open a ps file

  res                           = True              ; plot mods desired
  res@mpOutlineOn               = True              ; turn on outline
  res@mpFillOn                  = False             ; turn off map fill

  res@mpMinLatF                 = 14                ; zoom in on map
  res@mpMaxLatF                 = 52
  res@mpMinLonF                 = -125.
  res@mpMaxLonF                 = -70.

  res@mpOutlineBoundarySets     = "geophysicalandusstates"; turn on states
  res@mpDataBaseVersion         = "MediumRes"             ; select database
  res@mpDataSetName             = "Earth..2"

  res@gsnDraw                   = False                  ; don't draw
  res@gsnFrame                  = False                  ; don't advance frame
  plot = gsn_csm_map_ce(wks,res)                         ; create map

; get the names of the potential outlines in the database by retrieving
; and printing them.
  getvalues plot
     "mpAreaNames" : area_names
  end getvalues
;  print(anames)

; review and select those that specify the mexican states.
  res@mpOutlineSpecifiers = area_names(617:655)
  res@tiMainString        = "Mapita de Mexico y de Estados Unidos"

  plot = gsn_csm_map_ce(wks,res)                    ; draw global map

  draw(plot)
  frame(wks)

  end