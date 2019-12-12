Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D40311D698
	for <lists.virtualization@lfdr.de>; Thu, 12 Dec 2019 20:02:07 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id A4A5D20358;
	Thu, 12 Dec 2019 19:02:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A2hG6XLZCqlr; Thu, 12 Dec 2019 19:02:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 47CE12043B;
	Thu, 12 Dec 2019 19:02:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2FF9BC0881;
	Thu, 12 Dec 2019 19:02:03 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7388CC0881
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Dec 2019 19:02:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 5B252203A9
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Dec 2019 19:02:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I+k-uCGTdb65
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Dec 2019 19:02:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from shards.monkeyblade.net (shards.monkeyblade.net [23.128.96.9])
 by silver.osuosl.org (Postfix) with ESMTPS id 9EA2520358
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Dec 2019 19:02:00 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:601:9f00:1c3::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id C18F6153DFC82;
 Thu, 12 Dec 2019 11:01:59 -0800 (PST)
Date: Thu, 12 Dec 2019 11:01:59 -0800 (PST)
Message-Id: <20191212.110159.1715559793988195794.davem@davemloft.net>
To: sgarzare@redhat.com
Subject: Re: [PATCH] vhost/vsock: accept only packets with the right dst_cid
From: David Miller <davem@davemloft.net>
In-Reply-To: <20191212131453.yocx6wckoluwofbb@steredhat>
References: <20191212123624.ahyhrny7u6ntn3xt@steredhat>
 <20191212075356-mutt-send-email-mst@kernel.org>
 <20191212131453.yocx6wckoluwofbb@steredhat>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Thu, 12 Dec 2019 11:02:00 -0800 (PST)
Cc: kvm@vger.kernel.org, mst@redhat.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 stefanha@redhat.com
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

From: Stefano Garzarella <sgarzare@redhat.com>
Date: Thu, 12 Dec 2019 14:14:53 +0100

> On Thu, Dec 12, 2019 at 07:56:26AM -0500, Michael S. Tsirkin wrote:
>> On Thu, Dec 12, 2019 at 01:36:24PM +0100, Stefano Garzarella wrote:
>> I'd say it's better to backport to all stable releases where it applies,
>> but yes it's only a security issue in 5.4.  Dave could you forward pls?
> 
> Yes, I agree with you.
> 
> @Dave let me know if I should do it.

I've queued it up for -stable.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
