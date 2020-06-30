Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 802BB20FC80
	for <lists.virtualization@lfdr.de>; Tue, 30 Jun 2020 21:11:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 38AC58830D;
	Tue, 30 Jun 2020 19:11:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id touAHEddqLeh; Tue, 30 Jun 2020 19:11:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id B1CC688311;
	Tue, 30 Jun 2020 19:11:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 889B5C016E;
	Tue, 30 Jun 2020 19:11:56 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8D245C016E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 30 Jun 2020 19:11:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 7B84B8830D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 30 Jun 2020 19:11:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fbHFjO7jRJGc
 for <virtualization@lists.linux-foundation.org>;
 Tue, 30 Jun 2020 19:11:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
 by hemlock.osuosl.org (Postfix) with ESMTPS id CD4C4882B2
 for <virtualization@lists.linux-foundation.org>;
 Tue, 30 Jun 2020 19:11:52 +0000 (UTC)
Received: from mail-qv1-f41.google.com ([209.85.219.41]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MYNaE-1jL7OJ35MY-00VT1F for <virtualization@lists.linux-foundation.org>;
 Tue, 30 Jun 2020 21:11:49 +0200
Received: by mail-qv1-f41.google.com with SMTP id dm12so9788446qvb.9
 for <virtualization@lists.linux-foundation.org>;
 Tue, 30 Jun 2020 12:11:49 -0700 (PDT)
X-Gm-Message-State: AOAM533+5QnQCuFdI9V4e2dHyilEtNi/0kxwtAZrsj7+d0qR/YcJ96PH
 XQGGNZdykmjxQ1IqOCXkDUnb4OQTFPzsG9Zqj5w=
X-Google-Smtp-Source: ABdhPJy8Dn8rL1I0U5RYNNkDb6apYhSxF/cek48EVCvK4tcGtsr9BI41NIYfCMTIzNjQg3sijIRh8LwqEplBMOYW8s8=
X-Received: by 2002:a05:6214:846:: with SMTP id
 dg6mr20327019qvb.210.1593544308407; 
 Tue, 30 Jun 2020 12:11:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200630173734.14057-1-will@kernel.org>
 <20200630173734.14057-3-will@kernel.org>
In-Reply-To: <20200630173734.14057-3-will@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 30 Jun 2020 21:11:32 +0200
X-Gmail-Original-Message-ID: <CAK8P3a136e2k-iGoJ4X51mnj0f0KSLJKOw6b=s4F2QHHeyAMEQ@mail.gmail.com>
Message-ID: <CAK8P3a136e2k-iGoJ4X51mnj0f0KSLJKOw6b=s4F2QHHeyAMEQ@mail.gmail.com>
Subject: Re: [PATCH 02/18] compiler.h: Split {READ, WRITE}_ONCE definitions out
 into rwonce.h
To: Will Deacon <will@kernel.org>
X-Provags-ID: V03:K1:CUIbbfICcL5Btznld94914yuQ8x8Bym0/+tgJRbANuXN+hEgtWt
 frG85e9q3zY/pp5pSLnjmcG89kB9SRLGJSKQUMCmEIe556pxLPkJj1J/gbiYKodRMnDAWgp
 0WgzpJAI278IgMKSauLh8cDhWFTjwmN1nVygB6Zvu8JibjUfBDHj+vL4HNIfdN97TZSVyNv
 KHuZFfQH0qM935swyemIw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:FPVSr9GbCR0=:bd/XXbeQo3yHRHHMuTWbKN
 3OQffkNx0su4tbQwep4EOoRdw6sw7Tc+4RcdzCA+1Ce1esMOZWdIttPmyx2B3FxIwZQYqtTC1
 9jGlXexem9cEgy65DSKE+M4r0wsU4o7Gna4Qd7OZg8/bCtWc94B4v7aEcyVfbIAC0BdoytqEJ
 EIlTCiWnnjsDIP+i8OFnKVtbL0Pa8XCDWSmffYrsIz25loVYy5vw6GwaF5fFewq/Nxq+lRzEd
 9WMI94/L+4bPD8SfGTwUgL0qj1hRu0DiD8SuqN1PP1jbu1m8U/lSuEgjfw4saiZ81CNF4YrO5
 AZMNX8AyUwI1Q5nvECXYD8ZNie40mVbxcbV79q1L6xb/iWB+IjlTzExHSemuADRcvPI+4cf+R
 Vij9VxLum5peeNZtft0/e2fBeY6UM/GghK4Hw16BSZYCuigeTjnog0/keZKQ4dHFr0mJZE7FX
 1l3Qmvk8JxnYssgUeb15UIMTmTVI7OBSZ02G6SI3McwTeNz67/TSYrweeN2I8OrYJDTAFTdtG
 w69xBRN6lb+JluV+CH9PqS8h/W/FxSymJEF6an6gj2pXHZ7PNi1T7cJzx/VcZlBXwoqXeKk/6
 Xi4g16uDI9ZzWLhfOZJX5orzwd2R8zzJ7fOhPJQsgDKn41hFTJSfAtiEWMm47lVF9CAhy2sKM
 qBrNRdCjKke8b+cNyrtRmYa5egrAqWx0LZoyOg/iBX9sAt1pDBXzfj5Y57prjVz7H5IWw9WrQ
 OeKLd2O+kQlNxQQN0mUOH6OSs2+1jLKCXcewUjvRV238deIrgdVzzNT0Zr79hjj96JX881ClD
 4WgH2AQrCbLHJEFH0UrCQ7PxFv0TJ765AHy1SXfer2mQfZZYTw=
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

On Tue, Jun 30, 2020 at 7:37 PM Will Deacon <will@kernel.org> wrote:
>
> In preparation for allowing architectures to define their own
> implementation of the READ_ONCE() macro, move the generic
> {READ,WRITE}_ONCE() definitions out of the unwieldy 'linux/compiler.h'
> file and into a new 'rwonce.h' header under 'asm-generic'.
>
> Acked-by: Paul E. McKenney <paulmck@kernel.org>
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>  include/asm-generic/Kbuild   |  1 +
>  include/asm-generic/rwonce.h | 91 ++++++++++++++++++++++++++++++++++++
>  include/linux/compiler.h     | 83 +-------------------------------

Very nice, this has the added benefit of allowing us to stop including
asm/barrier.h once linux/compiler.h gets changed to not include
asm/rwonce.h.

The asm/barrier.h header has a circular dependency, pulling in
linux/compiler.h itself.

       Arnd
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
