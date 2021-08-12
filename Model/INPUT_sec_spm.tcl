
#set Ec5	[expr 33000.*pow(0.140 + 5./1000,1.5)*sqrt(5.)*$ksi];	# Young's Modulus of Concrete 5 ksi
#set Ec6	[expr 33000.*pow(0.140 + 6./1000,1.5)*sqrt(6.)*$ksi];	# Young's Modulus of Concrete 6 ksi

set Ec5	[expr 33000.*pow(0.140 + 6.5/1000,1.5)*sqrt(6.5)*$ksi];	# Young's Modulus of Concrete 5 ksi
set Ec6	[expr 33000.*pow(0.140 + 7.8/1000,1.5)*sqrt(7.8)*$ksi];	# Young's Modulus of Concrete 6 ksi

set nuc 0.2

set Ec5String $matTag
incr matTag 1

set Ec6String $matTag
incr matTag 1

set Edummy $matTag
incr matTag 1

uniaxialMaterial Elastic $Ec5String [expr 0.50*$Ec5]
uniaxialMaterial Elastic $Ec6String [expr 0.50*$Ec6]


# STRINGER SECTION (10"x8")
set t [expr 8.*$in]
set w [expr 10.*$in]

set string10x8 $secTag
incr secTag 1

section Fiber $string10x8 -GJ 0.0 {

fiber 0 0 [expr $t*$w] $Ec5String

}


set string10x8_6 $secTag
incr secTag 1

section Fiber $string10x8_6 -GJ 0.0 {

fiber 0 0 [expr $t*$w] $Ec6String

}


# STRINGER SECTION (10"x12")
set t [expr 12.*$in]
set w [expr 10.*$in]

set string10x12 $secTag
incr secTag 1

section Fiber $string10x12 -GJ 0.0 {

fiber 0 0 [expr $t*$w] $Ec6String

}
