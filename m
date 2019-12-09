Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 153DC116798
	for <lists.virtualization@lfdr.de>; Mon,  9 Dec 2019 08:40:24 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9373E87645;
	Mon,  9 Dec 2019 07:40:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xKXstAPzCxiv; Mon,  9 Dec 2019 07:40:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4DC2E875C7;
	Mon,  9 Dec 2019 07:40:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 23930C0881;
	Mon,  9 Dec 2019 07:40:21 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 24A99C0881
 for <virtualization@lists.linux-foundation.org>;
 Mon,  9 Dec 2019 07:40:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 0DD428820B
 for <virtualization@lists.linux-foundation.org>;
 Mon,  9 Dec 2019 07:40:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vxl+yf7asvkW
 for <virtualization@lists.linux-foundation.org>;
 Mon,  9 Dec 2019 07:40:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 0492887C7D
 for <virtualization@lists.linux-foundation.org>;
 Mon,  9 Dec 2019 07:40:17 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id 66so11362581otd.9
 for <virtualization@lists.linux-foundation.org>;
 Sun, 08 Dec 2019 23:40:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FPK1maUM55Gi6p6kYw8RySJ9yGFpidLuP0EhKQwUZt0=;
 b=aSrCT5/WOsg/91MpCNACDjZ40v/n6Nk2ZGRE96ZdcoZzdaYj8Li9OiVk5uodaQKt1S
 I/A+AxoED7Fbi27g/EAS37sCQy8oAXGgR4GChdmExz+yhIvzHeK8D3nAcMcqfw3F2fLp
 NutTqJHLl6BxYwAQnOrI5seX/CITWPGUvhVW7oSDLg1wfbaxotaNIHK0+y96ZK/a8DrT
 I8AuOvilP15NrRkLCyIkhqqRb/U2jspIHv5enkvbttPg+HCBYvr9LM1NNG/IfKAFTvJP
 7obaVaCMtekyS1EdrAUhm7qC5Wdmj6h8qfFrZBFuDGaO+3hT/GAsW1/38xnevoHoHAGR
 T89A==
X-Gm-Message-State: APjAAAVxqQR4nLkJ2e8sAJeRpfw+qOmcA6Z5cOPzbyPGG0UfTh4UkByC
 u1AypYKN0HvFD34uRJx4bvvmaW6IjNon+rvh8j8=
X-Google-Smtp-Source: APXvYqxnnTSYYLFHYr/PZKJtreFRDO2OI11O4NLAJMeK4zbXArJ/fD3O2OflqrT+cACovE3JpEFWmclImrX5h6naz84=
X-Received: by 2002:a05:6830:91:: with SMTP id
 a17mr19172583oto.107.1575877217104; 
 Sun, 08 Dec 2019 23:40:17 -0800 (PST)
MIME-Version: 1.0
References: <20191203201804.662066-1-mst@redhat.com>
 <20191203201804.662066-2-mst@redhat.com>
In-Reply-To: <20191203201804.662066-2-mst@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 9 Dec 2019 08:40:06 +0100
Message-ID: <CAMuHMdXDm0NiCk1pD_-wS9c-ErmRKkrqnPc_pGKzG=QB35mj9A@mail.gmail.com>
Subject: Re: [PATCH RFC net-next v8 1/3] netdev: pass the stuck queue to the
 timeout handler
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: dnmendes76@gmail.com, Jakub Kicinski <jakub.kicinski@netronome.com>,
 netdev <netdev@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 virtualization@lists.linux-foundation.org,
 Martin Habets <mhabets@solarflare.com>, Julio Faracco <jcfaracco@gmail.com>,
 Shannon Nelson <snelson@pensando.io>, "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
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

Hi Michael,

On Tue, Dec 3, 2019 at 9:21 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> This allows incrementing the correct timeout statistic without any mess.
> Down the road, devices can learn to reset just the specific queue.
>
> The patch was generated with the following script:

[...]

> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

> --- a/drivers/net/ethernet/8390/8390p.c
> +++ b/drivers/net/ethernet/8390/8390p.c
> @@ -41,9 +41,9 @@ void eip_set_multicast_list(struct net_device *dev)
>  }
>  EXPORT_SYMBOL(eip_set_multicast_list);
>
> -void eip_tx_timeout(struct net_device *dev)
> +void eip_tx_timeout(struct net_device *dev, unsigned int txqueue)
>  {
> -       __ei_tx_timeout(dev);
> +       __ei_tx_timeout(dev, txqueue);
>  }
>  EXPORT_SYMBOL(eip_tx_timeout);

On Mon, Dec 9, 2019 at 6:37 AM <noreply@ellerman.id.au> wrote:
> FAILED linux-next/m68k-defconfig/m68k Mon Dec 09, 16:34
>
> http://kisskb.ellerman.id.au/kisskb/buildresult/14060060/
>
> Commit:   Add linux-next specific files for 20191209
>           6cf8298daad041cd15dc514d8a4f93ca3636c84e
> Compiler: m68k-linux-gcc (GCC) 4.6.3 / GNU ld (GNU Binutils) 2.22
>
> Possible errors
> ---------------
>
> drivers/net/ethernet/8390/8390p.c:44:6: error: conflicting types for 'eip_tx_timeout'
> drivers/net/ethernet/8390/8390p.c:48:1: error: conflicting types for 'eip_tx_timeout'
> make[5]: *** [scripts/Makefile.build:266: drivers/net/ethernet/8390/8390p.o] Error 1
> make[4]: *** [scripts/Makefile.build:503: drivers/net/ethernet/8390] Error 2
> make[3]: *** [scripts/Makefile.build:503: drivers/net/ethernet] Error 2
> make[2]: *** [scripts/Makefile.build:503: drivers/net] Error 2
> make[1]: *** [Makefile:1693: drivers] Error 2
> make: *** [Makefile:179: sub-make] Error 2

Looks like you forgot to update the forward declaration in
drivers/net/ethernet/8390/8390.h

There may be others...
http://kisskb.ellerman.id.au/kisskb/head/6cf8298daad041cd15dc514d8a4f93ca3636c84e/

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
