Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id D504D108580
	for <lists.virtualization@lfdr.de>; Mon, 25 Nov 2019 00:18:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6814385D92;
	Sun, 24 Nov 2019 23:18:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gsI_9293SbQX; Sun, 24 Nov 2019 23:18:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2DE78857C5;
	Sun, 24 Nov 2019 23:18:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0DC28C1DDE;
	Sun, 24 Nov 2019 23:18:21 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id ECA7DC0878
 for <virtualization@lists.linux-foundation.org>;
 Sun, 24 Nov 2019 23:18:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id DB27B2034D
 for <virtualization@lists.linux-foundation.org>;
 Sun, 24 Nov 2019 23:18:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v94vWL6LPQ4y
 for <virtualization@lists.linux-foundation.org>;
 Sun, 24 Nov 2019 23:18:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by silver.osuosl.org (Postfix) with ESMTPS id 4B1E32010B
 for <virtualization@lists.linux-foundation.org>;
 Sun, 24 Nov 2019 23:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574637492;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PClP5vcK7H2hH8iu9CCJfFi1HH/SjqItErOS3dnGhZA=;
 b=RsS+/NnYc+jD1Db0coidXj0fwSXvAvBXDq8lZ4HVSoe4pTyQiGZqrKmChupODKZMlSeqLf
 mfceXrmV7FzhT5UpPKtZJNZYuzmJZLnOZivPM6IBpuyOIHd8WUHII01FMjM1e9jsF5+mPp
 AzcYO8lnu47t9sXHqPnG/yKVZ+aCYcs=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-326-aB7gbC2sP2aP_8EkPLRZsg-1; Sun, 24 Nov 2019 18:18:08 -0500
Received: by mail-qk1-f198.google.com with SMTP id j1so7121269qkk.17
 for <virtualization@lists.linux-foundation.org>;
 Sun, 24 Nov 2019 15:18:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fuJZGXqNTPkHKKy9Zo1tRW4D2w7eYV51Z20agxm/QfY=;
 b=hL7ANYRzHU94WZZrwzwF+ekBf6oFxlSHZVxHdKRnUPXZ2X9NMMk0JEy1NB9uauITge
 caoeOkL5BOIpILlsF81xqZPnmKv7YRDKUYeH6E4VE1ywbbf2gTfPmfnK2d6KvYQ9mHX/
 6LQm01PlH4+n0DCiA/mqRGIfeAQ0mZpVfWER8dClK+0LxZalbayFQjb3UWZ0Z8Cll6Ga
 4anK8A9aqsmKX+UEiAa14CC2SX4RZaBq32Ogw4pASBwmBwYZKEDdPlI1Q5TMtEbYwEJq
 8UT6sxEt/UFnF09M4fUdtR53EKeTqZ2RFrpBN4qmUCgzYVrs7kHwOhG9sH9+MyL7l9uT
 7rGw==
X-Gm-Message-State: APjAAAXrGUimvcug2AO/6OB388YWpeQPT0I14uhsyiuX3W3MeOUZ3i5T
 p1YCWY0WWouUJCtk/SKUlQsNun+DHnIoWy9pHSdWWAK5MiuvnjqBLOMMKZaK4vNv7jHu2zq7ck0
 CXzRKTB3bDlzvz/pYUYS8g2tShzaYc7l6cckGrGWxzw==
X-Received: by 2002:ac8:754c:: with SMTP id b12mr16779099qtr.291.1574637488460; 
 Sun, 24 Nov 2019 15:18:08 -0800 (PST)
X-Google-Smtp-Source: APXvYqzifxug591hBiIzAoyGSEYaT6MrOBiQSwRPRmdW7PdE6LTobqahiQLu0xVWQAlGqwHRLz37Eg==
X-Received: by 2002:ac8:754c:: with SMTP id b12mr16779087qtr.291.1574637488287; 
 Sun, 24 Nov 2019 15:18:08 -0800 (PST)
Received: from redhat.com (bzq-79-176-6-42.red.bezeqint.net. [79.176.6.42])
 by smtp.gmail.com with ESMTPSA id l45sm2841796qtb.32.2019.11.24.15.18.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Nov 2019 15:18:07 -0800 (PST)
Date: Sun, 24 Nov 2019 18:18:02 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jakub Kicinski <jakub.kicinski@netronome.com>
Subject: Re: [PATCH net-next v2] drivers: net: virtio_net: Implement a
 dev_watchdog handler
Message-ID: <20191124181750-mutt-send-email-mst@kernel.org>
References: <20191122013636.1041-1-jcfaracco@gmail.com>
 <20191122052506-mutt-send-email-mst@kernel.org>
 <CAENf94KX1XR4_KXz9KLZQ09Ngeaq2qzYY5OE68xJMXMu13SuEg@mail.gmail.com>
 <20191124100157-mutt-send-email-mst@kernel.org>
 <20191124164411-mutt-send-email-mst@kernel.org>
 <20191124150352.5cab3209@cakuba.netronome.com>
MIME-Version: 1.0
In-Reply-To: <20191124150352.5cab3209@cakuba.netronome.com>
X-MC-Unique: aB7gbC2sP2aP_8EkPLRZsg-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
Cc: Daiane Mendes <dnmendes76@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Julio Faracco <jcfaracco@gmail.com>, "David S. Miller" <davem@davemloft.net>
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

On Sun, Nov 24, 2019 at 03:03:52PM -0800, Jakub Kicinski wrote:
> On Sun, 24 Nov 2019 16:48:35 -0500, Michael S. Tsirkin wrote:
> > diff --git a/arch/m68k/emu/nfeth.c b/arch/m68k/emu/nfeth.c
> > index a4ebd2445eda..8e06e7407854 100644
> > --- a/arch/m68k/emu/nfeth.c
> > +++ b/arch/m68k/emu/nfeth.c
> > @@ -167,7 +167,7 @@ static int nfeth_xmit(struct sk_buff *skb, struct net_device *dev)
> >  	return 0;
> >  }
> >  
> > -static void nfeth_tx_timeout(struct net_device *dev)
> > +static void nfeth_tx_timeout(struct net_device *dev, int txqueue)
> 
> Given the recent vf ndo problems, I wonder if it's worth making the
> queue id unsigned from the start? Since it's coming from the stack
> there should be no range checking required, but also signed doesn't
> help anything so why not?
> 
> >  {
> >  	dev->stats.tx_errors++;
> >  	netif_wake_queue(dev);

You are right. I'll change this.

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
