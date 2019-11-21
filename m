Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id A821010556B
	for <lists.virtualization@lfdr.de>; Thu, 21 Nov 2019 16:25:30 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4EFB487FA5;
	Thu, 21 Nov 2019 15:25:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GTscxkKC5X-P; Thu, 21 Nov 2019 15:25:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id A58F487FB0;
	Thu, 21 Nov 2019 15:25:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 836DDC18DA;
	Thu, 21 Nov 2019 15:25:27 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 61504C18DA
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 Nov 2019 15:25:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 501EE25048
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 Nov 2019 15:25:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MkfDuq9AN65r
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 Nov 2019 15:25:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by silver.osuosl.org (Postfix) with ESMTPS id 0F0D4227F7
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 Nov 2019 15:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574349922;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kBm3B1uW0ATy8DLnD/N50So/7howYiU9bWi3eGPQ8KQ=;
 b=U2LSNsuvYYvyBOyld26j2LBa4TxZ6U8TPJhSEPAN3pN0LQrzTMhYIxIZXnw5TN/9aDDV7+
 HA6P9IC1bC/dGkUCzkvtrVLfULD4Oo98TAinubTU1ce4QYevGU+wpzOPrz/iHJnsMJFYG2
 ZyxGVwjHeQ/3z5TvbwH1w5HycucQ4z0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-278-arAcuNytP3meVeUkPCTXYA-1; Thu, 21 Nov 2019 10:25:21 -0500
Received: by mail-wm1-f71.google.com with SMTP id g14so1942856wmk.9
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 Nov 2019 07:25:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Luh/FRsdrygdtryuzjcgAMyRo3l6t+Zhjzz9aLHJ0EU=;
 b=XfZSpqQDB5Ak57Kq1U6fJSJDpmfQaRlEF3H7VkVrm4KyuGg17v2sN5Qq8r45jvqJZu
 HCiyRwYydo+kVM0zNeNwvXN1ZENeqNOvW2tgJqDRAEp+B9VQGVqZjZb2cf5sMOOoNTeN
 B7aDXunfXNMyq6W9bDR7xm1uO4fsv8+VqqpsuT1PhL3bPjASj+sbcqlK7Er7rFQLul8B
 Rub9hb18ONFtlgWoexYDw/B2vwZc2kpD7Dol30u8lHGZPQAiKFn93jxYciONMqqOWqlr
 Ezgx+Dq1jwc5t4h+1FSHFCAMpB77Vjebn/b6tOZqCgsL+QL0WPOhunwbSXxp9XI37CVx
 vcRA==
X-Gm-Message-State: APjAAAXbCZMyvz+N4JmCFL4UpQlq1fk6ysNtvhpTUuNPsQ1/OhQQJGkc
 edsDyNeSooTRijrV1ySE8v7JPnYyS2jv1nJMcy64B2S4Pg/Zbie8eYbDAqVbWDDxTXdxWuWX3KI
 t9A6yhkDhB5bArbKpbnVckbaBBYy0YzyrJGZGeOpJ5A==
X-Received: by 2002:a05:600c:2410:: with SMTP id
 16mr10111953wmp.36.1574349920264; 
 Thu, 21 Nov 2019 07:25:20 -0800 (PST)
X-Google-Smtp-Source: APXvYqw6kCXHNhqyKfZOnNRC+6rkdzH+5TteBCvmm65ewNpd7LRKY0hfW8ym9t1TkIRcJ7FqzYeccA==
X-Received: by 2002:a05:600c:2410:: with SMTP id
 16mr10111918wmp.36.1574349919938; 
 Thu, 21 Nov 2019 07:25:19 -0800 (PST)
Received: from steredhat (a-nu5-32.tin.it. [212.216.181.31])
 by smtp.gmail.com with ESMTPSA id w17sm3864052wrt.45.2019.11.21.07.25.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2019 07:25:19 -0800 (PST)
Date: Thu, 21 Nov 2019 16:25:17 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Subject: Re: [PATCH net-next 4/6] vsock: add vsock_loopback transport
Message-ID: <20191121152517.zfedz6hg6ftcb2ks@steredhat>
References: <20191119110121.14480-1-sgarzare@redhat.com>
 <20191119110121.14480-5-sgarzare@redhat.com>
 <20191121093458.GB439743@stefanha-x1.localdomain>
 <20191121095948.bc7lc3ptsh6jxizw@steredhat>
MIME-Version: 1.0
In-Reply-To: <20191121095948.bc7lc3ptsh6jxizw@steredhat>
X-MC-Unique: arAcuNytP3meVeUkPCTXYA-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
Cc: kvm@vger.kernel.org, netdev@vger.kernel.org,
 Dexuan Cui <decui@microsoft.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Stefan Hajnoczi <stefanha@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 Jorgen Hansen <jhansen@vmware.com>
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

On Thu, Nov 21, 2019 at 10:59:48AM +0100, Stefano Garzarella wrote:
> On Thu, Nov 21, 2019 at 09:34:58AM +0000, Stefan Hajnoczi wrote:
> > On Tue, Nov 19, 2019 at 12:01:19PM +0100, Stefano Garzarella wrote:
> > 
> > Ideas for long-term changes below.
> > 
> > Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> > 
> 
> Thanks for reviewing!
> 
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 760049454a23..c2a3dc3113ba 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -17239,6 +17239,7 @@ F:	net/vmw_vsock/diag.c
> > >  F:	net/vmw_vsock/af_vsock_tap.c
> > >  F:	net/vmw_vsock/virtio_transport_common.c
> > >  F:	net/vmw_vsock/virtio_transport.c
> > > +F:	net/vmw_vsock/vsock_loopback.c
> > >  F:	drivers/net/vsockmon.c
> > >  F:	drivers/vhost/vsock.c
> > >  F:	tools/testing/vsock/
> > 
> > At this point you are most active in virtio-vsock and I am reviewing
> > patches on a best-effort basis.  Feel free to add yourself as
> > maintainer.
> > 
> 
> Sure, I'd be happy to maintain it.
> 
> > > diff --git a/net/vmw_vsock/vsock_loopback.c b/net/vmw_vsock/vsock_loopback.c
> > > new file mode 100644
> > > index 000000000000..3d1c1a88305f
> > > --- /dev/null
> > > +++ b/net/vmw_vsock/vsock_loopback.c
> > > @@ -0,0 +1,217 @@
> > > +// SPDX-License-Identifier: GPL-2.0-only
> > > +/*
> > > + * loopback transport for vsock using virtio_transport_common APIs
> > > + *
> > > + * Copyright (C) 2013-2019 Red Hat, Inc.
> > > + * Author: Asias He <asias@redhat.com>
> > > + *         Stefan Hajnoczi <stefanha@redhat.com>
> > > + *         Stefano Garzarella <sgarzare@redhat.com>
> > > + *
> > > + */
> > > +#include <linux/spinlock.h>
> > > +#include <linux/module.h>
> > > +#include <linux/list.h>
> > > +#include <linux/virtio_vsock.h>
> > 
> > Is it time to rename the generic functionality in
> > virtio_transport_common.c?  This doesn't have anything to do with virtio
> > :).
> > 
> 
> Completely agree, new transports could use it to handle the protocol without
> reimplementing things already done.
> 
> > > +
> > > +static struct workqueue_struct *vsock_loopback_workqueue;
> > > +static struct vsock_loopback *the_vsock_loopback;
> > 
> > the_vsock_loopback could be a static global variable (not a pointer) and
> > vsock_loopback_workqueue could also be included in the struct.
> > 
> > The RCU pointer is really a way to synchronize vsock_loopback_send_pkt()
> > and vsock_loopback_cancel_pkt() with module exit.  There is no other
> > reason for using a pointer.
> > 
> > It's cleaner to implement the synchronization once in af_vsock.c (or
> > virtio_transport_common.c) instead of making each transport do it.
> > Maybe try_module_get() and related APIs provide the necessary semantics
> > so that core vsock code can hold the transport module while it's being
> > used to send/cancel a packet.
> 
> Right, the module cannot be unloaded until open sockets, so here the
> synchronization is not needed.
> 
> The synchronization come from virtio-vsock device that can be
> hot-unplugged while sockets are still open, but that can't happen here.
> 
> I will remove the pointers and RCU in the v2.
> 
> Can I keep your R-b or do you prefer to watch v2 first?
> 
> > 
> > > +MODULE_ALIAS_NETPROTO(PF_VSOCK);
> > 
> > Why does this module define the alias for PF_VSOCK?  Doesn't another
> > module already define this alias?
> 
> It is a way to load this module when PF_VSOCK is starting to be used.
> MODULE_ALIAS_NETPROTO(PF_VSOCK) is already defined in vmci_transport
> and hyperv_transport. IIUC it is used for the same reason.
> 
> In virtio_transport we don't need it because it will be loaded when
> the PCI device is discovered.
> 
> Do you think there's a better way?
> Should I include the vsock_loopback transport directly in af_vsock
> without creating a new module?
> 

That last thing I said may not be possible:
I remembered that I tried, but DEPMOD found a cyclic dependency because
vsock_transport use virtio_transport_common that use vsock, so if I
include vsock_transport in the vsock module, DEPMOD is not happy.

Do you think it's okay in this case to keep MODULE_ALIAS_NETPROTO(PF_VSOCK)
or is there a better way?

Thanks,
Stefano

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
