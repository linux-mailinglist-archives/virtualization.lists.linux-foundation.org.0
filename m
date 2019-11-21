Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 31648104FDF
	for <lists.virtualization@lfdr.de>; Thu, 21 Nov 2019 11:00:02 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 703D9887EB;
	Thu, 21 Nov 2019 10:00:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U-wskjpsSV7o; Thu, 21 Nov 2019 09:59:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7BE23887CA;
	Thu, 21 Nov 2019 09:59:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5B87EC18DA;
	Thu, 21 Nov 2019 09:59:59 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 98A2FC18DA
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 Nov 2019 09:59:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 8292786F4E
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 Nov 2019 09:59:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z2qZcLDGrbQX
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 Nov 2019 09:59:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 4E27486EB9
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 Nov 2019 09:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574330395;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yt8HpiGqxds2OMjKtJNRUWY5kPKw9cLn1g1BZYhvSYU=;
 b=MNhdTsgT8A31ph+otYZp+yS5DkB+9Fi/T8JlpunarugpcocibB3EWMJxmyH/Gd5fTu5NM3
 RB3f4SrqUQILjQ082z28VNG1Stj2DAyCp6S8Y3b/zvHAAAOsGQwcuXiIrcNrBVCXjCS41W
 VT78RM1Vb934y4G4ScfR1iWND9Yog1E=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-9-4aLdga3QPbqtQMx26Gpprg-1; Thu, 21 Nov 2019 04:59:53 -0500
Received: by mail-wm1-f69.google.com with SMTP id f21so1317521wmh.5
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 Nov 2019 01:59:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=uJVUKucSDZy17F3anNizQDOnRpUUDTqYqO9jAnfMJpQ=;
 b=pFxsGtFg71DqN1ZpZGmujZtRsX3JywpwXztRfClUlv+weCcd7U1VXwSYMpAdHbRar6
 rW1lMSB42bfp4ySiVH6nDAhl36+T0VS5I2QZOhTqldoGIbnmjENrYJKhsQpHRjHlYv3j
 1TAFRquPL5rxjovM1CEw0nM+3NbEn+3NI14ERCOX3cdrNqwHYxsRQArDMGbyaPSNF/bp
 Ao7PCBxNRqazG6nJp2ldFjIxmtidRqDyrmKEYrLI4DS9zEY6Ka/8XoQ161Mp6OKnYQK5
 6gvLtWPzyOZP2lzjo00VfK1Wdu9XqTNGOFv7ALZJlCUPTAKstWF0xi8DienkCSp9DYRn
 BPfA==
X-Gm-Message-State: APjAAAVwOp3MV9DproY2FXZfqv/Q/AgwKbc7h+6zbdg7Uxs8aCI8u1Ib
 3VsYnludG/kTN307JhGdOhVxLlL2nHx5hWn99DDh374o/i73RbVFeTyfCAyxBOC3Ytnr9SdY44u
 DuRa7bCmrymF079nEJNK/HOaqfmdAPTzdY2VYUWEDOw==
X-Received: by 2002:a1c:6309:: with SMTP id x9mr8375553wmb.108.1574330392045; 
 Thu, 21 Nov 2019 01:59:52 -0800 (PST)
X-Google-Smtp-Source: APXvYqwPhJ9p31NlkxFdXc1WkCFoBS07DC7jz3SIB+5yTxT/Kdnf/tqFWQvPhtgZ6YH4XQmcMUxa7A==
X-Received: by 2002:a1c:6309:: with SMTP id x9mr8375533wmb.108.1574330391716; 
 Thu, 21 Nov 2019 01:59:51 -0800 (PST)
Received: from steredhat (a-nu5-32.tin.it. [212.216.181.31])
 by smtp.gmail.com with ESMTPSA id a8sm2249793wme.11.2019.11.21.01.59.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2019 01:59:51 -0800 (PST)
Date: Thu, 21 Nov 2019 10:59:48 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Subject: Re: [PATCH net-next 4/6] vsock: add vsock_loopback transport
Message-ID: <20191121095948.bc7lc3ptsh6jxizw@steredhat>
References: <20191119110121.14480-1-sgarzare@redhat.com>
 <20191119110121.14480-5-sgarzare@redhat.com>
 <20191121093458.GB439743@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <20191121093458.GB439743@stefanha-x1.localdomain>
X-MC-Unique: 4aLdga3QPbqtQMx26Gpprg-1
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

On Thu, Nov 21, 2019 at 09:34:58AM +0000, Stefan Hajnoczi wrote:
> On Tue, Nov 19, 2019 at 12:01:19PM +0100, Stefano Garzarella wrote:
> 
> Ideas for long-term changes below.
> 
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> 

Thanks for reviewing!

> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 760049454a23..c2a3dc3113ba 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -17239,6 +17239,7 @@ F:	net/vmw_vsock/diag.c
> >  F:	net/vmw_vsock/af_vsock_tap.c
> >  F:	net/vmw_vsock/virtio_transport_common.c
> >  F:	net/vmw_vsock/virtio_transport.c
> > +F:	net/vmw_vsock/vsock_loopback.c
> >  F:	drivers/net/vsockmon.c
> >  F:	drivers/vhost/vsock.c
> >  F:	tools/testing/vsock/
> 
> At this point you are most active in virtio-vsock and I am reviewing
> patches on a best-effort basis.  Feel free to add yourself as
> maintainer.
> 

Sure, I'd be happy to maintain it.

> > diff --git a/net/vmw_vsock/vsock_loopback.c b/net/vmw_vsock/vsock_loopback.c
> > new file mode 100644
> > index 000000000000..3d1c1a88305f
> > --- /dev/null
> > +++ b/net/vmw_vsock/vsock_loopback.c
> > @@ -0,0 +1,217 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * loopback transport for vsock using virtio_transport_common APIs
> > + *
> > + * Copyright (C) 2013-2019 Red Hat, Inc.
> > + * Author: Asias He <asias@redhat.com>
> > + *         Stefan Hajnoczi <stefanha@redhat.com>
> > + *         Stefano Garzarella <sgarzare@redhat.com>
> > + *
> > + */
> > +#include <linux/spinlock.h>
> > +#include <linux/module.h>
> > +#include <linux/list.h>
> > +#include <linux/virtio_vsock.h>
> 
> Is it time to rename the generic functionality in
> virtio_transport_common.c?  This doesn't have anything to do with virtio
> :).
> 

Completely agree, new transports could use it to handle the protocol without
reimplementing things already done.

> > +
> > +static struct workqueue_struct *vsock_loopback_workqueue;
> > +static struct vsock_loopback *the_vsock_loopback;
> 
> the_vsock_loopback could be a static global variable (not a pointer) and
> vsock_loopback_workqueue could also be included in the struct.
> 
> The RCU pointer is really a way to synchronize vsock_loopback_send_pkt()
> and vsock_loopback_cancel_pkt() with module exit.  There is no other
> reason for using a pointer.
> 
> It's cleaner to implement the synchronization once in af_vsock.c (or
> virtio_transport_common.c) instead of making each transport do it.
> Maybe try_module_get() and related APIs provide the necessary semantics
> so that core vsock code can hold the transport module while it's being
> used to send/cancel a packet.

Right, the module cannot be unloaded until open sockets, so here the
synchronization is not needed.

The synchronization come from virtio-vsock device that can be
hot-unplugged while sockets are still open, but that can't happen here.

I will remove the pointers and RCU in the v2.

Can I keep your R-b or do you prefer to watch v2 first?

> 
> > +MODULE_ALIAS_NETPROTO(PF_VSOCK);
> 
> Why does this module define the alias for PF_VSOCK?  Doesn't another
> module already define this alias?

It is a way to load this module when PF_VSOCK is starting to be used.
MODULE_ALIAS_NETPROTO(PF_VSOCK) is already defined in vmci_transport
and hyperv_transport. IIUC it is used for the same reason.

In virtio_transport we don't need it because it will be loaded when
the PCI device is discovered.

Do you think there's a better way?
Should I include the vsock_loopback transport directly in af_vsock
without creating a new module?

Thanks,
Stefano

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
