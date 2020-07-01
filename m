Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6092109DF
	for <lists.virtualization@lfdr.de>; Wed,  1 Jul 2020 13:00:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id EF2EB8953A;
	Wed,  1 Jul 2020 11:00:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QtUdUGde5HMk; Wed,  1 Jul 2020 10:59:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 504598953B;
	Wed,  1 Jul 2020 10:59:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 39DCCC0733;
	Wed,  1 Jul 2020 10:59:59 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 08179C0733
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Jul 2020 10:59:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id E51CC8AB39
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Jul 2020 10:59:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S6swK-QvwCAT
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Jul 2020 10:59:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 468548AB31
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Jul 2020 10:59:55 +0000 (UTC)
Received: from mail-qk1-f170.google.com ([209.85.222.170]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MK3eI-1jW9w72a7S-00LaAZ for <virtualization@lists.linux-foundation.org>;
 Wed, 01 Jul 2020 12:59:53 +0200
Received: by mail-qk1-f170.google.com with SMTP id z63so21657993qkb.8
 for <virtualization@lists.linux-foundation.org>;
 Wed, 01 Jul 2020 03:59:53 -0700 (PDT)
X-Gm-Message-State: AOAM531x0Yyh7SnfgdBUP4atyhMsP3LnprA/mhwTf2RLFF8KTFhqj0oW
 U1hlKkWe6I1qfz0N7gMxHNU0pGSNWl2Eksii+bQ=
X-Google-Smtp-Source: ABdhPJztc8Rs2Aj01FvDlsDy8FiXAWwus7EMwqiq3oxxcJK+edsUbi5amD2c/ikaFMMy81wZESqitxpCJ/9YRg9OP74=
X-Received: by 2002:a37:9dd6:: with SMTP id
 g205mr25404833qke.352.1593601192134; 
 Wed, 01 Jul 2020 03:59:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200630173734.14057-1-will@kernel.org>
 <20200630173734.14057-19-will@kernel.org>
 <CAK8P3a2zB4z121reuy6BCqQ3-1mDBAkUkRRXeDuvSFtSr3ha2g@mail.gmail.com>
 <20200701101922.GC14959@willie-the-truck>
In-Reply-To: <20200701101922.GC14959@willie-the-truck>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 1 Jul 2020 12:59:36 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1MWBxHihcUaduqcpS2U61cKPujQG6mAfn3-pCokzLwUw@mail.gmail.com>
Message-ID: <CAK8P3a1MWBxHihcUaduqcpS2U61cKPujQG6mAfn3-pCokzLwUw@mail.gmail.com>
Subject: Re: [PATCH 18/18] arm64: lto: Strengthen READ_ONCE() to acquire when
 CLANG_LTO=y
To: Will Deacon <will@kernel.org>
X-Provags-ID: V03:K1:ltRGNmv7ggw4SxX/DzfBrinJv6B3JvEZajy+HNeaqQEBQPfJZWQ
 NmBJtF1k/z4pj4+M2rvJUXQx2MQ9nuDsybJYesN2FO/ilEWIJSmPmz3kDhKrEt2Xul6b0rk
 HusS2B1Pm0CvDUneEeOmrj716NTOucbSTcaV5aM/qCZLn2K3tuOaPjkMjYkp4ig7NS7IKyc
 tr6zNjH2Nt5vvGkZ/TxRQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Z0wzhMTw81Y=:FeDPtg5YM1Iy2Vx5H1L1C+
 hpG4Gp+Aj4gaOVT5sGJ1qR87/0AIxsoL24I34dPQ8qgXdvKZjnVtaOr0QNXr0kfQRfsNJ4Xre
 YFP2pg8AO9fNa9CcxUwzFk+HvuaW9BB9au4prTKELuhaf9oybtRiiDBWS2kOdBmPuR3/t/wq2
 zTx4gAEGZoW3QaQ3bocI5Q7cvHCXwR39gjuXOvEvRslDg+1cZxSILavMYVXsW8scRs1dueeRZ
 9v56BV95QxeLmYO7g9QoLmCg+4YwlCgVH3Vo0ONGJ5HN5BdfD6Gz/8m/wKB4/5rtnRvHJMjw8
 AE+HDH1g73aAGcfwxfk9tnBteZysTTAXa9l6B3jL3mye6HPC0ber2MPv0igTTCRFrHIENu+m4
 bI8OCFpbuDIj053DNwqhalfCZzb4mfx6iGpzKTQiaDObF3VPKwOuIVpHhG//9jGCs22cytIhR
 3/eup7msTfR4N3ppNerR01l+bjiSS1/86i1nfplGR988Jx+MA9CXWgFKk/U4TpRch1ZKih7Oa
 FT+tdk0UiVkWxk9phiFg6o3T+s57+x4JF8UQOgHLI5MkkLMuvqWmQ7jI39loyPyMOW0Za52Ux
 S7Q665vQgfqx9f1YNhOBtsDJc8yZdRbGfXVpwRqMgF8oydQ83N1S5UTrXME5REDPaRuy8nm3y
 BXnvptNaNn1pma8UyDjjmp7INpMc7RKDEZO7+eJ3aIm+MNT74jdra8G8ZPwmvB4xH65n1rest
 8HrUNuWcg6Gr+DWcwhjupdRPi8+9qjpAKgvhtlR6Wzdrn1z0r4ZEj+VfG0opaIkyiyzo55s08
 jkHwxcFLjGxRpQlWnabA9NrC4T0R5+Hl1YaNKmOk49UJEqArPl73AnYfqgNK4/dVUbhR6Dose
 J8nzzzXc1E2BUMQ2xCJ8uc5Z9P32EjTt3/eWTZdOBTjsa1FmIsQYU+wWiS2O0JUGHqqaGRJDb
 M3Ov3JOZ++eN860s0QUzMVFWIAR+40pMeOSIMOUMdTERbK3ibCZiI
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

On Wed, Jul 1, 2020 at 12:19 PM Will Deacon <will@kernel.org> wrote:
> On Tue, Jun 30, 2020 at 09:25:03PM +0200, Arnd Bergmann wrote:
> > On Tue, Jun 30, 2020 at 7:39 PM Will Deacon <will@kernel.org> wrote:
> > Once we make gcc-4.9 the minimum version,
> > this could be further improved to
> >
> >        __auto_type __x = &(x);
>
> Is anybody working on moving to 4.9? I've seen the mails from Linus
> championing it, but I thought there was a RHEL in support that people
> might care about?

I don't think there was a serious discussion about it so far, and
we only just moved to gcc-4.8.

I think moving to gnu11 (gcc-4.9 or clang) instead of gnu99 has other
benefits as well, so we may well want to do it anyway when something
else comes up.

For __auto_type(), we could do it like

#if (clang or gcc-4.9+)
#define auto_typeof(x) __auto_type
#else
#define auto_typeof(x) typeof(x)
#endif

which could be used in a lot of macros.

     Arnd
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
