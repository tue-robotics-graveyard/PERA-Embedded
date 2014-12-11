setPreference -pref UserLevel:NOVICE
setPreference -pref MessageLevel:DETAILED
setPreference -pref ConcurrentMode:FALSE
setPreference -pref UseHighz:FALSE
setPreference -pref ConfigOnFailure:STOP
setPreference -pref StartupCLock:AUTO_CORRECTION
setPreference -pref AutoSignature:FALSE
setPreference -pref KeepSVF:FALSE
setPreference -pref svfUseTime:FALSE
setMode -bs
setcable -port svf -file "esra_spartan6.svf"
adddevice -position 1 -part "XCF08P"
setAttribute -position 1 -attr configFileName -value "esra_spartan6.mcs"
program -p 1
verify -p 1
quit

