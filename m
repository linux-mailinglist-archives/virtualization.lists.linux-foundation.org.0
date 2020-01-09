Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id D08C81358B5
	for <lists.virtualization@lfdr.de>; Thu,  9 Jan 2020 13:00:57 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5DC5686352;
	Thu,  9 Jan 2020 12:00:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y805N9fuAIaj; Thu,  9 Jan 2020 12:00:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1444B86341;
	Thu,  9 Jan 2020 12:00:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F01A3C0881;
	Thu,  9 Jan 2020 12:00:54 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 86082C0881
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Jan 2020 12:00:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 7ED0487BEE
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Jan 2020 12:00:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8+BcI4lKdFnE
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Jan 2020 12:00:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 8F8D688075
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Jan 2020 12:00:52 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id 13so3735238oij.13
 for <virtualization@lists.linux-foundation.org>;
 Thu, 09 Jan 2020 04:00:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nZfyuOmXpaLxOTcihxRatR1N5b6cV8bkVUYtr9LoScQ=;
 b=TTyf2cDJnfabK8aLFJi0dGIKDeGajzc7p6SqGxUWifreQogHOffPHPYutJAT/wOE9j
 eRXKt47BdNgx69bVM4RByKxg4Zfp7+VriLpX2FsAb07f6K216Tqd+SPPkrX0iQb6NFdc
 bVNwq35Zz+PY/o+y+Gk/g/dKKMBChkjw7Zq+vLdlTWQ3qCGPV3ozPX58fd2ElafSMqgd
 ywbyVy1KQGuy2T4BU0bgnqB0Ya/OvBYBldsClLfsKKihsZ+1klCMn6oCa40iy2WQTHaN
 UqrCLEOxLF92pog3eRKEJlP+JYJorWkP9y1B/jU42rw7ggzVsqtReDF7hW0bXZMyiCYq
 AR1Q==
X-Gm-Message-State: APjAAAWt1tV0vPqAbfCYdT5lNZcIqgaZ0mIxOmV3oJA/UhcHNqnAn5E0
 O8p7mTJ8LjVMkBNc2nlUrJdFigjKwVkE5iy5D8U=
X-Google-Smtp-Source: APXvYqx2rj2SeSvboe2k3ZgItcDXoEvkOpB0Do773ErXMGvWblx7KEY69OGBF2+yLrNaZ+Tob+6Upx4TfamT+URhRjM=
X-Received: by 2002:aca:eb83:: with SMTP id j125mr2637148oih.153.1578571251757; 
 Thu, 09 Jan 2020 04:00:51 -0800 (PST)
MIME-Version: 1.0
References: <20200108200528.4614-1-krzk@kernel.org>
 <20200108200528.4614-2-krzk@kernel.org>
In-Reply-To: <20200108200528.4614-2-krzk@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 9 Jan 2020 13:00:40 +0100
Message-ID: <CAMuHMdV8NYiq0744EGw2zit7DZc5=rOpL7en_NeCx2GTD3F3ZQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/9] iomap: Constify ioreadX() iomem argument (as in
 generic implementation)
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rich Felker <dalias@libc.org>, Jiri Slaby <jirislaby@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 "Michael S. Tsirkin" <mst@redhat.com>, David Airlie <airlied@linux.ie>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 netdev <netdev@vger.kernel.org>, Paul Mackerras <paulus@samba.org>,
 Linux-Arch <linux-arch@vger.kernel.org>, Dave Jiang <dave.jiang@intel.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>,
 Linux-sh list <linux-sh@vger.kernel.org>,
 Alexey Brodkin <abrodkin@synopsys.com>, Ben Skeggs <bskeggs@redhat.com>,
 nouveau@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>,
 Matt Turner <mattst88@gmail.com>, arcml <linux-snps-arc@lists.infradead.org>,
 Nick Kossifidis <mickflemm@gmail.com>, Allen Hubbe <allenbh@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, alpha <linux-alpha@vger.kernel.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Kalle Valo <kvalo@codeaurora.org>,
 Richard Henderson <rth@twiddle.net>,
 Parisc List <linux-parisc@vger.kernel.org>, Vineet Gupta <vgupta@synopsys.com>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
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

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
