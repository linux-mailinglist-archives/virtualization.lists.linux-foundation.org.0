Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id CDDF3225BA1
	for <lists.virtualization@lfdr.de>; Mon, 20 Jul 2020 11:27:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2445687DBA;
	Mon, 20 Jul 2020 09:27:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FwSbq4+7+3DX; Mon, 20 Jul 2020 09:27:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3A29F87DB1;
	Mon, 20 Jul 2020 09:27:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 12330C016F;
	Mon, 20 Jul 2020 09:27:53 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CF005C016F
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jul 2020 09:27:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 7AD5E2000A
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jul 2020 09:27:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N5rU3a2Q+Y+9
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jul 2020 09:27:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by silver.osuosl.org (Postfix) with ESMTPS id DFDC41FFFE
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jul 2020 09:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595237267;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BfDHngK+oB3XbjAU3xOuqommK/lKgoaQlCXUf45Prys=;
 b=fFdhjcq2fE1CS44HaJauMZmAaAkyuOS1GpP/pQ/i8vPVQq1DE0mDE57oSD0dThGhJK3JqS
 KK8JnFCw7RMDdtustDOOgXms/3ilGkHRgz6lEOuch7chRW83fCUV8ktAX1FViqslYuWB2y
 cDdiopxCLyzgOtHbK/+OOm+7E480uAA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-328-y6Z3DRVmP9uPcsydhuervg-1; Mon, 20 Jul 2020 05:27:45 -0400
X-MC-Unique: y6Z3DRVmP9uPcsydhuervg-1
Received: by mail-wm1-f71.google.com with SMTP id g6so14058913wmk.4
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jul 2020 02:27:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BfDHngK+oB3XbjAU3xOuqommK/lKgoaQlCXUf45Prys=;
 b=H2l8nRipkqk6hJkiPCFzWAGMzyiTjVzUGcbyYxriM++8UUs9VZ1YFoJ2RBz98pb+Qv
 ExjChOS48Epx6+ws5WA0dnXw8bkJakj/v4IbaxtoL8BTFxbbYH95flFT9xblf2qn+gB8
 AKCYR3Mjr5yGOq4tmvBzjyiMx17x7H+FRCHgzoiHehyYFIUlWUEebuO+m5mBKr5G9y2o
 6W8Ot4xmHUXatJz5aeP0XEXbw3ZrhOq0eOZHq5M+KFco9kZl6xl9NlCaUNjJsUxNB2vw
 pWsKy6mhBB86p359vwE+uKOREp8xaVHksfNsfmUU9UMJrbfbSYFnmW09OR2Yf4fCAFUl
 DxJw==
X-Gm-Message-State: AOAM533n3jVOygGmfYLI9RyEbXP8bOx75p+QFeMdKWOBBFn8mw18aGbc
 YM+uG0+x9NKFSf6mnAtVH4LWupna2sTL0w1/PeAtTukM8iShAFBWPT+l8KR63sjSjXENreuXdAs
 44cMQABza34ZMjbQ77n0+F737En9Ml/XBEx9GX0UcJw==
X-Received: by 2002:a5d:690a:: with SMTP id t10mr8969054wru.374.1595237264614; 
 Mon, 20 Jul 2020 02:27:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwys0tMmHV0ufw5MBx2/qSIQ6Xy9iedoIg6GLkD2GxQLcM8Eic56JAKINuIrtIsYcxRKwK7oA==
X-Received: by 2002:a5d:690a:: with SMTP id t10mr8969032wru.374.1595237264391; 
 Mon, 20 Jul 2020 02:27:44 -0700 (PDT)
Received: from redhat.com ([192.117.173.58])
 by smtp.gmail.com with ESMTPSA id z63sm34167625wmb.2.2020.07.20.02.27.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2020 02:27:43 -0700 (PDT)
Date: Mon, 20 Jul 2020 05:27:39 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eugenio Perez Martin <eperezma@redhat.com>
Subject: Re: [PATCH RFC v8 02/11] vhost: use batched get_vq_desc version
Message-ID: <20200720051410-mutt-send-email-mst@kernel.org>
References: <CAJaqyWefMHPguj8ZGCuccTn0uyKxF9ZTEi2ASLtDSjGNb1Vwsg@mail.gmail.com>
 <419cc689-adae-7ba4-fe22-577b3986688c@redhat.com>
 <CAJaqyWedEg9TBkH1MxGP1AecYHD-e-=ugJ6XUN+CWb=rQGf49g@mail.gmail.com>
 <0a83aa03-8e3c-1271-82f5-4c07931edea3@redhat.com>
 <CAJaqyWeqF-KjFnXDWXJ2M3Hw3eQeCEE2-7p1KMLmMetMTm22DQ@mail.gmail.com>
 <20200709133438-mutt-send-email-mst@kernel.org>
 <7dec8cc2-152c-83f4-aa45-8ef9c6aca56d@redhat.com>
 <CAJaqyWdLOH2EceTUduKYXCQUUNo1XQ1tLgjYHTBGhtdhBPHn_Q@mail.gmail.com>
 <20200710015615-mutt-send-email-mst@kernel.org>
 <CAJaqyWf1skGxrjuT9GLr6dtgd-433y-rCkbtStLHaAs2W2jYXA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJaqyWf1skGxrjuT9GLr6dtgd-433y-rCkbtStLHaAs2W2jYXA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: kvm list <kvm@vger.kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org
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

On Thu, Jul 16, 2020 at 07:16:27PM +0200, Eugenio Perez Martin wrote:
> On Fri, Jul 10, 2020 at 7:58 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Fri, Jul 10, 2020 at 07:39:26AM +0200, Eugenio Perez Martin wrote:
> > > > > How about playing with the batch size? Make it a mod parameter instead
> > > > > of the hard coded 64, and measure for all values 1 to 64 ...
> > > >
> > > >
> > > > Right, according to the test result, 64 seems to be too aggressive in
> > > > the case of TX.
> > > >
> > >
> > > Got it, thanks both!
> >
> > In particular I wonder whether with batch size 1
> > we get same performance as without batching
> > (would indicate 64 is too aggressive)
> > or not (would indicate one of the code changes
> > affects performance in an unexpected way).
> >
> > --
> > MST
> >
> 
> Hi!
> 
> Varying batch_size as drivers/vhost/net.c:VHOST_NET_BATCH,

sorry this is not what I meant.

I mean something like this:


diff --git a/drivers/vhost/net.c b/drivers/vhost/net.c
index 0b509be8d7b1..b94680e5721d 100644
--- a/drivers/vhost/net.c
+++ b/drivers/vhost/net.c
@@ -1279,6 +1279,10 @@ static void handle_rx_net(struct vhost_work *work)
 	handle_rx(net);
 }
 
+MODULE_PARM_DESC(batch_num, "Number of batched descriptors. (offset from 64)");
+module_param(batch_num, int, 0644);
+static int batch_num = 0;
+
 static int vhost_net_open(struct inode *inode, struct file *f)
 {
 	struct vhost_net *n;
@@ -1333,7 +1337,7 @@ static int vhost_net_open(struct inode *inode, struct file *f)
 		vhost_net_buf_init(&n->vqs[i].rxq);
 	}
 	vhost_dev_init(dev, vqs, VHOST_NET_VQ_MAX,
-		       UIO_MAXIOV + VHOST_NET_BATCH,
+		       UIO_MAXIOV + VHOST_NET_BATCH + batch_num,
 		       VHOST_NET_PKT_WEIGHT, VHOST_NET_WEIGHT, true,
 		       NULL);
 

then you can try tweaking batching and playing with mod parameter without
recompiling.


VHOST_NET_BATCH affects lots of other things.


> and testing
> the pps as previous mail says. This means that we have either only
> vhost_net batching (in base testing, like previously to apply this
> patch) or both batching sizes the same.
> 
> I've checked that vhost process (and pktgen) goes 100% cpu also.
> 
> For tx: Batching decrements always the performance, in all cases. Not
> sure why bufapi made things better the last time.
> 
> Batching makes improvements until 64 bufs, I see increments of pps but like 1%.
> 
> For rx: Batching always improves performance. It seems that if we
> batch little, bufapi decreases performance, but beyond 64, bufapi is
> much better. The bufapi version keeps improving until I set a batching
> of 1024. So I guess it is super good to have a bunch of buffers to
> receive.
> 
> Since with this test I cannot disable event_idx or things like that,
> what would be the next step for testing?
> 
> Thanks!
> 
> --
> Results:
> # Buf size: 1,16,32,64,128,256,512
> 
> # Tx
> # ===
> # Base
> 2293304.308,3396057.769,3540860.615,3636056.077,3332950.846,3694276.154,3689820
> # Batch
> 2286723.857,3307191.643,3400346.571,3452527.786,3460766.857,3431042.5,3440722.286
> # Batch + Bufapi
> 2257970.769,3151268.385,3260150.538,3379383.846,3424028.846,3433384.308,3385635.231,3406554.538
> 
> # Rx
> # ==
> # pktgen results (pps)
> 1223275,1668868,1728794,1769261,1808574,1837252,1846436
> 1456924,1797901,1831234,1868746,1877508,1931598,1936402
> 1368923,1719716,1794373,1865170,1884803,1916021,1975160
> 
> # Testpmd pps results
> 1222698.143,1670604,1731040.6,1769218,1811206,1839308.75,1848478.75
> 1450140.5,1799985.75,1834089.75,1871290,1880005.5,1934147.25,1939034
> 1370621,1721858,1796287.75,1866618.5,1885466.5,1918670.75,1976173.5,1988760.75,1978316
> 
> pktgen was run again for rx with 1024 and 2048 buf size, giving
> 1988760.75 and 1978316 pps. Testpmd goes the same way.

Don't really understand what does this data mean.
Which number of descs is batched for each run?

-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
