transcript on 
write transcript nco_vo_transcript
if {[file exist [project env]] > 0} {
project close
}
if {[file exist "C:/Users/Sergio/Downloads/EECS301/labbbb/NCO.mpf"] == 0} {
  project new [pwd] NCO
} else	{
project open NCO
}
# Create default work directory if not present
if {[file exist work] ==0} 	{
  exec vlib work
  exec vmap work work
}
# Map lpm library
if {[file exist lpm] ==0} 	{
  exec vlib lpm
  exec vmap lpm lpm}
vlog -93 -work lpm $env(QUARTUS_ROOTDIR)/eda/sim_lib/220model.v

# Map altera_mf library
if {[file exist altera_mf] ==0} 	{
  exec vlib altera_mf
  exec vmap altera_mf altera_mf}
vlog -93 -work altera_mf $env(QUARTUS_ROOTDIR)/eda/sim_lib/altera_mf.v

# Map sgate library
if {[file exist sgate] ==0} 	{
  exec vlib sgate
  exec vmap sgate sgate}
vlog -93 -work sgate $env(QUARTUS_ROOTDIR)/eda/sim_lib/sgate.v

vlog NCO.vo
vlog NCO_tb.v
vsim -L lpm -L altera_mf -L sgate -novopt NCO_tb
do NCO_wave.do
run 22000 ns
