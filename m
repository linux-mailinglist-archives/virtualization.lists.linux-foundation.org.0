Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD3D14269C
	for <lists.virtualization@lfdr.de>; Mon, 20 Jan 2020 10:06:54 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4D0C384CCE;
	Mon, 20 Jan 2020 09:06:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TLOiIF0EyeDV; Mon, 20 Jan 2020 09:06:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 09A5084D22;
	Mon, 20 Jan 2020 09:06:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CA292C0174;
	Mon, 20 Jan 2020 09:06:44 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 41AAEC0174
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jan 2020 09:06:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 234B7850F1
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jan 2020 09:06:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PYK+YNEAM07q
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jan 2020 09:06:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from shards.monkeyblade.net (shards.monkeyblade.net [23.128.96.9])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 85C6286F5C
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jan 2020 09:06:16 +0000 (UTC)
Received: from localhost (82-95-191-104.ip.xs4all.nl [82.95.191.104])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id B741D153D04BF;
 Mon, 20 Jan 2020 01:06:11 -0800 (PST)
Date: Mon, 20 Jan 2020 10:06:10 +0100 (CET)
Message-Id: <20200120.100610.546818167633238909.davem@davemloft.net>
To: sgarzare@redhat.com
Subject: Re: [PATCH net-next 1/3] vsock: add network namespace support
From: David Miller <davem@davemloft.net>
In-Reply-To: <20200116172428.311437-2-sgarzare@redhat.com>
References: <20200116172428.311437-1-sgarzare@redhat.com>
 <20200116172428.311437-2-sgarzare@redhat.com>
X-Mailer: Mew version 6.8 on Emacs 26.3
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Mon, 20 Jan 2020 01:06:13 -0800 (PST)
Cc: linux-hyperv@vger.kernel.org, kvm@vger.kernel.org, mst@redhat.com,
 netdev@vger.kernel.org, decui@microsoft.com, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, stefanha@redhat.com,
 jhansen@vmware.com
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
Date: Thu, 16 Jan 2020 18:24:26 +0100

> This patch adds 'netns' module param to enable this new feature
> (disabled by default), because it changes vsock's behavior with
> network namespaces and could break existing applications.

Sorry, no.

I wonder if you can even design a legitimate, reasonable, use case
where these netns changes could break things.

I am totally against adding a module parameter for this, it's
incredibly confusing for users and will create a test scenerio
that is strongly less likely to be covered.

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
