Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 0423D10B645
	for <lists.virtualization@lfdr.de>; Wed, 27 Nov 2019 20:00:06 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 8EC4A20478;
	Wed, 27 Nov 2019 19:00:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5oBU2saNPYMa; Wed, 27 Nov 2019 19:00:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 6C97D1FF98;
	Wed, 27 Nov 2019 19:00:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 514A6C0881;
	Wed, 27 Nov 2019 19:00:01 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 02823C0881
 for <virtualization@lists.linux-foundation.org>;
 Wed, 27 Nov 2019 18:59:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id DFC1485F9C
 for <virtualization@lists.linux-foundation.org>;
 Wed, 27 Nov 2019 18:59:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id reUP3XsolEjq
 for <virtualization@lists.linux-foundation.org>;
 Wed, 27 Nov 2019 18:59:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from shards.monkeyblade.net (shards.monkeyblade.net [23.128.96.9])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 7C18F85F74
 for <virtualization@lists.linux-foundation.org>;
 Wed, 27 Nov 2019 18:59:58 +0000 (UTC)
Received: from localhost (c-73-35-209-67.hsd1.wa.comcast.net [73.35.209.67])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 67E25149C9AA4;
 Wed, 27 Nov 2019 10:59:57 -0800 (PST)
Date: Wed, 27 Nov 2019 10:59:56 -0800 (PST)
Message-Id: <20191127.105956.842685942160278820.davem@davemloft.net>
To: mst@redhat.com
Subject: Re: [net-next V3 0/2] drivers: net: virtio_net: implement
From: David Miller <davem@davemloft.net>
In-Reply-To: <20191127063624-mutt-send-email-mst@kernel.org>
References: <20191126200628.22251-1-jcfaracco@gmail.com>
 <20191126.140630.1195989367614358026.davem@davemloft.net>
 <20191127063624-mutt-send-email-mst@kernel.org>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Wed, 27 Nov 2019 10:59:57 -0800 (PST)
Cc: dnmendes76@gmail.com, netdev@vger.kernel.org, jcfaracco@gmail.com,
 virtualization@lists.linux-foundation.org
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
Date: Wed, 27 Nov 2019 06:38:35 -0500

> On Tue, Nov 26, 2019 at 02:06:30PM -0800, David Miller wrote:
>> 
>> net-next is closed
> 
> Could you merge this early when net-next reopens though?
> This way I don't need to keep adding drivers to update.

It simply needs to be reposted this as soon as net-next opens back up.

I fail to understand even what special treatment you want given to
a given change, it doesn't make any sense.  We have a process for
doing this, it's simple, it's straightforward, and is fair to
everyone.

Thanks.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
