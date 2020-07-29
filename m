Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 13FB6231C40
	for <lists.virtualization@lfdr.de>; Wed, 29 Jul 2020 11:42:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 98567204D4;
	Wed, 29 Jul 2020 09:42:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id APbpvsbwxXAE; Wed, 29 Jul 2020 09:42:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 499BD203C9;
	Wed, 29 Jul 2020 09:42:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1DEC0C004D;
	Wed, 29 Jul 2020 09:42:42 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D0260C004D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Jul 2020 09:42:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id E142485184
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Jul 2020 09:42:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pbkySvq1rwQb
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Jul 2020 09:42:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [63.128.21.74])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 49E648501D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Jul 2020 09:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596015721;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=k7LhEO6XCqGVUuc17BRfAuaIUsyKpv0HJUC9DTzz2Oc=;
 b=V9tejbCb3LSv7igXYtRzbuYmkZpL6PfHfJmisE14x7TxM6FaLwooSOxUsO0Sp0ieKT6ajc
 aAOc/iXinixzrpe56I7tJFIl2gmkozgCW4TRDm/ulrVZQ4GJe2UWPyWtL9C9W/cwJ0RbCO
 03B2VW5e2zNkVQ+KgE7khr0xqZJv3is=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-149-n9gRX9ERMY2jyjw0DaKWuQ-1; Wed, 29 Jul 2020 05:40:24 -0400
X-MC-Unique: n9gRX9ERMY2jyjw0DaKWuQ-1
Received: by mail-wr1-f69.google.com with SMTP id t12so6501785wrp.0
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Jul 2020 02:40:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=k7LhEO6XCqGVUuc17BRfAuaIUsyKpv0HJUC9DTzz2Oc=;
 b=b5GKXvvbq9mfiNzJD5V45hE1cZoUVXY0lUZ7KFjp5e8QaQw7O+kMs9zY3SEcIomZD4
 AW9Yuzgru+okBY3lAOBAnfs71iXuqrJVsvWjZG8Y1wNz8cYtI/eIvL/op2quEopaPUgx
 GodLLNvMQnWNDG4mcYPJyM92JBfrqXLZQ/ZMP8d+atJAzMLTrP2+2SYwhW+0jpQXYbrC
 YRPnZDzhlXHlJ7FukRLzmPx7nFoCyefNwUq+ClFe8lveMg9vrR+jxU7pl5ZiYg1fBI2z
 TdYjhtULPPcypiR/bfcG08XDD7BX1BuOI/CyWZbjaoNavZXiuTC8GryVRT8Lig8av4CF
 swtg==
X-Gm-Message-State: AOAM530JTh2uQqjMxKCIy/emHf7lFVOquiNQlZXaNG1JjhEO/ARXn/Cb
 wDFrxOyFXw+GmCXdhnLjOq6X74gvzadru2T0Kn41LMxY8GyiQV+VrLHQg8rx8R16r1k+pnT9vrz
 lfeI0CVYYOLYvWp3W8Xt88PrcTQu10iy5eqt1vDuIOw==
X-Received: by 2002:adf:9c8c:: with SMTP id d12mr28254569wre.369.1596015622991; 
 Wed, 29 Jul 2020 02:40:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzSgh6jDxOdFmcD7rlJpBZFVipNvyIVfH2WgoMjLbmLGCkqivl8DMGS+QOpLJ4wheZJRWE1WQ==
X-Received: by 2002:adf:9c8c:: with SMTP id d12mr28254546wre.369.1596015622705; 
 Wed, 29 Jul 2020 02:40:22 -0700 (PDT)
Received: from steredhat.lan ([5.180.207.22])
 by smtp.gmail.com with ESMTPSA id x2sm534205wrg.73.2020.07.29.02.40.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jul 2020 02:40:22 -0700 (PDT)
Date: Wed, 29 Jul 2020 11:40:18 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: netdev@vger.kernel.org
Subject: Re: general protection fault in vsock_poll
Message-ID: <20200729094018.x6rr2jlzh3ne4pgx@steredhat.lan>
References: <00000000000099052605aafb5923@google.com>
 <00000000000093b5dc05ab90c468@google.com>
MIME-Version: 1.0
In-Reply-To: <00000000000093b5dc05ab90c468@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: syzbot+a61bac2fcc1a7c6623fe@syzkaller.appspotmail.com, kvm@vger.kernel.org,
 syzkaller-bugs@googlegroups.com, decui@microsoft.com,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 stefanha@redhat.com, kuba@kernel.org, davem@davemloft.net, jhansen@vmware.com
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

On Wed, Jul 29, 2020 at 01:59:05AM -0700, syzbot wrote:
> syzbot has bisected this issue to:
> 
> commit 408624af4c89989117bb2c6517bd50b7708a2fcd
> Author: Stefano Garzarella <sgarzare@redhat.com>
> Date:   Tue Dec 10 10:43:06 2019 +0000
> 
>     vsock: use local transport when it is loaded
> 
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=17e6489b100000
> start commit:   92ed3019 Linux 5.8-rc7
> git tree:       upstream
> final oops:     https://syzkaller.appspot.com/x/report.txt?x=1416489b100000
> console output: https://syzkaller.appspot.com/x/log.txt?x=1016489b100000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=84f076779e989e69
> dashboard link: https://syzkaller.appspot.com/bug?extid=a61bac2fcc1a7c6623fe
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15930b64900000
> 
> Reported-by: syzbot+a61bac2fcc1a7c6623fe@syzkaller.appspotmail.com
> Fixes: 408624af4c89 ("vsock: use local transport when it is loaded")
> 
> For information about bisection process see: https://goo.gl/tpsmEJ#bisection
> 

I'll take a look.

At first glance it seems strange, because if sk_state is TCP_ESTABLISHED,
the transport shouldn't be NULL, that's why we didn't put the check.

Stefano

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
