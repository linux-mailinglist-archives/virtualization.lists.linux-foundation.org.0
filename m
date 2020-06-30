Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id E266720FCBC
	for <lists.virtualization@lfdr.de>; Tue, 30 Jun 2020 21:25:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 3EB94228D1;
	Tue, 30 Jun 2020 19:25:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QGxbZkFCOg9c; Tue, 30 Jun 2020 19:25:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 8EC09228A7;
	Tue, 30 Jun 2020 19:25:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 68494C016E;
	Tue, 30 Jun 2020 19:25:28 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DDCA2C016E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 30 Jun 2020 19:25:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id C445A8868D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 30 Jun 2020 19:25:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XSmjJar9S7sm
 for <virtualization@lists.linux-foundation.org>;
 Tue, 30 Jun 2020 19:25:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 157EE88600
 for <virtualization@lists.linux-foundation.org>;
 Tue, 30 Jun 2020 19:25:23 +0000 (UTC)
Received: from mail-qv1-f41.google.com ([209.85.219.41]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MIdNt-1jdzwT429V-00EaeW for <virtualization@lists.linux-foundation.org>;
 Tue, 30 Jun 2020 21:25:21 +0200
Received: by mail-qv1-f41.google.com with SMTP id e3so3505864qvo.10
 for <virtualization@lists.linux-foundation.org>;
 Tue, 30 Jun 2020 12:25:20 -0700 (PDT)
X-Gm-Message-State: AOAM531aMQQBbQMCH9Z3wOa1c3gKh260OfAXlHJTYbnvl0zib+HKaWra
 maqFD3eo1BxIzT/SAYXJrupYrkzmMZnVtCq80vE=
X-Google-Smtp-Source: ABdhPJx+lRE51JRL6fCvRnoLPfTGDuD4BIZlGSJkoIdVSw7mHYOQQlzJvl0jgp7ZS50oAcVKQOmUzXKXW4PZLLmEroY=
X-Received: by 2002:a0c:ba0e:: with SMTP id w14mr21638836qvf.222.1593545119567; 
 Tue, 30 Jun 2020 12:25:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200630173734.14057-1-will@kernel.org>
 <20200630173734.14057-19-will@kernel.org>
In-Reply-To: <20200630173734.14057-19-will@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 30 Jun 2020 21:25:03 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2zB4z121reuy6BCqQ3-1mDBAkUkRRXeDuvSFtSr3ha2g@mail.gmail.com>
Message-ID: <CAK8P3a2zB4z121reuy6BCqQ3-1mDBAkUkRRXeDuvSFtSr3ha2g@mail.gmail.com>
Subject: Re: [PATCH 18/18] arm64: lto: Strengthen READ_ONCE() to acquire when
 CLANG_LTO=y
To: Will Deacon <will@kernel.org>
X-Provags-ID: V03:K1:9EnBVfWeAz8cUrX3dB2qQB+V6W9w39r1xqOv9MUzDW/miBH8tY3
 eeHVjtlOvR7lLlr9/X2HJdYa9iM0hDa8TrhMaLiWFlynKlCoblMRJsSx/7LFSns1kag73iU
 UjCAYekGbr4U0/o6U4L92n/le9b+WOX3SFSi3SAwbp3ReZ9yCFwnUuWiWaPFNy997S955v5
 i1hkkW3rMbv+AXA+uudyg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:7TFBBmM/PB8=:YmmT/Tn9GtfH4Xg1eI3xFj
 N4XkXxiU8B0KAFQ7vBoDgx7LWauD4dL5FWearkD+gQGmcl0UNhGrZj9RpzZVihGW7kjI0Zpqa
 hPg+YzA/mLwIoa9SDED/JqhSbV2AtgixKqK5N4ujOKlYMV9C/l5ZJcb3Bw5Xt2PL+ir01BTh0
 JoQ5dgWrKyKydefp1nr3CZw+gV3LkYoEm6Eb+0XlAy36lo2kiLIISzUsNPxoIWtkQeYMeCuBW
 I86UkaKGOLY9a+p0/cWP/RepGe38s67komP2oiDTQfoU2sM/UgrC1aCUyZdFF83W3ZmutPvIn
 qhk8ez1O25kx5fUVt5zIcoh9e1SYLcQTLhmXzQkGjb7uHYVCxh/MRPoJE5seVnbLEQybangSd
 +Nh2VFcWdwCKNL8/JKoZs2SdfnChJ6eFwAK0E+TWH+y0FmIEbusqSxCroca4jU4aZ6qAuFJeR
 GS6wXY13I00+AtFimAycBr7YVVrETOPwmcEHNoa4TI3YHDKuZ35/XTJkPNt977DRgC4+9+xcK
 f/XZE3ut0bvmAw/muhNgzAsr9r8JF3TBlGGPTXwwLUHYv6Ak6coqac+sD+jwfa+SJ2ctMwuSK
 sg9SwYhDXJyDUgiMDuqjkDTzrLlqsiziMgPeC4DZB4V67rNApAbjKO+/lqOljhrg+dWexI4rl
 4pcs4TSYhL5tGyP2XXxtaZflV9IB2UtU3N+a5b3O27H7o6BO2aqsg+XTNQRtuZkr3afUZ8vCt
 iaOSFX3mfIxGSN3ulLi6y96RpVurTvswZlA0HHS9AI2Cm20mwtxhQJbHq5wg02OAcwPI56vQc
 blpNEa35NzBBAJGtKwlvH2O0gUrRbW1pxzUKsrgmxlsjDT1rVg=
Cc: Mark Rutland <mark.rutland@arm.com>, Marco Elver <elver@google.com>,
 Kees Cook <keescook@chromium.org>, "Paul E. McKenney" <paulmck@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Nick Desaulniers <ndesaulniers@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Josh Triplett <josh@joshtriplett.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Sami Tolvanen <samitolvanen@google.com>, alpha <linux-alpha@vger.kernel.org>,
 Alan Stern <stern@rowland.harvard.edu>, Matt Turner <mattst88@gmail.com>,
 virtualization@lists.linux-foundation.org,
 Android Kernel Team <kernel-team@android.com>,
 Boqun Feng <boqun.feng@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Richard Henderson <rth@twiddle.net>
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

On Tue, Jun 30, 2020 at 7:39 PM Will Deacon <will@kernel.org> wrote:
> +#define __READ_ONCE(x)                                                 \
> +({                                                                     \
> +       int atomic = 1;                                                 \
> +       union { __unqual_scalar_typeof(x) __val; char __c[1]; } __u;    \
> +       typeof(&(x)) __x = &(x);                                        \
> +       switch (sizeof(x)) {                                            \
...
> +       atomic ? (typeof(x))__u.__val : (*(volatile typeof(x) *)__x);   \
> +})

This expands (x) nine times (five in __unqual_scala_typeof()), which can
lead to significant code bloat after preprocessing if something passes a
compound expression into READ_ONCE().
The compiler works it out eventually, but we've seen an actual slowdown
in compile speed from this recently, especially on clang.

I think if you move the

        typeof(&(x)) __x = &(x);

line first, all other instances can use typeof(*__x) instead of typeof(x)
and avoid this problem. Once we make gcc-4.9 the minimum version,
this could be further improved to

       __auto_type __x = &(x);

       Arnd
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
