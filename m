Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC4810858D
	for <lists.virtualization@lfdr.de>; Mon, 25 Nov 2019 00:31:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D0B1185DE1;
	Sun, 24 Nov 2019 23:31:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CV-wQURXobtI; Sun, 24 Nov 2019 23:31:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 48D8D8598A;
	Sun, 24 Nov 2019 23:31:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3FDD1C0878;
	Sun, 24 Nov 2019 23:31:41 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6197FC0878
 for <virtualization@lists.linux-foundation.org>;
 Sun, 24 Nov 2019 23:31:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 5BE6620465
 for <virtualization@lists.linux-foundation.org>;
 Sun, 24 Nov 2019 23:31:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l0P+Ms1xg0Um
 for <virtualization@lists.linux-foundation.org>;
 Sun, 24 Nov 2019 23:31:37 +0000 (UTC)
X-Greylist: delayed 00:20:00 by SQLgrey-1.7.6
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by silver.osuosl.org (Postfix) with ESMTPS id 6364220033
 for <virtualization@lists.linux-foundation.org>;
 Sun, 24 Nov 2019 23:31:37 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id m71so5562970pjb.12
 for <virtualization@lists.linux-foundation.org>;
 Sun, 24 Nov 2019 15:31:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=netronome-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :organization:mime-version:content-transfer-encoding;
 bh=i1qHwy+G9a0VSULNRaoms0tDekf8iU/51Ya/Xfrai40=;
 b=pfLTvoq6UuaicbxCNV7Fjs+l8+Gyt2W+YkaRQIm3yX8ESfgyWToe9ebcfObxRas8jp
 NhIYT1Mj52QiopTTftiyHo3iaeIEkST10vx4fV53IsisneDl8Yye6C2cChYpf+p/8Spt
 M1ukwMsODKTHcdh6Qd5jZnaop4Hp2kvTB+XWdJxdBwUimM66alr9aJ4n397ciEvjThKY
 roLEvdBQhUnIevVbfcboUXwuqIXU1ylt6p7tAVydBm0LuUSmw55aut/WC5ceDED4F5nf
 1OPXsmWUT/89mveM3Idz+o7AuCN/FCGpFESBFFnStjZwFqrgQBelB2aLOVPmgjPmmHBl
 JzIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=i1qHwy+G9a0VSULNRaoms0tDekf8iU/51Ya/Xfrai40=;
 b=R6rvfdwNMbD8ET58nk8QArc5Q2JK+nAjEmmrwadzOw3z4EkqY8VWzfrGMqp8Pw1D1Z
 eK6X1o5qQeJ/NY7zt6Ro2A3mdUNBAq7NiNATk3E6R4om5OV2MnSL0WIpe7id8xM1ehoZ
 9eDIj+5/1pnsTB2VV6jnBv1v2PzcOAMsaiNDtH9cuRVh9/ztymr/UgoVmNKO3i25cZ8M
 6zCPfZ3T+BKZ+wXz+l5fzdusR8dItbdyxzjK2UGKFDauhfBKnz8wIWpXv7Pe9x5vSjaJ
 Bml1ChXow8RBx5u66Xc7Ryl6nuGLCMiF48XPQ0r+fgIsDUbWWf0CDB35fsH8JtdebTj6
 PkGA==
X-Gm-Message-State: APjAAAWm6g83Moo4M12Y/fggExnETJH501A0UYQ4aHZ9j5IePdP1Kpb2
 ap8GA3cNWkU+cCjR9m6JeHKu+Qq4UeI=
X-Google-Smtp-Source: APXvYqxoORlmu7NvER9bWBQjpyIr5840UQFPogBmNb1dxXAhZ9CFlH832yGT792uTtGLND5sd3A32Q==
X-Received: by 2002:a17:90a:970a:: with SMTP id
 x10mr22772544pjo.39.1574636638757; 
 Sun, 24 Nov 2019 15:03:58 -0800 (PST)
Received: from cakuba.netronome.com (c-73-202-202-92.hsd1.ca.comcast.net.
 [73.202.202.92])
 by smtp.gmail.com with ESMTPSA id w19sm5543817pga.83.2019.11.24.15.03.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Nov 2019 15:03:58 -0800 (PST)
Date: Sun, 24 Nov 2019 15:03:52 -0800
From: Jakub Kicinski <jakub.kicinski@netronome.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH net-next v2] drivers: net: virtio_net: Implement a
 dev_watchdog handler
Message-ID: <20191124150352.5cab3209@cakuba.netronome.com>
In-Reply-To: <20191124164411-mutt-send-email-mst@kernel.org>
References: <20191122013636.1041-1-jcfaracco@gmail.com>
 <20191122052506-mutt-send-email-mst@kernel.org>
 <CAENf94KX1XR4_KXz9KLZQ09Ngeaq2qzYY5OE68xJMXMu13SuEg@mail.gmail.com>
 <20191124100157-mutt-send-email-mst@kernel.org>
 <20191124164411-mutt-send-email-mst@kernel.org>
Organization: Netronome Systems, Ltd.
MIME-Version: 1.0
Cc: Daiane Mendes <dnmendes76@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Julio Faracco <jcfaracco@gmail.com>, "David S.
 Miller" <davem@davemloft.net>
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

On Sun, 24 Nov 2019 16:48:35 -0500, Michael S. Tsirkin wrote:
> diff --git a/arch/m68k/emu/nfeth.c b/arch/m68k/emu/nfeth.c
> index a4ebd2445eda..8e06e7407854 100644
> --- a/arch/m68k/emu/nfeth.c
> +++ b/arch/m68k/emu/nfeth.c
> @@ -167,7 +167,7 @@ static int nfeth_xmit(struct sk_buff *skb, struct net_device *dev)
>  	return 0;
>  }
>  
> -static void nfeth_tx_timeout(struct net_device *dev)
> +static void nfeth_tx_timeout(struct net_device *dev, int txqueue)

Given the recent vf ndo problems, I wonder if it's worth making the
queue id unsigned from the start? Since it's coming from the stack
there should be no range checking required, but also signed doesn't
help anything so why not?

>  {
>  	dev->stats.tx_errors++;
>  	netif_wake_queue(dev);

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
