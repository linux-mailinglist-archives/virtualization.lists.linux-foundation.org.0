Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id A23B53AF1E2
	for <lists.virtualization@lfdr.de>; Mon, 21 Jun 2021 19:25:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25FA760871;
	Mon, 21 Jun 2021 17:25:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d67L4D2zBqBT; Mon, 21 Jun 2021 17:25:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 0E6F86087E;
	Mon, 21 Jun 2021 17:25:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9CAD3C000C;
	Mon, 21 Jun 2021 17:25:40 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5A8C5C000C
 for <virtualization@lists.linux-foundation.org>;
 Mon, 21 Jun 2021 17:25:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3CEE560871
 for <virtualization@lists.linux-foundation.org>;
 Mon, 21 Jun 2021 17:25:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sZK3hufR1qsv
 for <virtualization@lists.linux-foundation.org>;
 Mon, 21 Jun 2021 17:25:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 93D6060791
 for <virtualization@lists.linux-foundation.org>;
 Mon, 21 Jun 2021 17:25:38 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id w1so7491719oie.13
 for <virtualization@lists.linux-foundation.org>;
 Mon, 21 Jun 2021 10:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8Nl+UATUG/ekcwj7+lbeC3lq97VrKeBhXiFoqjO/PoM=;
 b=ZtzZJVQIiktzwMhbckUEj/FSihpO/1RWyF2QAlXOSMKMLwYz2qMKBN98I5AgANFqVc
 IQChA9yq5zSYbUEZVhDym/IGTUjOOFfdCcY8CsltdJLqcaDvjBZbmL1FSeBG/ceO4kD2
 iThRqjQh4BBr2EJIQTTbgH+yjk/gP0KSFYyy/Rj8JAGUoVMUmJuJGbBG4QIWzerRMtuz
 Wi8blOC/XZShQv0fW1DPtvTn6/SMk7szm4Rxzr7YqRhVen7Joc1TDeG2HuA/tcCsiyR/
 w54Q9fwepWbIPmLIehU2/RpQo/1UIepba1ErkP5TY+UUUAwNnAqOcsKj4+oWEVQiJkKT
 5OgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8Nl+UATUG/ekcwj7+lbeC3lq97VrKeBhXiFoqjO/PoM=;
 b=kgKTgqJH+aDaoURJvXmycFmL3yQg8LRmAgKzXnpRNYxRrK0L+qHEYOScikRrAKBMNL
 XIJUAKKUnNYJfAkbgLb3X9zWnJwNCl+Anr6IH/xLodiTOgNsT2UjUxgykwrVE4NaZl8+
 WSAQcxpe/xInD8et6kOHV3hRR0FRtJ6yb088H7uT3UixBcZLw3pEJehQNtTEz8Guo0zv
 h9yoIzy3gWeT+Fe7bVWOYDstd+lxnkwZEaXtJ1+uyU3z/DBYmbQuplo/xVm9Ifr/J+hO
 7o21FcWUuhY6CmJbVaVn8RTaK1D11KoEYFjXv2CxhGhNFYkLOOYz1hi6aJi+ngQYArrd
 1kZA==
X-Gm-Message-State: AOAM5315g69p/VH1e9jGGFJfC/UP6YyCUhouHLmrxbkxfqChhRcWRTyB
 HvAmgsYQAfZTFESondg78qSUK/Cq9ybsdYs/QzsStQ==
X-Google-Smtp-Source: ABdhPJyopzV7pDlrYVX5eV/Fi7NWMvWgN1AYozmtcDSU6CyqoDJ+CXMCQ3Dt6qAgUPNI5GU++0ExZe1a/ltfasDu9zw=
X-Received: by 2002:aca:e0d6:: with SMTP id
 x205mr17927435oig.109.1624296337665; 
 Mon, 21 Jun 2021 10:25:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210609232501.171257-1-jiang.wang@bytedance.com>
 <20210609232501.171257-6-jiang.wang@bytedance.com>
 <20210618095409.q6s3knm2m4u7lezd@steredhat.lan>
In-Reply-To: <20210618095409.q6s3knm2m4u7lezd@steredhat.lan>
From: "Jiang Wang ." <jiang.wang@bytedance.com>
Date: Mon, 21 Jun 2021 10:25:27 -0700
Message-ID: <CAP_N_Z8+-ObttNsk7YZSdFcRpso5YHJTVqgerPpB0TvMMtj7WA@mail.gmail.com>
Subject: Re: [External] Re: [RFC v1 5/6] vhost/vsock: add kconfig for vhost
 dgram support
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: Lu Wei <luwei32@huawei.com>, cong.wang@bytedance.com,
 Xiongchun Duan <duanxiongchun@bytedance.com>,
 Andra Paraschiv <andraprs@amazon.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Networking <netdev@vger.kernel.org>,
 linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 virtualization@lists.linux-foundation.org,
 Yongji Xie <xieyongji@bytedance.com>,
 =?UTF-8?B?5p+056iz?= <chaiwen.cc@bytedance.com>,
 Norbert Slusarek <nslusarek@gmx.net>, Stefan Hajnoczi <stefanha@redhat.com>,
 Colin Ian King <colin.king@canonical.com>, Jakub Kicinski <kuba@kernel.org>,
 Arseny Krasnov <arseny.krasnov@kaspersky.com>, Ingo Molnar <mingo@redhat.com>,
 "David S. Miller" <davem@davemloft.net>,
 Alexander Popov <alex.popov@linux.com>
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

On Fri, Jun 18, 2021 at 2:54 AM Stefano Garzarella <sgarzare@redhat.com> wrote:
>
> On Wed, Jun 09, 2021 at 11:24:57PM +0000, Jiang Wang wrote:
> >Also change number of vqs according to the config
> >
> >Signed-off-by: Jiang Wang <jiang.wang@bytedance.com>
> >---
> > drivers/vhost/Kconfig |  8 ++++++++
> > drivers/vhost/vsock.c | 11 ++++++++---
> > 2 files changed, 16 insertions(+), 3 deletions(-)
>
> As we already discussed, I think we don't need this patch.

Sure. will do

> Thanks,
> Stefano
>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
