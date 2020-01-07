Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id F33CA132CA8
	for <lists.virtualization@lfdr.de>; Tue,  7 Jan 2020 18:10:34 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 9F03020023;
	Tue,  7 Jan 2020 17:10:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UDsryzKpqzkD; Tue,  7 Jan 2020 17:10:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 6C25920337;
	Tue,  7 Jan 2020 17:10:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3E1E2C0881;
	Tue,  7 Jan 2020 17:10:32 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D8E2CC0881
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Jan 2020 17:10:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id D091E81A5C
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Jan 2020 17:10:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aGTXoKC8GZtC
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Jan 2020 17:10:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id AD74E841C9
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Jan 2020 17:10:28 +0000 (UTC)
Received: from mail-pl1-f169.google.com ([209.85.214.169]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MBUuP-1izYh30iAJ-00D2mx for <virtualization@lists.linux-foundation.org>;
 Tue, 07 Jan 2020 18:10:26 +0100
Received: by mail-pl1-f169.google.com with SMTP id x17so23447645pln.1
 for <virtualization@lists.linux-foundation.org>;
 Tue, 07 Jan 2020 09:10:25 -0800 (PST)
X-Gm-Message-State: APjAAAWyZ9B875/wQljicIkdUoo2j+WzS+qEk5dNS4mlvNSfO5O59gZd
 SGt9qVIDBiLr4IkPKff7EMMBGSRb0GqlWVgkN7s=
X-Google-Smtp-Source: APXvYqxwO5AyDQus85+IK5BIt7KfSsh7NvpnQb9bzWV5OgyrFYMfLh14xqWUd9CW/X7TSfP34I+W9RVMaa5KUvf/Vb8=
X-Received: by 2002:a0c:bd20:: with SMTP id m32mr365813qvg.197.1578417023930; 
 Tue, 07 Jan 2020 09:10:23 -0800 (PST)
MIME-Version: 1.0
References: <1578415992-24054-1-git-send-email-krzk@kernel.org>
 <1578415992-24054-9-git-send-email-krzk@kernel.org>
In-Reply-To: <1578415992-24054-9-git-send-email-krzk@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 7 Jan 2020 18:10:07 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1RibnRU6SiVjrOy-q+ZDdKacQgD9mrft_aHMgA9hm3PA@mail.gmail.com>
Message-ID: <CAK8P3a1RibnRU6SiVjrOy-q+ZDdKacQgD9mrft_aHMgA9hm3PA@mail.gmail.com>
Subject: Re: [RFT 06/13] arc: Constify ioreadX() iomem argument (as in generic
 implementation)
To: Krzysztof Kozlowski <krzk@kernel.org>
X-Provags-ID: V03:K1:2UHlR00xuOWfj2vTsFmwjKiB2qOGtIWypDmvTvgWn05gdNjjvgM
 z+4peVlTMAimnPLolao3y0fpvK+j6icYyGs448InjdrIiBfVjldiRfvFSTY0eT6wJ6qTI73
 QEA2JdgG0qy2MasCSCTopGj+451eEATQdxaeLgHCcvf4BTn3urwHRWSXp0p5nbGBzRiqyNO
 HfXuVHGH6jHw1N11Q0n2Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:o6hFB1S8G2E=:6eo2OMjUp3FXzSkaxH+Gh2
 BocifSfImC6ECIjdkTidgwzGB2yZxqWNyeLKCIlKQatd2qfD1RGukoHhOJeUUVjrws0l/je8h
 jLkNKbYSwEwZYJBwsEsgCOjKXv4PIrGGRpkfgUhNftDUtybqtEfup9ZGVL30L51yw9UmX9XF1
 gCVrl7pvfa6enkHXTrvPMLw91kY330QkUPfuNzRhpUQlgkk569MVO1O6eNFK2sIxUmiboaiu8
 r2krJa8EttY36cWKOyWyd4BBRreNZ2b9JYKcRfwmNMNzYFV9XOzDeTynKetqweoHKBIx3CuER
 nph8TLbdbXvLDV3P3iX9p+f1orv8B7VvrkGw4dc1do/hkSnU3OCqcFlURzQ0h5MVEVmjcRSDy
 Efuy58BHp8kEb5N7eOSWkDotlis8AQPmi0v/gBfYkfwKt2TkNu/o0FPaSf8KRyqHj1/dzHVpZ
 q8QswB9DOrkbp3VAhcZjMSG5eSkGGErwbDt1y4M4dIi5CL3/4lYkqIsO4JbBFsG9DKgBPt5Cz
 xYuV1haatJWL/Mbe9YoFgi6Y91gb2m0PjO7LfD2sVlpPhWfmJofV0RzKIyaQgLfH+04dDgxTh
 6sJtgAKuZoiNo59XPitIcYq8cNXTYQ51q3OpHBo91qhO1qMxaDd2+b1j48d/LDAjvnOJN4Hii
 rN0B/ewZe8u9dyGyClxcdk6dcwp/HXtNfwYP/6L75lZJUAnVSXuQpqXN7TIcid2Ky2PEmVl9W
 PrezZcKa23jVcEMPpee7FalTl1wyXb02GxONEEeK0syWf3h9ntwlBKS/5do0Fsi+jRRmUmTOq
 K4tvzxtaXBovI5na93/4sB5sb3oP+Fxr2W/RGXpUniOpcJxn2EKjH0x7TdPtKZl9Ya8A1Y9fY
 YgHbLI2eFSszwFKx0U5w==
Cc: Rich Felker <dalias@libc.org>, Jiri Slaby <jirislaby@gmail.com>,
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
 Alexey Brodkin <abrodkin@synopsys.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Ben Skeggs <bskeggs@redhat.com>,
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
 Andrew Morton <akpm@linux-foundation.org>,
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

On Tue, Jan 7, 2020 at 5:54 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> The ioreadX() helpers have inconsistent interface.  On some architectures
> void *__iomem address argument is a pointer to const, on some not.
>
> Implementations of ioreadX() do not modify the memory under the
> address so they can be converted to a "const" version for const-safety
> and consistency among architectures.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

The patch looks correct, but I would not bother here, as it has no
effect on the compiler or its output.

      Arnd
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
