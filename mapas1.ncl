load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"
begin
  wks  = gsn_open_wks("pdf","campitos-ley1")            ; open a ps file


  res                             = True
  res@mpFillOn                    = False        ; turn off gray fill
  res@mpOutlineBoundarySets       = "National"   ; turn on country boundaries
  res@mpGeophysicalLineColor      = "Navy"       ; color of cont. outlines
  res@mpGeophysicalLineThicknessF = 1.5          ; thickness of outlines

  res@mpMaxLatF                   = 30           ; choose subregion
  res@mpMinLatF                   = -50
  res@mpMaxLonF                   = 160
  res@mpMinLonF                   = 90
  plot = gsn_csm_map_ce(wks,res)                 ; draw map

  res@mpMaxLatF                   = 38           ; choose a different subregion
  res@mpMinLatF                   = 10
  res@mpMaxLonF                   = -80
  res@mpMinLonF                   = -120

  plot = gsn_csm_map_ce(wks,res)                 ; draw map

  ; The medium resolution map is required to get the most up-to-date
  ; country boundaries. The mpDataSetName resource only has an effect when
  ; mpDataBaseVersion is set to "MediumRes".

  res@mpDataBaseVersion = "MediumRes"            ; choose higher resolution
  res@mpDataSetName = "Earth..4"                 ; choose most recent boundaries

  plot = gsn_csm_map_ce(wks,res)                 ; draw map

  end