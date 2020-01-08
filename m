Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4E4134E08
	for <lists.virtualization@lfdr.de>; Wed,  8 Jan 2020 21:54:26 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id ED68220788;
	Wed,  8 Jan 2020 20:54:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B7AFOCSauVhe; Wed,  8 Jan 2020 20:54:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 835E52078C;
	Wed,  8 Jan 2020 20:54:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 582A3C0881;
	Wed,  8 Jan 2020 20:54:21 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4847FC0881
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Jan 2020 20:54:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 30C6281EAD
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Jan 2020 20:54:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Hn4nvKFSx+GK
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Jan 2020 20:54:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
 by whitealder.osuosl.org (Postfix) with ESMTPS id DACCF842B8
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Jan 2020 20:54:17 +0000 (UTC)
Received: from mail-pl1-f169.google.com ([209.85.214.169]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MIx7U-1j8U9c2Zic-00KRzN for <virtualization@lists.linux-foundation.org>;
 Wed, 08 Jan 2020 21:54:14 +0100
Received: by mail-pl1-f169.google.com with SMTP id s21so1600169plr.7
 for <virtualization@lists.linux-foundation.org>;
 Wed, 08 Jan 2020 12:54:14 -0800 (PST)
X-Gm-Message-State: APjAAAU94MFLqIzFuVxufaqi0xcwUJQuMPuTsqy8MWJP+OfKMTUgF3TP
 nKqLeQIdMsqatty+CU5MqtAw77n1nceZixajYO8=
X-Google-Smtp-Source: APXvYqyt7qWPMbb6m9h/4PQhRs0y159Kx6Uivm6Z+B5Q5nxhhZUKK+jBierZEh41gZgxiLkvgkWmKuzOcUQAJHTJ9Lg=
X-Received: by 2002:a0c:bd20:: with SMTP id m32mr5946876qvg.197.1578516850954; 
 Wed, 08 Jan 2020 12:54:10 -0800 (PST)
MIME-Version: 1.0
References: <20200108200528.4614-1-krzk@kernel.org>
 <20200108200528.4614-2-krzk@kernel.org>
In-Reply-To: <20200108200528.4614-2-krzk@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 8 Jan 2020 21:53:54 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2ieH2G5GJvWMev39QkmSFvWSb0sYZ_0L5McR6AZFiayA@mail.gmail.com>
Message-ID: <CAK8P3a2ieH2G5GJvWMev39QkmSFvWSb0sYZ_0L5McR6AZFiayA@mail.gmail.com>
Subject: Re: [PATCH v2 1/9] iomap: Constify ioreadX() iomem argument (as in
 generic implementation)
To: Krzysztof Kozlowski <krzk@kernel.org>
X-Provags-ID: V03:K1:I0oiZmJJ87k+ZzE4YWRvBW7jnpP+8Hr3FPJPLT2mPBpf63AvLwA
 PuEjC+8MOVmEmSqxQxhcz6wn6nuKo56mvD1reTPSV+q78CsGAvU06ORyhKQSWo7XmfA4KMm
 0JqgfnmDo/5vgni85EmcpW5NzGfpGPUtdSngnxJuSOgjQeQBSNA6QpfodgzoTk6xiMn0j64
 1pny2+Mn7550QxtwH5g4w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:2/1atkzpnAo=:3pfyYgvDEvDEF215TK2tHc
 t/3iX9+9sIJtW/boQfh5JstCcmfKQnSp/rpg7Uwd5uW7Fk0xzsWYgnGK3Xe6qwIN62iCogKnV
 Nh8cw4alAPboyAn19C6LPRCckTHuUKDt8JXjTewZzUXRBHjTG6IQK39R+nH/PGqpOGpu1x4e7
 hdopu/Ix1AZc+0eQ1QkcVmRBT6l416LpYONoHbj7OgtX8fllT5eYZY6Dxz0larKGm7GBp/T0W
 bBXF3uJPUIlftr8jlsvKpl9JmRc3gyBM59hfEpoK089M2W9/IlOXXIJRhuq1ceAIJOREwObsI
 stLLzWuQYgaE7B/TkgBYe4lFvGEcoAp99CqWLmpWfvZNOk4mNmlZ5sW8OkcdIdMG1+rsFqvsR
 +ACmtk+hR9VRolzJTzlBbI6xyz61vXPOiJqCMxj+mT+5+KJzGcgFd8eFnIRMQzQKMWNcrzSb6
 WiRe5HtMpS04ndvDopzZsHAfJcmPmvB2mRh2AgMJozDY19lWKRmTIsdGzdFZfuKK0vKMTQqLJ
 iusXROC+OaGoWvwkpBwcL5jN4jZzCsQm5fTItyHSPb4FbG9cd/zuTOeeka/lwWxRfOHqsGGqY
 dzE3hKH+iW/Jn/mbt7RIaWBUATDlk+4i+mxkx60QbqUDFn9+duGN9Eyfn4Ldik54YIR5tS7ML
 pve6vEsP00Mar0voQAwfN6YToaFaRUwEtGEwZnN944cMBILm7tS/EqVyaqMpms7BceZtv/Y8A
 MULi4pazC7izyFiv1BTO/SyUoH+ESgSc7WjUVHIUCqG5G5cFGRvyorgcsqWuqeRt2t0B8q0RW
 nSXMy54v/W2aLDJws5vdCkSoHh+QTmdaaVX4Pq+EJ5OYUoA63g4sqosVgdd4NpqXLLHLk6ZKK
 ggsDl+oMa0v1/HrVUSgw==
Cc: Rich Felker <dalias@libc.org>, Jiri Slaby <jirislaby@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 "Michael S. Tsirkin" <mst@redhat.com>, David Airlie <airlied@linux.ie>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Networking <netdev@vger.kernel.org>, Paul Mackerras <paulus@samba.org>,
 linux-arch <linux-arch@vger.kernel.org>, Dave Jiang <dave.jiang@intel.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>,
 Linux-sh list <linux-sh@vger.kernel.org>,
 Alexey Brodkin <abrodkin@synopsys.com>, Ben Skeggs <bskeggs@redhat.com>,
 ML nouveau <nouveau@lists.freedesktop.org>, Dave Airlie <airlied@redhat.com>,
 Matt Turner <mattst88@gmail.com>,
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 Nick Kossifidis <mickflemm@gmail.com>, Allen Hubbe <allenbh@gmail.com>,
 alpha <linux-alpha@vger.kernel.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Kalle Valo <kvalo@codeaurora.org>,
 Richard Henderson <rth@twiddle.net>,
 Parisc List <linux-parisc@vger.kernel.org>, Vineet Gupta <vgupta@synopsys.com>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Jon Mason <jdmason@kudzu.us>, linux-ntb@googlegroups.com,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
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

On Wed, Jan 8, 2020 at 9:05 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> The ioreadX() and ioreadX_rep() helpers have inconsistent interface.  On
> some architectures void *__iomem address argument is a pointer to const,
> on some not.
>
> Implementations of ioreadX() do not modify the memory under the address
> so they can be converted to a "const" version for const-safety and
> consistency among architectures.
>
> Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks for getting this done!

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

> Changes since v1:
> 1. Constify also ioreadX_rep() and mmio_insX(),
> 2. Squash lib+alpha+powerpc+parisc+sh into one patch for bisectability,

The alpha and parisc versions should be independent, I was thinking
you leave them as separate patches, but this work for me too.

I have no real opinion on the other 8 patches, I would have left
them out completely, but they don't hurt either.

         Arnd
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
