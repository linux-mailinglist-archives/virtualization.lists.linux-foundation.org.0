Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 3397D2E23B7
	for <lists.virtualization@lfdr.de>; Thu, 24 Dec 2020 03:40:03 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id BFE9A8583F;
	Thu, 24 Dec 2020 02:40:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fvb6MZ5qa6ph; Thu, 24 Dec 2020 02:40:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4457A85785;
	Thu, 24 Dec 2020 02:40:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2AB23C0893;
	Thu, 24 Dec 2020 02:40:01 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 87BDEC0893
 for <virtualization@lists.linux-foundation.org>;
 Thu, 24 Dec 2020 02:40:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 6EEAD85775
 for <virtualization@lists.linux-foundation.org>;
 Thu, 24 Dec 2020 02:40:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id exwsdvltuIK3
 for <virtualization@lists.linux-foundation.org>;
 Thu, 24 Dec 2020 02:39:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 06D1C85742
 for <virtualization@lists.linux-foundation.org>;
 Thu, 24 Dec 2020 02:39:59 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id j22so1627123eja.13
 for <virtualization@lists.linux-foundation.org>;
 Wed, 23 Dec 2020 18:39:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NjG06L3A2y7EyOAPA8qQEkMYP0fOIFXomd5VJhGvonw=;
 b=lbD06MwxnMTBKm9UFkUyMaagYzhQ04v/L3QpVGK1v5pFcVLlx5paigmmmNGxgXAtPQ
 LI6jvLtwaGR3BQFrgr/blcDNVCbqEip4x8Xi1NQXDLFPZHkeqTqb3o9O/3Bd1nL9qXxV
 Mq6z2RpsHwX+B/eA3m0he+uaX6CyPTXpVL1564accO79rZ9EjQk7728fznCwVbWZ8P6u
 hb2MNeO3f/O0iK9TdJxP4p5x7NiFGLBhMbunyHNGulN/ZD2KJIWzD+AjD5qRDqIbXnfr
 FKFKJuiI89NCu5somS7XlnSKf2Hoi124gMW0kaUJ6NdtTznaO7XqMhNWz7+dl5ia6fvA
 X6Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NjG06L3A2y7EyOAPA8qQEkMYP0fOIFXomd5VJhGvonw=;
 b=HoqOFvXn2izmmr8kukDOq5MIAl8LGjsWpRUa5I/wicKBMhbY07e9xSvfwpaOTVl3dZ
 Nag9c9aZvV28I1W2YoeuMYoDg5I7UgDhEVdXEhoiZ983BufDN1TfoH+bbSTtCHF6i30t
 totG6BACEK6KHEevsr4pW8H/9V4e58TyWsZ532R4j8Iayw808Df0Yl9T/9lBU7zEzskb
 vMvfkpnvzUSRCMDmdIs3sVx2dl62OWkZLgT1qy0xculfyYSjw46ucBnHmvhcZ0WfG6/v
 SUGOFvf1L7egsqLoTBURQP1tly/rVO7pH56C+Ex1Z7Y8gFrUl6cjtdcODkQxQcG4ynH+
 m/nw==
X-Gm-Message-State: AOAM530ECVasT4n0WeD4gA7RPoSUgSuKUQiu1tTd7377w/HA1SXRTl+N
 rCcFUsOh654e1QkKNFF80l6cUMkxCKLGjoNZuUc=
X-Google-Smtp-Source: ABdhPJySF3Jr0hQHF20L2EcoroCWMiycgS8JXpi950PizcC7YnvQxEG+bFtjg+na3OtA/0t/ZiN4OnN6RrDgUpQNb+Y=
X-Received: by 2002:a17:906:8255:: with SMTP id
 f21mr26071925ejx.265.1608777597515; 
 Wed, 23 Dec 2020 18:39:57 -0800 (PST)
MIME-Version: 1.0
References: <1608776746-4040-1-git-send-email-wangyunjian@huawei.com>
In-Reply-To: <1608776746-4040-1-git-send-email-wangyunjian@huawei.com>
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Date: Wed, 23 Dec 2020 21:39:19 -0500
Message-ID: <CAF=yD-J88Pvo+jseUQviy1+uvtH+CwkOwirDyV1EjN=J_93xsw@mail.gmail.com>
Subject: Re: [PATCH net v4 2/2] vhost_net: fix tx queue stuck when sendmsg
 fails
To: wangyunjian <wangyunjian@huawei.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Network Development <netdev@vger.kernel.org>,
 "Lilijun \(Jerry\)" <jerry.lilijun@huawei.com>,
 virtualization@lists.linux-foundation.org, xudingke <xudingke@huawei.com>,
 "huangbin \(J\)" <brian.huangbin@huawei.com>,
 chenchanghu <chenchanghu@huawei.com>
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

On Wed, Dec 23, 2020 at 9:25 PM wangyunjian <wangyunjian@huawei.com> wrote:
>
> From: Yunjian Wang <wangyunjian@huawei.com>
>
> Currently the driver doesn't drop a packet which can't be sent by tun
> (e.g bad packet). In this case, the driver will always process the
> same packet lead to the tx queue stuck.
>
> To fix this issue:
> 1. in the case of persistent failure (e.g bad packet), the driver
> can skip this descriptor by ignoring the error.
> 2. in the case of transient failure (e.g -EAGAIN and -ENOMEM), the
> driver schedules the worker to try again.
>
> Fixes: 3a4d5c94e959 ("vhost_net: a kernel-level virtio server")
> Signed-off-by: Yunjian Wang <wangyunjian@huawei.com>

Acked-by: Willem de Bruijn <willemb@google.com>

Thanks.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
