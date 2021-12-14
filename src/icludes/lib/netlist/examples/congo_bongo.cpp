// license:CC0
// copyright-holders:Andrew Gardner,Couriersud

#include "netlist/devices/net_lib.h"

/* ----------------------------------------------------------------------------
 *  Define
 * ---------------------------------------------------------------------------*/

/* set to 1 to use optimizations increasing performance significantly */

#ifndef USE_OPTIMOPTIMIZATIONS
#define USE_OPTIMIZATIONS    1
#endif

#ifndef USE_FRONTIERS
#define USE_FRONTIERS       1
#endif

/* ----------------------------------------------------------------------------
 *  Library section header START
 * ---------------------------------------------------------------------------*/

#ifndef __PLIB_PREPROCESSOR__

#define G501534_DIP(_name)                                                     \
		NET_REGISTER_DEV_X(G501534_DIP, _name)

NETLIST_EXTERNAL(congob_lib)

#endif

/* ----------------------------------------------------------------------------
 *  Library section header END
 * ---------------------------------------------------------------------------*/


NETLIST_START(congo_bongo)
//  EESCHEMA NETLIST VERSION 1.1 (SPICE FORMAT) CREATION DATE: WED 01 JUL 2015 11:09:25 PM CEST
//  TO EXCLUDE A COMPONENT FROM THE SPICE NETLIST ADD [SPICE_NETLIST_ENABLED] USER FIELD SET TO: N
//  TO REORDER THE COMPONENT SPICE NODE SEQUENCE ADD [SPICE_NODE_SEQUENCE] USER FIELD AND DEFINE SEQUENCE: 2,1,0
// SHEET NAME:/
// IGNORED O_AUDIO0: O_AUDIO0  64 0
// .END

	PARAM(Solver.RELTOL, 1e-2)
	PARAM(Solver.VNTOL, 1e-6)
	PARAM(Solver.NR_LOOPS, 30)
	PARAM(Solver.GS_LOOPS, 99)
	PARAM(Solver.METHOD, "MAT_CR")

	//PARAM(Solver.METHOD, "GMRES")
	//PARAM(Solver.ACCURACY, 1e-5)
	//PARAM(Solver.METHOD, "SOR")

#if USE_OPTIMIZATIONS
	SOLVER(Solver, 48000)
#else
	SOLVER(Solver, 48000)
	PARAM(Solver.DYNAMIC_TS, 1)
	PARAM(Solver.PARALLEL, 0)
	PARAM(Solver.DYNAMIC_MIN_TIMESTEP, 2e-7)
	PARAM(Solver.DYNAMIC_LTE, 1e-4)
#endif

	LOCAL_SOURCE(congob_lib)
	INCLUDE(congob_lib)

	// The following TTL_INPUTs need to be hooked up in MAME
	// I_BASS_DRUM0, I_CONGA_H0, I_CONGA_L0, I_GORILLA0, I_RIM0
	//
	// 76489 outputs to ANALOG_INPUTS
	//
	// I_DSG4, I_DSG5

	// Found here: https://hamesspam.sakura.ne.jp/hes2016/160521.html
	NET_MODEL("1S2075 D(IS=1.387E-9 N=1.702 RS=1.53 CJO=1.92pf VJ=0.4996 M=0.0605 TT=5ns BV=75 IBV=100E-15)")

	NET_MODEL("2SC1941 NPN(IS=46.416f BF=210 NF=1.0022 VAF=600 IKF=500m ISE=60f NE=1.5 BR=2.0122 NR=1.0022 VAR=10G IKR=10G ISC=300p NC=2 RB=13.22 IRB=10G RBM=13.22 RE=100m RC=790m CJE=26.52p VJE=900m MJE=518m TF=1.25n XTF=10 VTF=10 ITF=500m PTF=0 CJC=4.89p VJC=750m MJC=237m XCJC=500m TR=100n CJS=0 VJS=750m MJS=500m XTB=1.5 EG=1.11 XTI=3 KF=0 AF=1 FC=500m)")

	INCLUDE(CongoBongo_schematics)
	SUBMODEL(CongoBongo_amp, amp)
	INCLUDE(CongoBongo_dsg)

	NET_C(R94.1, SJ1)
	NET_C(SOU1, amp.AMPIN1)
	NET_C(GND, amp.GND)

#if USE_OPTIMIZATIONS
	/* The opamp has an UGF of about 1000k. This doesn't work here and causes oscillations.
	 * UGF here therefore about half the Solver clock.
	 */
	PARAM(U16.B.MODEL, "MB3614(TYPE=3 UGF=22k)")
	PARAM(U17.C.MODEL, "MB3614(TYPE=3 UGF=44k)")
#endif
#if USE_FRONTIERS
	//OPTIMIZE_FRONTIER(C51.2, RES_K(47), 50)
	//OPTIMIZE_FRONTIER(R78.2, RES_K(20), RES_K(47))
	OPTIMIZE_FRONTIER(R77.2, RES_K(20), 50)

	OPTIMIZE_FRONTIER(C25.2, RES_K(240), 50)
	OPTIMIZE_FRONTIER(C29.2, RES_K(390), 50)
	OPTIMIZE_FRONTIER(C37.2, RES_K(390), 50)
	OPTIMIZE_FRONTIER(C44.2, RES_K(200), 50)

	OPTIMIZE_FRONTIER(R90.2, RES_K(100), 50)
	OPTIMIZE_FRONTIER(R92.2, RES_K(15), 50)

	OPTIMIZE_FRONTIER(R19.2, RES_K(51), 50)
#endif

NETLIST_END()

NETLIST_START(CongoBongo_schematics)

	CAP(C20, CAP_N(68))
	CAP(C21, CAP_U(1))
	CAP(C22, CAP_U(47))
	CAP(C23, CAP_N(100))
	CAP(C24, CAP_N(100))
	CAP(C25, CAP_U(1))
	CAP(C26, CAP_N(68))
	CAP(C27, CAP_N(33))
	CAP(C28, CAP_U(47))
	CAP(C29, CAP_U(1))
	CAP(C30, CAP_N(33))
	CAP(C31, CAP_N(33))
	CAP(C32, CAP_N(68))
	CAP(C33, CAP_N(33))
	CAP(C34, CAP_U(47))
	CAP(C35, CAP_N(33))
	CAP(C36, CAP_N(33))
	CAP(C37, CAP_U(1))
	CAP(C38, CAP_N(10))
	CAP(C39, CAP_N(3.300000))
	CAP(C40, CAP_U(2.200000))
	CAP(C41, CAP_N(6.800000))
	CAP(C42, CAP_N(6.800000))
	CAP(C43, CAP_N(47))
	CAP(C44, CAP_U(1))
	CAP(C45, CAP_U(33))
	CAP(C46, CAP_N(100))
	CAP(C47, CAP_P(470))
	CAP(C48, CAP_N(1.500000))
	CAP(C49, CAP_P(220))
	CAP(C50, CAP_N(3.900000))
	CAP(C51, CAP_U(1))
	CAP(C52, CAP_U(1))
	CAP(C53, CAP_U(1))
	CAP(C54, CAP_U(1))
	CAP(C55, CAP_U(1))
	CAP(C56, CAP_U(10))
	CAP(C57, CAP_N(47))
	CAP(C58, CAP_N(22))
	CAP(C59, CAP_U(10))
	CAP(C60, CAP_N(22))
	CAP(C61, CAP_U(1))
	CAP(C62, CAP_N(22))
	DIODE(D1, "1S2075")
	DIODE(D2, "1S2075")
	DIODE(D3, "1S2075")
	DIODE(D4, "1S2075")
	DIODE(D5, "1S2075")
	DIODE(D6, "1S2075")
	DIODE(D7, "1S2075")
	DIODE(D8, "1S2075")
	TTL_INPUT(I_BASS_DRUM0, 0)
	TTL_INPUT(I_CONGA_H0, 0)
	TTL_INPUT(I_CONGA_L0, 0)
	TTL_INPUT(I_GORILLA0, 0)
	TTL_INPUT(I_RIM0, 0)
	ANALOG_INPUT(I_V12, 12)
	ANALOG_INPUT(I_V5, 5)
	ANALOG_INPUT(I_V6, 6)
	QBJT_EB(Q2, "2SC1941")
	RES(R21, RES_K(10))
	RES(R22, RES_K(47))
	RES(R23, RES_K(47))
	RES(R24, RES_K(10))
	RES(R25, RES_K(47))
	RES(R26, RES_K(22))
	RES(R27, RES_K(10))
	RES(R28, RES_K(470))
	RES(R29, RES_K(1))
	RES(R30, RES_K(240))
	RES(R31, RES_K(10))
	RES(R32, RES_K(47))
	RES(R33, RES_K(47))
	RES(R34, RES_K(47))
	RES(R35, RES_K(47))
	RES(R36, RES_K(22))
	RES(R37, RES_K(10))
	RES(R38, RES_M(1))
	RES(R39, 330)
	RES(R40, RES_K(390))
	RES(R41, RES_K(10))
	RES(R42, RES_K(47))
	RES(R43, RES_K(47))
	RES(R44, RES_K(47))
	RES(R45, RES_K(47))
	RES(R46, RES_K(22))
	RES(R47, RES_K(10))
	RES(R48, RES_M(1))
	RES(R49, 220)
	RES(R50, RES_K(390))
	RES(R51, RES_K(10))
	RES(R52, RES_K(22))
	RES(R53, RES_K(22))
	RES(R54, RES_K(22))
	RES(R55, RES_K(22))
	RES(R56, RES_K(10))
	RES(R57, RES_K(4.700000))
	RES(R58, RES_M(1))
	RES(R59, 470)
	RES(R60, RES_M(2.200000))
	RES(R61, RES_M(2.200000))
	RES(R62, RES_K(200))
	RES(R63, RES_K(22))
	RES(R64, RES_K(22))
	RES(R65, RES_K(20))
	RES(R66, RES_K(20))
	RES(R67, RES_K(20))

	// Sallen-Key filter amplification is 1+R68/69 ~= 2

	RES(R68, RES_K(20))
	RES(R69, RES_K(20))
	RES(R70, RES_K(100))
	RES(R71, RES_K(150))
	RES(R72, RES_K(330))
	RES(R73, RES_K(1))
	RES(R74, RES_K(1))
	RES(R75, RES_K(470))
	RES(R76, RES_K(10))
	RES(R77, RES_K(20))
	RES(R78, RES_K(47))
	RES(R79, RES_K(22))
	RES(R80, RES_K(20))
	RES(R81, RES_K(10))
	RES(R82, RES_K(100))
	RES(R83, RES_K(51))
	RES(R84, RES_K(51))
	RES(R85, RES_K(51))
	RES(R86, RES_K(51))
	RES(R87, RES_K(100))
	RES(R88, RES_K(2.200000))
	RES(R89, RES_K(10))
	RES(R90, RES_K(100))
	RES(R91, RES_K(10))
	RES(R92, RES_K(15))
	RES(R93, RES_K(15))
	RES(R94, RES_K(51))
	MB3614_DIP(U13)
	G501534_DIP(U15)
	MB3614_DIP(U16)
	MB3614_DIP(U17)
	CD4001_DIP(U18)
	CD4538_DIP(U19)
	MM5837_DIP(U20)
	//PARAM(U20.FREQ, 38000) // FIXME: after measurement
	PARAM(U20.FREQ, 100000)
	TTL_7416_DIP(U6)
	NET_C(U15.3, C61.2)
	NET_C(R89.2, R88.2, Q2.B)
	NET_C(U16.13, U16.14, C57.1, C59.2)
	NET_C(U16.8, U16.9, U15.13)
	NET_C(U16.3, R86.2, I_V6.Q)
	NET_C(U16.2, R90.1, R91.2)
	NET_C(R89.1, D8.K)
	NET_C(U16.1, R91.1, R92.2)
	NET_C(U18.9, U19.6)
	NET_C(R71.1, U19.14, C53.2)
	NET_C(R76.1, U19.3, U19.13)
	NET_C(R72.2, D6.A, U18.10)
	NET_C(C51.2, R78.2)
	NET_C(I_GORILLA0.Q, U19.5, U19.11)
	NET_C(U17.12, C56.1, R81.2, R80.1)
	NET_C(U17.6, U17.7, R77.2)
	NET_C(U17.5, C55.1, R72.1, R73.1)
	NET_C(U17.3, R83.1, R84.2)
	NET_C(R73.2, D6.K)
	NET_C(U17.2, R82.1, C62.2, R85.2)
	NET_C(R92.1, C57.2, R93.2)
	NET_C(U16.12, R93.1, C58.1)
	NET_C(R68.2, C50.1, U17.8, C51.1)
	NET_C(C59.1, U15.1)
	NET_C(R68.1, R69.2, U17.9)
	NET_C(R67.1, C49.1, U17.10)
	NET_C(R70.1, C52.2, U19.2)
	NET_C(R65.2, U18.4)
	NET_C(U17.13, R78.1, R79.2, R77.1)
	NET_C(R63.1, R64.2, C47.1, D5.A, U18.5, U18.6)
	NET_C(R60.1, R61.2, C43.1)
	NET_C(C40.1, R57.2, R56.1)
	NET_C(R30.1, R40.1, R50.1, R62.1, R94.1)
	NET_C(D7.K, R74.2)
	NET_C(C20.2, R21.2, U6.8)
	NET_C(GND, U13.11, C22.2, R29.2, R25.2, R23.2, R22.2, U6.1, U6.3, U6.7, C28.2, R39.2, R35.2, R33.2, R32.2, C34.2, R49.2, R45.2, R43.2, R42.2, C40.2, R59.2, R55.2, R53.2, R52.2, C43.2, R69.1, R64.1, C49.2, C48.2, C47.2, C46.1, C45.1, U17.11, C55.2, C52.1, U18.1, U18.2, U18.7, U18.12, U18.13, C54.2, U16.11, R84.1, R88.1, Q2.E, C58.2, C60.2, U20.1, U20.2, U15.4, I_GORILLA0.GND, U19.1, U19.4, U19.8, U19.12, U19.15, I_BASS_DRUM0.GND, I_CONGA_L0.GND, I_CONGA_H0.GND, I_RIM0.GND, C53.1, C56.2, R81.1)
	NET_C(R74.1, R75.1, C54.1, U16.10)
	NET_C(D3.K, C32.1, R42.1)
	NET_C(U16.5, R86.1, R87.2)
	NET_C(C24.2, C23.1, R29.1)
	NET_C(U13.14, C25.2, C24.1, R28.1)
	NET_C(U16.7, R87.1, D8.A, R90.2)
	NET_C(U13.13, C23.2, R28.2)
	NET_C(U13.12, R24.1, R26.2, R25.1)
	NET_C(C21.1, R24.2)
	NET_C(U18.8, U19.9)
	NET_C(U13.8, C29.2, C31.1, R38.1)
	NET_C(U17.1, U16.6, C62.1)
	NET_C(U6.9, I_BASS_DRUM0.Q)
	NET_C(U6.12, C32.2, R41.2)
	NET_C(U13.10, R34.1, R36.2, R35.1)
	NET_C(C39.1, R54.2)
	NET_C(U6.10, C38.2, R51.2)
	NET_C(R85.1, Q2.C)
	NET_C(U13.3, R44.1, R46.2, R45.1)
	NET_C(D1.A, C21.2, R23.1)
	NET_C(C61.1, R94.2)
	NET_C(U13.5, R54.1, R56.2, R55.1)
	NET_C(U6.11, I_RIM0.Q)
	NET_C(C33.1, R44.2)
	NET_C(D7.A, R75.2, U19.10)
	NET_C(C25.1, R30.2)
	NET_C(C42.2, C41.1, R59.1)
	NET_C(U13.6, C41.2, R58.2, R60.2)
	NET_C(U13.7, C44.2, C42.1, R58.1, R61.1)
	NET_C(C60.1, U15.2)
	NET_C(U13.9, C30.2, R38.2)
	NET_C(C44.1, R62.2)
	NET_C(U6.5, I_CONGA_L0.Q)
	NET_C(U6.13, I_CONGA_H0.Q)
	NET_C(U6.14, D5.K, R70.2, R76.2, R71.2, U18.14, I_GORILLA0.VCC, U19.16, I_V5.Q, I_BASS_DRUM0.VCC, I_CONGA_L0.VCC, I_CONGA_H0.VCC, I_RIM0.VCC)
	NET_C(U6.6, C26.2, R31.2)
	NET_C(D2.A, C27.2, R33.1)
	NET_C(D1.K, C20.1, R22.1)
	NET_C(C29.1, R40.2)
	NET_C(D2.K, C26.1, R32.1)
	NET_C(C31.2, C30.1, R39.1)
	NET_C(R66.1, R67.2, C50.2)
#if 0
	RES(XX, 1)
	NET_C(C50.2, XX.1)
	NET_C(R66.1, R67.2, XX.2)
#endif
	NET_C(R63.2, U20.3)
	NET_C(C27.1, R34.2)
	NET_C(C22.1, R27.2, R26.1)
	NET_C(C28.1, R37.2, R36.1)
	NET_C(R65.1, R66.2, C48.1)
	NET_C(D3.A, C33.2, R43.1)
	NET_C(U13.1, C37.2, C36.1, R48.1)
	NET_C(C34.1, R47.2, R46.1)
	NET_C(C37.1, R50.2)
	NET_C(U17.14, R79.1, R82.2, R83.2)
	NET_C(U13.2, C35.2, R48.2)
	NET_C(U13.4, R27.1, R21.1, R37.1, R31.1, R47.1, R41.1, R57.1, R51.1, C46.2, C45.2, U17.4, U16.4, U20.4, U15.12, I_V12.Q, R80.2)
	NET_C(C36.2, C35.1, R49.1)
	NET_C(D4.A, C39.2, R53.1)
	NET_C(D4.K, C38.1, R52.1)
NETLIST_END()

NETLIST_START(CongoBongo_amp)
	// .INCLUDE "NLSPICE.LIB"
	// .TRAN 1E-5 1
	// .END
	ALIAS(AMPIN1, R83.1)
	ALIAS(AMPOUT1, R77.1)
	ANALOG_INPUT(I_V12, 12)
	//ANALOG_INPUT(GND, 0)
	ALIAS(GND, C66.2)
	CAP(C124, CAP_U(470))
	CAP(C51, CAP_U(10))
	CAP(C53, CAP_U(200))
	CAP(C54, CAP_N(3.900000))
	CAP(C55, CAP_P(220))
	CAP(C56, CAP_N(1.500000))
	CAP(C57, CAP_U(10))
	CAP(C58, CAP_U(10))
	CAP(C59, CAP_U(10))
	CAP(C66, CAP_N(100))
	RES(R77, RES_K(100))
	RES(R80, RES_K(20))
	RES(R81, RES_K(10))
	RES(R82, RES_K(10))
	RES(R83, RES_M(1))
	RES(R84, RES_K(47))
	RES(R85, RES_K(47))
	RES(R86, RES_M(1))
	RES(R87, RES_K(100))
	RES(R88, RES_K(20))
	RES(R89, RES_K(10))
	RES(R90, RES_K(10))
	RES(R91, RES_K(10))
	LM324_DIP(U2)
	POT(XVR1, 20000)
	PARAM(XVR1.DIAL, 0.500000)
	NET_C(R82.2, R81.1, C54.2)
	NET_C(C51.2, R77.1)
	NET_C(R91.2, C56.1, R82.1)
	NET_C(R84.2, C57.1)
	NET_C(R80.2, XVR1.1)
	NET_C(U2.10, C55.1, R81.2)
	NET_C(C58.2, XVR1.2)
	NET_C(U2.8, U2.9, R80.1, C54.1)
	NET_C(R77.2, C53.1)
	NET_C(C66.1, U2.4, C124.1, R89.1, I_V12.Q)
	NET_C(R83.1, R91.1)
	//NET_C(GND, C66.2, U2.11, C124.2, C56.2, C55.2, C57.2, C59.2, R90.2, C53.2, XVR1.3)
	NET_C(GND, U2.11, C124.2, C56.2, C55.2, C57.2, C59.2, R90.2, C53.2, XVR1.3)
	NET_C(R83.2, U2.13, U2.14, R86.1)
	NET_C(U2.1, R88.1, C51.1)
	NET_C(U2.7, R85.1, R87.2)
	NET_C(U2.3, U2.12, C59.1, R90.1, R89.2)
	NET_C(U2.2, R87.1, R88.2)
	NET_C(U2.5, R86.2, C58.1)
	NET_C(U2.6, R84.1, R85.2)

	RES(IN1, RES_K(50))
	RES(IN2, RES_K(50))
	NET_C(GND, IN1.2, IN2.2)
	NET_C(IN1.1, R77.1)
	NET_C(IN2.1, R77.2)

NETLIST_END()

NETLIST_START(CongoBongo_dsg)
	// .INCLUDE "NLSPICE.LIB"
	// .END
	ALIAS(SOU1, U12.14)
	ALIAS(SJ1, U12.13)
	CAP(C12, CAP_N(100))
	CAP(C13, CAP_N(100))
	CAP(C14, CAP_U(1))
	CAP(C15, CAP_U(1))
	ANALOG_INPUT(I_DSG4, 0)
	ANALOG_INPUT(I_DSG5, 0)
	//ANALOG_INPUT(I_V12, 12)
	//ANALOG_INPUT(I_V6, 6)
	RES(R14, 10)
	RES(R15, 10)
	RES(R16, RES_K(51))
	RES(R17, RES_K(51))
	RES(R18, RES_K(100))
	RES(R19, RES_K(51))
	RES(R20, RES_K(20))
	RES(ROU4, 150)
	RES(ROU5, 150)
	MB3614_DIP(U12)
	NET_C(I_DSG4.Q, ROU4.1)
	NET_C(R14.2, C12.1)
	NET_C(U12.6, U12.7)
	NET_C(R17.2, C15.1)
	NET_C(U12.4, I_V12.Q)
	NET_C(I_DSG5.Q, ROU5.1)
	NET_C(GND, U12.3, U12.5, U12.11, C12.2, C13.2)
	NET_C(U12.8, R18.1, R19.2)
	NET_C(U12.1, U12.2)
	NET_C(U12.14, R20.1)
	NET_C(R15.2, C13.1)
	NET_C(U12.9, R17.1, R16.1, R18.2)
	NET_C(C14.2, R15.1, ROU4.2)
	NET_C(R16.2, C14.1)
	NET_C(U12.10, U12.12, I_V6.Q)
	NET_C(U12.13, R19.1, R20.2)
	NET_C(R14.1, C15.2, ROU5.2)
NETLIST_END()

NETLIST_START(G501534_DIP)
	//AFUNC(f, 2, "A0 A1 A1 A1 * * 0.01 * *")
	//AFUNC(f, 2, "A0")
	//AFUNC(f, 2, "A0 6 - A1 3 pow * 0.02 * 6 +")
	//AFUNC(f, 2, "A0 * pow(A1,3.0) * 0.02")
	//AFUNC(f, 2, "A0 * A1 * 0.2")
	//AFUNC(f, 2, "(A0 - 6) * max(0, A1 - 2) * 0.3 + 6")
	AFUNC(f, 2, "(A0 - 6) * min(max(0.005, A1 - 2.3),0.3) * 2 + 6")

	/*
	 * 12:   VCC
	 *  4:   GND
	 *  1:   IN
	 *  3:   OUT
	 * 13:   CV
	 *  2:   RDL - connected via Capacitor to ground
	 */

	RES(DUMMY, RES_K(1))

	RES(RO, 1000)

	ALIAS(12, DUMMY.1) // VCC
	ALIAS(4,  DUMMY.2) // GND
	ALIAS(2,  DUMMY.2) // RDL
	ALIAS(1,  f.A0)
	ALIAS(13, f.A1)
	NET_C(f.Q, RO.1)
	ALIAS(3,  RO.2)

NETLIST_END()

NETLIST_START(congob_lib)

	LOCAL_LIB_ENTRY(G501534_DIP)

NETLIST_END()
