// license:BSD-3-Clause
// copyright-holders:Couriersud
/*
 * nld_legacy.c
 *
 */

#include "nl_base.h"

namespace netlist::devices {

	NETLIB_OBJECT(nicRSFF)
	{
		NETLIB_CONSTRUCTOR(nicRSFF)
		, m_S(*this, "S", NETLIB_DELEGATE(inputs))
		, m_R(*this, "R", NETLIB_DELEGATE(inputs))
		, m_Q(*this, "Q")
		, m_QQ(*this, "QQ")
		{
		}

		NETLIB_RESETI()
		{
			m_Q.initial(0);
			m_QQ.initial(1);
		}

	private:
		NETLIB_HANDLERI(inputs)
		{
			if (!m_S())
			{
				m_Q.push(1, NLTIME_FROM_NS(20));
				m_QQ.push(0, NLTIME_FROM_NS(20));
			}
			else if (!m_R())
			{
				m_Q.push(0, NLTIME_FROM_NS(20));
				m_QQ.push(1, NLTIME_FROM_NS(20));
			}
		}

		logic_input_t m_S;
		logic_input_t m_R;

		logic_output_t m_Q;
		logic_output_t m_QQ;
	};


	NETLIB_OBJECT(nicDelay)
	{
		NETLIB_CONSTRUCTOR(nicDelay)
		, m_I(*this, "1", NETLIB_DELEGATE(input))
		, m_Q(*this, "2")
		, m_L_to_H(*this, "L_TO_H", 10)
		, m_H_to_L(*this, "H_TO_L", 10)
		, m_last(*this, "m_last", 0)
		{
		}

		//NETLIB_UPDATE_PARAMI();
		NETLIB_RESETI()
		{
			//m_Q.initial(0);
		}

	private:
		NETLIB_HANDLERI(input)
		{
			netlist_sig_t nval = m_I();
			if (nval && !m_last)
			{
				// L_to_H
				m_Q.push(1, NLTIME_FROM_NS(static_cast<unsigned>(m_L_to_H())));
			}
			else if (!nval && m_last)
			{
				// H_to_L
				m_Q.push(0, NLTIME_FROM_NS(static_cast<unsigned>(m_H_to_L())));
			}
			m_last = nval;
		}

		logic_input_t m_I;
		logic_output_t m_Q;

		param_int_t m_L_to_H;
		param_int_t m_H_to_L;

		state_var<netlist_sig_t> m_last;
	};

	NETLIB_DEVICE_IMPL(nicRSFF,  "NETDEV_RSFF",  "")
	NETLIB_DEVICE_IMPL(nicDelay, "NETDEV_DELAY", "")

} // namespace netlist::devices
