load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"

begin
    y=sin(0.0628*ispan(0,100,1)) ;Genera una curva con 101 puntos
    wks=gsn_open_wks("x11","basic_ex") ;Abre una ventana x11
    res=False ; Sin opciones de ploteao ajustadas
    plot=gsn_csm_y(wks,y,res)
end
