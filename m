Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC0A11DDEC
	for <lists.virtualization@lfdr.de>; Fri, 13 Dec 2019 06:48:24 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 4A47B25734;
	Fri, 13 Dec 2019 05:48:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K9CvZeVFV+Cm; Fri, 13 Dec 2019 05:48:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 9B05920420;
	Fri, 13 Dec 2019 05:48:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6D8F1C0881;
	Fri, 13 Dec 2019 05:48:22 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DBCFAC0881
 for <virtualization@lists.linux-foundation.org>;
 Fri, 13 Dec 2019 05:48:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id D774025734
 for <virtualization@lists.linux-foundation.org>;
 Fri, 13 Dec 2019 05:48:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pXcFalRev74x
 for <virtualization@lists.linux-foundation.org>;
 Fri, 13 Dec 2019 05:48:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from shards.monkeyblade.net (shards.monkeyblade.net [23.128.96.9])
 by silver.osuosl.org (Postfix) with ESMTPS id 16C7A20420
 for <virtualization@lists.linux-foundation.org>;
 Fri, 13 Dec 2019 05:48:18 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:601:9f00:1c3::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 0015C1544FBF5;
 Thu, 12 Dec 2019 21:48:17 -0800 (PST)
Date: Thu, 12 Dec 2019 21:48:15 -0800 (PST)
Message-Id: <20191212.214815.1246328093645167656.davem@davemloft.net>
To: mst@redhat.com
Subject: Re: [PATCH net-next v12 0/3] netdev: ndo_tx_timeout cleanup
From: David Miller <davem@davemloft.net>
In-Reply-To: <20191210142305.52171-1-mst@redhat.com>
References: <20191210142305.52171-1-mst@redhat.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Thu, 12 Dec 2019 21:48:18 -0800 (PST)
Cc: dnmendes76@gmail.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, jcfaracco@gmail.com
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

From: "Michael S. Tsirkin" <mst@redhat.com>
Date: Tue, 10 Dec 2019 09:23:47 -0500

> Yet another forward declaration I missed. Hopfully the last one ...
> 
> A bunch of drivers want to know which tx queue triggered a timeout,
> and virtio wants to do the same.
> We actually have the info to hand, let's just pass it on to drivers.
> Note: tested with an experimental virtio patch by Julio.
> That patch itself isn't ready yet though, so not included.
> Other drivers compiled only.

Series applied, will push out after build testing completes.

Thanks.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
