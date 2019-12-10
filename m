Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F06118ACB
	for <lists.virtualization@lfdr.de>; Tue, 10 Dec 2019 15:27:39 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9AC5384EA0;
	Tue, 10 Dec 2019 14:27:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d4Bz4F54Y4yi; Tue, 10 Dec 2019 14:27:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0AC9A84E2E;
	Tue, 10 Dec 2019 14:27:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E955BC0881;
	Tue, 10 Dec 2019 14:27:37 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7E729C0881
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Dec 2019 14:27:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 6A7BE84103
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Dec 2019 14:27:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YFw7TgREwsDe
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Dec 2019 14:27:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 753D381E39
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Dec 2019 14:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575988054;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DzrfXrqS3i0iVxslRT9HAUzTMYttEiFFx6V9DjllFWk=;
 b=W4fAZHWP8bLvyk8hy1d4EWjsxjawEaI113wtarJYG3eQccSjbepiYAXxpEwDMf45AtF/FF
 YRF1buyhaY/vLD+SXGj4yIEKHzSk9rQp89uLbEr5Km1dkKTsJvAqh1NPi4avdimAabzrg6
 Lstw48hUmCOxGLL1jjE6tpgpD39boNM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-319-XClseEyXMWitZgaI4OKeiA-1; Tue, 10 Dec 2019 09:27:32 -0500
Received: by mail-wr1-f70.google.com with SMTP id f15so9089146wrr.2
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Dec 2019 06:27:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=X1lHEli2ZPEUphqWeLKjY7ANrLSq38w1XZiJ4O+hMh4=;
 b=o+KtUsJ3K3n/JAxomxq9Cq9tJpkUY8hgprePGCnhBtLLbvuIwMBhKThHQOh4qUjOdA
 sRkwxLaS1hPtB8b3QRBwVnW+1T/JXTWrni1Oti2mC+DhKkqgoOh3sMqNGiQ+AiWwKJsi
 wYg1B7/IiN09SOnQEGCTHPl/k0Ha5QMKUXw9zrHwA6jeJFB1MbGOiWowXVqA8eSeLebS
 lM/7b+22OpBh0nea3SqRGlIADjtYTJzsBN4iXz8WmXOp9kwYjA7Ah8XtZAi2sfGUL5wa
 NojyfU1xrgrVtmSZKhKIPqTpPTM9l96c6eOQE1/4quGDNbcLF97vbs7kmbMulDKseg5w
 S+Jg==
X-Gm-Message-State: APjAAAVTiq2eueDCOKXPoVIV9ocpyPHlPqUIfnQq5yuOF5ZuSHpTIfkA
 bgyCrJmeGAtVV3SklkyAB/DIRMGz/fG33t6JzyM7OyCc+hbmAqncix9wTOF4j57r7tDdWe9TPOq
 2Ejj4IzzHB2FWtFJOQGvjgSsEEmO2p9kZ7Zom2yQI+Q==
X-Received: by 2002:a7b:c30b:: with SMTP id k11mr3443161wmj.36.1575988050872; 
 Tue, 10 Dec 2019 06:27:30 -0800 (PST)
X-Google-Smtp-Source: APXvYqyORv9pUAClZj3uuRIeWG42TpWgdtau7zFiq4ztIMEHBp0R7wL6KdQcy5e01sv2Y+LjIftgSw==
X-Received: by 2002:a7b:c30b:: with SMTP id k11mr3443140wmj.36.1575988050692; 
 Tue, 10 Dec 2019 06:27:30 -0800 (PST)
Received: from redhat.com (bzq-79-181-48-215.red.bezeqint.net. [79.181.48.215])
 by smtp.gmail.com with ESMTPSA id n1sm3420590wrw.52.2019.12.10.06.27.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2019 06:27:30 -0800 (PST)
Date: Tue, 10 Dec 2019 09:27:27 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH RFC net-next v8 1/3] netdev: pass the stuck queue to the
 timeout handler
Message-ID: <20191210092623-mutt-send-email-mst@kernel.org>
References: <20191203201804.662066-1-mst@redhat.com>
 <20191203201804.662066-2-mst@redhat.com>
 <CAMuHMdXDm0NiCk1pD_-wS9c-ErmRKkrqnPc_pGKzG=QB35mj9A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXDm0NiCk1pD_-wS9c-ErmRKkrqnPc_pGKzG=QB35mj9A@mail.gmail.com>
X-MC-Unique: XClseEyXMWitZgaI4OKeiA-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
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

On Mon, Dec 09, 2019 at 08:40:06AM +0100, Geert Uytterhoeven wrote:
> Hi Michael,
> 
> On Tue, Dec 3, 2019 at 9:21 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > This allows incrementing the correct timeout statistic without any mess.
> > Down the road, devices can learn to reset just the specific queue.
> >
> > The patch was generated with the following script:
> 
> [...]
> 
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> 
> > --- a/drivers/net/ethernet/8390/8390p.c
> > +++ b/drivers/net/ethernet/8390/8390p.c
> > @@ -41,9 +41,9 @@ void eip_set_multicast_list(struct net_device *dev)
> >  }
> >  EXPORT_SYMBOL(eip_set_multicast_list);
> >
> > -void eip_tx_timeout(struct net_device *dev)
> > +void eip_tx_timeout(struct net_device *dev, unsigned int txqueue)
> >  {
> > -       __ei_tx_timeout(dev);
> > +       __ei_tx_timeout(dev, txqueue);
> >  }
> >  EXPORT_SYMBOL(eip_tx_timeout);
> 
> On Mon, Dec 9, 2019 at 6:37 AM <noreply@ellerman.id.au> wrote:
> > FAILED linux-next/m68k-defconfig/m68k Mon Dec 09, 16:34
> >
> > http://kisskb.ellerman.id.au/kisskb/buildresult/14060060/
> >
> > Commit:   Add linux-next specific files for 20191209
> >           6cf8298daad041cd15dc514d8a4f93ca3636c84e
> > Compiler: m68k-linux-gcc (GCC) 4.6.3 / GNU ld (GNU Binutils) 2.22
> >
> > Possible errors
> > ---------------
> >
> > drivers/net/ethernet/8390/8390p.c:44:6: error: conflicting types for 'eip_tx_timeout'
> > drivers/net/ethernet/8390/8390p.c:48:1: error: conflicting types for 'eip_tx_timeout'
> > make[5]: *** [scripts/Makefile.build:266: drivers/net/ethernet/8390/8390p.o] Error 1
> > make[4]: *** [scripts/Makefile.build:503: drivers/net/ethernet/8390] Error 2
> > make[3]: *** [scripts/Makefile.build:503: drivers/net/ethernet] Error 2
> > make[2]: *** [scripts/Makefile.build:503: drivers/net] Error 2
> > make[1]: *** [Makefile:1693: drivers] Error 2
> > make: *** [Makefile:179: sub-make] Error 2
> 
> Looks like you forgot to update the forward declaration in
> drivers/net/ethernet/8390/8390.h

Fixed now.

> There may be others...

Could not find any but pls do let me know.

> http://kisskb.ellerman.id.au/kisskb/head/6cf8298daad041cd15dc514d8a4f93ca3636c84e/
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
