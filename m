Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 355EB134146
	for <lists.virtualization@lfdr.de>; Wed,  8 Jan 2020 12:56:06 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id CF3898663C;
	Wed,  8 Jan 2020 11:56:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LKvlnQCV3efK; Wed,  8 Jan 2020 11:56:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3FE0386657;
	Wed,  8 Jan 2020 11:56:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2EAF1C0881;
	Wed,  8 Jan 2020 11:56:03 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B9175C0881
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Jan 2020 11:56:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id A2E22857F8
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Jan 2020 11:56:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kEzqW4PbYiY6
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Jan 2020 11:56:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 74EAD848FA
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Jan 2020 11:56:00 +0000 (UTC)
Received: from mail-lj1-f170.google.com ([209.85.208.170]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MGA0o-1iuivJ3GGq-00GXfa for <virtualization@lists.linux-foundation.org>;
 Wed, 08 Jan 2020 12:55:57 +0100
Received: by mail-lj1-f170.google.com with SMTP id w1so3029275ljh.5
 for <virtualization@lists.linux-foundation.org>;
 Wed, 08 Jan 2020 03:55:57 -0800 (PST)
X-Gm-Message-State: APjAAAXJZzpBNBdCBtqyA3jn3tFpY1ao6P2nysSoH55wXFvmaBrQFILa
 DvQyLx3EQAmzrhycncpmEmMgPemMuU2xv9+xgME=
X-Google-Smtp-Source: APXvYqx76A/E4Ch8oNBJvonZ2jianfqelDGhZdcoyIiElnwI+5tX58xf2+wQq15Hqyr3lM5AXUWKqh7e7QV64xZG5mc=
X-Received: by 2002:a2e:9095:: with SMTP id l21mr2608508ljg.175.1578484556968; 
 Wed, 08 Jan 2020 03:55:56 -0800 (PST)
MIME-Version: 1.0
References: <1578415992-24054-1-git-send-email-krzk@kernel.org>
 <CAMuHMdW4ek0OYQDrrbcpZjNUTTP04nSbwkmiZvBmKcU=PQM9qA@mail.gmail.com>
 <CAMuHMdUBmYtJKtSYzS_5u67hVZOqcKSgFY1rDGme6gLNRBJ_gA@mail.gmail.com>
 <CAJKOXPfq9vS4kSyx1jOPHBvi9_HjviRv0LU2A8ZwdmqgUuebHQ@mail.gmail.com>
 <2355489c-a207-1927-54cf-85c04b62f18f@c-s.fr>
 <CAK8P3a21yPrmp4ik3Ei1BZfeqZNf0wL5NZNF3uXqb4FLRDyUPw@mail.gmail.com>
 <20200108091549.GB10145@pi3>
In-Reply-To: <20200108091549.GB10145@pi3>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 8 Jan 2020 12:55:39 +0100
X-Gmail-Original-Message-ID: <CAK8P3a19ZgLhKJ016Mt_FyZrqnKaWwJyiaauMiUDAHV=DB9_2w@mail.gmail.com>
Message-ID: <CAK8P3a19ZgLhKJ016Mt_FyZrqnKaWwJyiaauMiUDAHV=DB9_2w@mail.gmail.com>
Subject: Re: [RFT 00/13] iomap: Constify ioreadX() iomem argument
To: Krzysztof Kozlowski <krzk@kernel.org>
X-Provags-ID: V03:K1:2PunY2zyZgR3dtDeMxCXMwAAAo0MTMenJMzx+mQdc5aha8knZnw
 pTDfQvGqmZ0uZpIP7gWKkkwbmZklpOIcDyL1xZV3lIXE5YqYZ8Hxa9/08vTJED7m5sa8rh6
 6aUDwYRdz1RUf8bKNqWWzbr311yBbsPsxgpKsWHoJQdYJlGGleP5mkR0Fhb5jAouuUR/xJh
 xfHEdrp64Vowzwo995opw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:kgtq+g1wZWA=:PJhG06G38WqbbnLjlnZj0f
 k5hPooCL/IdMbSxPXvJF1TjpmJ2dkWUsKjz9RWXI98bi3q+JnO2jv6RVy/o9zZK1bz5jo79na
 QX4GRSqhLRyQ6+iBE5aNCfex8DtZr6OH3FSEVpeG7zOsLmQlEHrBvhMGkJNzqzcBdKRVZEb5n
 aB4OUKCLMAE/fLX4lv/NJzniWwt8mMQ2d770D1CZZj+mj0/2GbXfJ2j3hm1j4dr7cTWOS61o+
 iEgqLxzeno08NDn195je6GVPWLGw7g1QEMmZjMG6j6Rek5uujFvtsfi1ZRxLRHTJvEey4d7gD
 O35nc8BcYT8O5G1/S1KwwZviJWjdqJJHR4wcGS3HhKkEEJdqGxP86ZZo9Z0v201UfwPeL8sdW
 9tAe+RQEXVrBKulSHInPJ1jlEeq4wYa/UZ6KFan0QIQiD4Q4yHfKjpnMy/IZZffN9cHAFxPjI
 5ZIMO9EOtlvwCujRVHNchI8RdxlS1hCjwa34Pag+gQhR49+Ni04cVvsWv+vHxeE2ghqssP2ab
 rjV2LkAzdqGrbL6Spt9QG0mYC/UyNv5IIqZmCV34Mrv1DExa9nETqgDseY3L3igZlXmC4ngI3
 sMZwekWOB6xyOFtq394YDTqfvMfI/lfZjEQJieJW/F5Pm6Df0z2o8JLoMlCT3rekWpH3RZk6U
 OwgEHdljg9za8FOig+jbHcojc+bxiswg4g9cZY48BHM4zVbgniFt/qCnsAjQ6n4BbnHR3xi8L
 QWfrdjuoLPk1er69zuU14xspaGtyzzkQTtdiO+t0IqEUnz5OzzMzwm5C1gHi6PvWiwps4rdEc
 ReykrIMgcrRGh5BWpwOTyRbgrcHihdQZxfMVO3a6i4QPNTQDb9AheT6LnuRvo+J/Q3tbrILXT
 1cbTCZbttQ1FiHn4oUIA==
Cc: Rich Felker <dalias@libc.org>, Jiri Slaby <jirislaby@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, David Airlie <airlied@linux.ie>,
 ML nouveau <nouveau@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Paul Mackerras <paulus@samba.org>, Linux-Arch <linux-arch@vger.kernel.org>,
 Dave Jiang <dave.jiang@intel.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Helge Deller <deller@gmx.de>, Linux-sh list <linux-sh@vger.kernel.org>,
 Alexey Brodkin <abrodkin@synopsys.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Ben Skeggs <bskeggs@redhat.com>,
 Dave Airlie <airlied@redhat.com>, Matt Turner <mattst88@gmail.com>,
 arcml <linux-snps-arc@lists.infradead.org>,
 Nick Kossifidis <mickflemm@gmail.com>, Allen Hubbe <allenbh@gmail.com>,
 Jon Mason <jdmason@kudzu.us>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Kalle Valo <kvalo@codeaurora.org>,
 Richard Henderson <rth@twiddle.net>,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Parisc List <linux-parisc@vger.kernel.org>, netdev <netdev@vger.kernel.org>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Vineet Gupta <vgupta@synopsys.com>,
 Daniel Vetter <daniel@ffwll.ch>, alpha <linux-alpha@vger.kernel.org>,
 linux-ntb@googlegroups.com, Andrew Morton <akpm@linux-foundation.org>,
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

On Wed, Jan 8, 2020 at 10:15 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:

> > The __force-cast that removes the __iomem here also means that
> > the 'volatile' keyword could be dropped from the argument list,
> > as it has no real effect any more, but then there are a few drivers
> > that mark their iomem pointers as either 'volatile void __iomem*' or
> > (worse) 'volatile void *', so we keep it in the argument list to not
> > add warnings for those drivers.
> >
> > It may be time to change these drivers to not use volatile for __iomem
> > pointers, but that seems out of scope for what Krzysztof is trying
> > to do. Ideally we would be consistent here though, either using volatile
> > all the time or never.
>
> Indeed. I guess there are no objections around const so let me send v2
> for const only.

Ok, sounds good. Maybe mention in the changelog then that the
'volatile' in the interface is intentionally left out, and that only users
of readl/writel still have it to deal with existing drivers.

    Arnd
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
