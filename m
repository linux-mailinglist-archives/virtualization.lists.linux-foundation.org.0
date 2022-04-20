Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3BD508FA5
	for <lists.virtualization@lfdr.de>; Wed, 20 Apr 2022 20:45:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2768A410A0;
	Wed, 20 Apr 2022 18:45:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TRpei3h5xeXn; Wed, 20 Apr 2022 18:45:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 76CB4409FE;
	Wed, 20 Apr 2022 18:45:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CC5A1C0088;
	Wed, 20 Apr 2022 18:45:08 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D70EAC002C
 for <virtualization@lists.linux-foundation.org>;
 Wed, 20 Apr 2022 18:45:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C3C0D40567
 for <virtualization@lists.linux-foundation.org>;
 Wed, 20 Apr 2022 18:45:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=chromium.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6AotLK5kbxY3
 for <virtualization@lists.linux-foundation.org>;
 Wed, 20 Apr 2022 18:45:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0A15F40119
 for <virtualization@lists.linux-foundation.org>;
 Wed, 20 Apr 2022 18:45:06 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 n11-20020a17090a73cb00b001d1d3a7116bso4263408pjk.0
 for <virtualization@lists.linux-foundation.org>;
 Wed, 20 Apr 2022 11:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=W5MPjhgHen7BuKxTDiZuP1jfbg11vB+Z7i5fz+eWvs4=;
 b=OwWBzNLEwTRij9iKP4J+DiTJJNKXZ5gjHzi5SIOfmc/lMuIsmfTp19Bh+2mVDiDMTL
 8wfyQKWKF57fPJcgyhQEuQGqF0JDygHQBlsuLIQ2NxriiTf+5w6eOWhfGOMhkONX7T7L
 tchZvLWXC4wL44JN+W/4p2JnRnhW8xoCPm93k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=W5MPjhgHen7BuKxTDiZuP1jfbg11vB+Z7i5fz+eWvs4=;
 b=3z2FXGBcm3r54IMJKuFc/oWObXt+59EFQZBpuWI6znNmVe0yHTGhBFauXf5zwwaC2x
 N1D6Cc/vUcZ0tcfoDra+iiOI4BChSnmxaC4QkvWcbNSMeNvWS7MsThK/A9tnaTUKfqmJ
 KninVeJ1a93q3IDdhDqcADWG3ZHbeiJ9NaG30U9RYiqpzO5F2ibM9YhUmqfxi7/mnJ4a
 H5P9byiHv+wcanRSx9bZhXHMMiTs8nknaTExkxFgfz62ch7y5cJFzkFlpwEh80tg/daU
 n5GtKHrAovkbD0bA0hkT0GDN+kn8X6T16UljZxUw7zUUtO7C5xNaunyt6hSURPmxlOT4
 bQHQ==
X-Gm-Message-State: AOAM531R3U4NGxvYmciQka+Ow4GCYOzC+3Yebs9laEeTtjisBAiNV5K4
 R3AraEQYJDViwpdfMvv2j/l2Og==
X-Google-Smtp-Source: ABdhPJxz5ow63QVYcQ7ZVnYOAiFkIr3Qiu5ibe3P+MFZpYZdBE70/w5FUyDOhyclm/L3LfmrOk4vKA==
X-Received: by 2002:a17:90b:3cf:b0:1d0:cdd4:9d0a with SMTP id
 go15-20020a17090b03cf00b001d0cdd49d0amr5903012pjb.187.1650480306320; 
 Wed, 20 Apr 2022 11:45:06 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 u25-20020aa78399000000b00505f75651e7sm20045925pfm.158.2022.04.20.11.45.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 11:45:05 -0700 (PDT)
Date: Wed, 20 Apr 2022 11:45:05 -0700
From: Kees Cook <keescook@chromium.org>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH 1/3] sched/headers: Fix compilation error with GCC 12
Message-ID: <202204201117.F44DCF9@keescook>
References: <20220414150855.2407137-1-dinechin@redhat.com>
 <20220414150855.2407137-2-dinechin@redhat.com>
 <Ylg73c83AJGwz9UN@hirez.programming.kicks-ass.net>
 <20220414133050.b820fa45d42de4cfc24db82b@linux-foundation.org>
 <20220417155205.GI2731@worktop.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220417155205.GI2731@worktop.programming.kicks-ass.net>
Cc: Juri Lelli <juri.lelli@redhat.com>, trivial@kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Zhen Lei <thunder.leizhen@huawei.com>,
 linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 virtualization@lists.linux-foundation.org, Ben Segall <bsegall@google.com>,
 Ingo Molnar <mingo@redhat.com>, Mel Gorman <mgorman@suse.de>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Christophe de Dinechin <dinechin@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Daniel Bristot de Oliveira <bristot@redhat.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>
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

On Sun, Apr 17, 2022 at 05:52:05PM +0200, Peter Zijlstra wrote:
> On Thu, Apr 14, 2022 at 01:30:50PM -0700, Andrew Morton wrote:
> > On Thu, 14 Apr 2022 17:21:01 +0200 Peter Zijlstra <peterz@infradead.org> wrote:
> > 
> > > > +/* The + 1 below places the pointers within the range of their array */
> > > >  #define for_class_range(class, _from, _to) \
> > > > -	for (class = (_from); class != (_to); class--)
> > > > +	for (class = (_from); class + 1 != (_to) + 1; class--)
> > > 
> > > Urgh, so now we get less readable code, just because GCC is being
> > > stupid?
> > > 
> > > What's wrong with negative array indexes? memory is memory, stuff works.
> > 
> > What's more, C is C.  Glorified assembly language in which people do odd
> > stuff.
> > 
> > But this is presumably a released gcc version and we need to do
> > something.  And presumably, we need to do a backportable something, so
> > people can compile older kernels with gcc-12.
> > 
> > Is it possible to suppress just this warning with a gcc option?  And if
> > so, are we confident that this warning will never be useful in other
> > places in the kernel?
> > 
> > If no||no then we'll need to add workarounds such as these?
> 
> -Wno-array-bounds

Please no; we just spent two years fixing all the old non-flexible array
definitions and so many other things fixed for this to be enable because
it finds actual flaws (but we turned it off when it was introduced
because of how much sloppy old code we had).

> Is the obvious fix-all cure. The thing is, I want to hear if this new
> warning has any actual use or is just crack induced madness like many of
> the warnings we turn off.

Yes, it finds real flaws. And also yes, it is rather opinionated about
some "tricks" that have worked in C, but frankly, most of those tricks
end up being weird/accidentally-correct and aren't great for long-term
readability or robustness. Though I'm not speaking specifically to this
proposed patch; I haven't looked closely at it yet.

I quickly went back through commits; here's a handful I found:

20314bacd2f9 ("staging: r8188eu: Fix PPPoE tag insertion on little endian systems")
dcf500065fab ("net: bnxt_ptp: fix compilation error")
5f7dc7d48c94 ("octeontx2-af: fix array bound error")
c7d58971dbea ("ALSA: mixart: Reduce size of mixart_timer_notify")
b3f1dd52c991 ("ARM: vexpress/spc: Avoid negative array index when !SMP")
a2151490cc6c ("drm/dp: Fix OOB read when handling Post Cursor2 register")
d4da1f27396f ("drm/dp: Fix off-by-one in register cache size")
47307c31d90a ("crypto: octeontx2 - Avoid stack variable overflow")
a6501e4b380f ("eeprom: at25: Restore missing allocation")
33ce7f2f95ca ("drm/imx: imx-ldb: fix out of bounds array access warning")
f051ae4f6c73 ("Input: cyapa_gen6 - fix out-of-bounds stack access")
f3217d6f2f7a ("firmware: xilinx: fix out-of-bounds access")
8a03447dd311 ("rtw88: fix subscript above array bounds compiler warning")
ad82a928eb58 ("s390/perf: fix gcc 8 array-bounds warning")
6038aa532a22 ("nvme: target: fix buffer overflow")
50a0d71a5d20 ("cros_ec: fix nul-termination for firmware build info")
43d15c201313 ("staging: rtl8822be: Keep array subscript no lower than zero")

The important part is that with this enabled now, we won't get _new_
problems introduced. Making the C code clear enough that the compiler
can understand the intent, though, can be a little annoying, but makes
things much easier to automatically check. Getting our code-base arranged
so the toolchain can actually do the analysis is well worth it.

-- 
Kees Cook
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
