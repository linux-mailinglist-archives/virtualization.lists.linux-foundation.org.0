Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id D2EEC11C03C
	for <lists.virtualization@lfdr.de>; Thu, 12 Dec 2019 00:01:52 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 708B7880DC;
	Wed, 11 Dec 2019 23:01:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jlNvrvrv1+DC; Wed, 11 Dec 2019 23:01:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 39D6687BAD;
	Wed, 11 Dec 2019 23:01:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2AC88C0881;
	Wed, 11 Dec 2019 23:01:47 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 62707C0881
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Dec 2019 23:01:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 512BD204F9
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Dec 2019 23:01:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G+Mk6roJa4GN
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Dec 2019 23:01:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from shards.monkeyblade.net (shards.monkeyblade.net [23.128.96.9])
 by silver.osuosl.org (Postfix) with ESMTPS id 965AD2038D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Dec 2019 23:01:43 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:601:9f00:1c3::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id AF88D15035C62;
 Wed, 11 Dec 2019 15:01:42 -0800 (PST)
Date: Wed, 11 Dec 2019 15:01:39 -0800 (PST)
Message-Id: <20191211.150139.57434044982727807.davem@davemloft.net>
To: sgarzare@redhat.com
Subject: Re: [PATCH net-next v2 0/6] vsock: add local transport support
From: David Miller <davem@davemloft.net>
In-Reply-To: <20191210104307.89346-1-sgarzare@redhat.com>
References: <20191210104307.89346-1-sgarzare@redhat.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Wed, 11 Dec 2019 15:01:43 -0800 (PST)
Cc: kvm@vger.kernel.org, netdev@vger.kernel.org, decui@microsoft.com,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 stefanha@redhat.com, jhansen@vmware.com
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
Date: Tue, 10 Dec 2019 11:43:01 +0100

> v2:
>  - style fixes [Dave]
>  - removed RCU sync and changed 'the_vsock_loopback' in a global
>    static variable [Stefan]
>  - use G2H transport when local transport is not loaded and remote cid
>    is VMADDR_CID_LOCAL [Stefan]
>  - rebased on net-next
> 
> v1: https://patchwork.kernel.org/cover/11251735/
> 
> This series introduces a new transport (vsock_loopback) to handle
> local communication.
...

Series applied, thanks.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
