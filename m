Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D2B543601
	for <lists.virtualization@lfdr.de>; Wed,  8 Jun 2022 17:05:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA1A360EC5;
	Wed,  8 Jun 2022 15:05:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tqb0-O2ZQnrK; Wed,  8 Jun 2022 15:05:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 482F360F08;
	Wed,  8 Jun 2022 15:05:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9F0F0C002D;
	Wed,  8 Jun 2022 15:05:10 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E22D3C0039
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Jun 2022 15:05:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BE6A460E91
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Jun 2022 15:05:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ApHbile6EubY
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Jun 2022 15:05:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DD50D60A81
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Jun 2022 15:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Ukp02Ivtbnt/qfD+Hr8nM4W5X9OZTZ1VV5qELeaRbZ8=; b=bbxN9JJ2Y40pQW61I7MOn5Xh9V
 S2c5QQ85ziHXD+1t+vjh+fhEPqK3iKxsEIjt7edJojnVzBl9gYwXvjRIeRNrN7ZibzX36WHLDVayV
 nInDIdKkQ3BbhSqYmNWsz/BWsnpgq0hnvQFNP0XQXQaQmMCitXKvbycTG4I5w7PN7aMWKy95vrTUX
 Uzl0vpf81V6OGBp/kwTpeykt3MVn9hantJe3I/I9BoxiPWvicF7AqjWicEUzWX/bGUDW8mfpyxbC/
 CHmKhktwPRwgpVTZHfY5ORW3ZQsK5N3aBEK/OQ7rkuVgMtsoWyCiQqRvNg8qTMNOWWW7Vr6eX+dTm
 f13zRk5g==;
Received: from dhcp-077-249-017-003.chello.nl ([77.249.17.3]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nyxEg-00CjUs-8y; Wed, 08 Jun 2022 15:04:42 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 227AC301BE7;
 Wed,  8 Jun 2022 17:04:41 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 089E520C0B5D8; Wed,  8 Jun 2022 17:04:41 +0200 (CEST)
Date: Wed, 8 Jun 2022 17:04:40 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com,
 vgupta@kernel.org, linux@armlinux.org.uk, ulli.kroll@googlemail.com,
 linus.walleij@linaro.org, shawnguo@kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, kernel@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com, tony@atomide.com,
 khilman@kernel.org, catalin.marinas@arm.com, will@kernel.org,
 guoren@kernel.org, bcain@quicinc.com, chenhuacai@kernel.org,
 kernel@xen0n.name, geert@linux-m68k.org, sammy@sammy.net,
 monstr@monstr.eu, tsbogend@alpha.franken.de, dinguyen@kernel.org,
 jonas@southpole.se, stefan.kristiansson@saunalahti.fi,
 shorne@gmail.com, James.Bottomley@hansenpartnership.com,
 deller@gmx.de, mpe@ellerman.id.au, benh@kernel.crashing.org,
 paulus@samba.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, hca@linux.ibm.com, gor@linux.ibm.com,
 agordeev@linux.ibm.com, borntraeger@linux.ibm.com,
 svens@linux.ibm.com, ysato@users.sourceforge.jp, dalias@libc.org,
 davem@davemloft.net, richard@nod.at,
 anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
 acme@kernel.org, mark.rutland@arm.com,
 alexander.shishkin@linux.intel.com, jolsa@kernel.org,
 namhyung@kernel.org, jgross@suse.com, srivatsa@csail.mit.edu,
 amakhalov@vmware.com, pv-drivers@vmware.com,
 boris.ostrovsky@oracle.com, chris@zankel.net, jcmvbkbc@gmail.com,
 rafael@kernel.org, lenb@kernel.org, pavel@ucw.cz,
 gregkh@linuxfoundation.org, mturquette@baylibre.com,
 sboyd@kernel.org, daniel.lezcano@linaro.org, lpieralisi@kernel.org,
 sudeep.holla@arm.com, agross@kernel.org, bjorn.andersson@linaro.org,
 anup@brainfault.org, thierry.reding@gmail.com, jonathanh@nvidia.com,
 jacob.jun.pan@linux.intel.com, Arnd Bergmann <arnd@arndb.de>,
 yury.norov@gmail.com, andriy.shevchenko@linux.intel.com,
 linux@rasmusvillemoes.dk, rostedt@goodmis.org, pmladek@suse.com,
 senozhatsky@chromium.org, john.ogness@linutronix.de,
 paulmck@kernel.org, frederic@kernel.org, quic_neeraju@quicinc.com,
 josh@joshtriplett.org, mathieu.desnoyers@efficios.com,
 jiangshanlai@gmail.com, joel@joelfernandes.org,
 juri.lelli@redhat.com, vincent.guittot@linaro.org,
 dietmar.eggemann@arm.com, bsegall@google.com, mgorman@suse.de,
 bristot@redhat.com, vschneid@redhat.com, jpoimboe@kernel.org,
 linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-snps-arc@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-um@lists.infradead.org, linux-perf-users@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 xen-devel@lists.xenproject.org, linux-xtensa@linux-xtensa.org,
 linux-acpi@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-arch@vger.kernel.org,
 rcu@vger.kernel.org
Subject: Re: [PATCH 34/36] cpuidle,omap3: Push RCU-idle into omap_sram_idle()
Message-ID: <YqC6iJx4ygSmry0G@hirez.programming.kicks-ass.net>
References: <20220608142723.103523089@infradead.org>
 <20220608144518.073801916@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220608144518.073801916@infradead.org>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Linux virtualization <virtualization.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Wed, Jun 08, 2022 at 04:27:57PM +0200, Peter Zijlstra wrote:
> @@ -254,11 +255,18 @@ void omap_sram_idle(void)
>  	 */
>  	if (save_state)
>  		omap34xx_save_context(omap3_arm_context);
> +
> +	if (rcuidle)
> +		cpuidle_rcu_enter();
> +
>  	if (save_state == 1 || save_state == 3)
>  		cpu_suspend(save_state, omap34xx_do_sram_idle);
>  	else
>  		omap34xx_do_sram_idle(save_state);
>  
> +	if (rcuidle)
> +		rcuidle_rcu_exit();

*sigh* so much for this having been exposed to the robots for >2 days :/
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
