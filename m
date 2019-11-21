Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C37F104FFE
	for <lists.virtualization@lfdr.de>; Thu, 21 Nov 2019 11:05:22 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 2F7FD2151E;
	Thu, 21 Nov 2019 10:05:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YanqT-4v8g6J; Thu, 21 Nov 2019 10:05:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 7D41D204D0;
	Thu, 21 Nov 2019 10:05:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6139EC1DDA;
	Thu, 21 Nov 2019 10:05:20 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9F72CC18DA
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 Nov 2019 10:05:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 840B1887DC
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 Nov 2019 10:05:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2BJWaxOaovKD
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 Nov 2019 10:05:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 8E7DE886EA
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 Nov 2019 10:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574330716;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mTbZEMwYfOT6jDofWQMm684EqH0d5BOVG5EfNCsfnNw=;
 b=Q4JfqNQ26ceaZUOLRk1+HNDwT9CCXyQgcDevUplomn2HAaCofHu7vnh8Y9XWujjZ0RMm9Y
 hXbplEXz82CdfEwbKoRcUSALmSpYJOhjZV7OgvMkJ3fghANovYdxpR2wkJ+AEwk7dDPkE3
 3L6lXYvUIbjU8Rzkp+q4cIYDEY6OonA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-142-m78ryESFO3SlbOH0UpMiEQ-1; Thu, 21 Nov 2019 05:05:14 -0500
Received: by mail-wm1-f72.google.com with SMTP id f191so1581495wme.1
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 Nov 2019 02:05:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=WjBe/bpFfR8YjJaRZQ403Que5OIq9zts89mo41qWm30=;
 b=R5vTZYb/4KD1wBonrX+dqYuQ+HfK6TxHPSQqVs9eJKmFlFFqCKlHAlZqZsaR/46aNb
 W1k6rCmU8EetEl7Icn3xggyrjff3NL7Asvjs3SerTSxLJm56+f03GHtw5eKf14+cmEPW
 LiJRZzIIaQD7paRiCIs6Sm3VAdeN/1o763+EgfnTnt1VYrS6PyNaszdQqZMhZnkNT36J
 FUKLpU0v9d3ngovZbL+XQyD5jGHv5Dcct95ElVBO3HyTm9wgDbTBt3XAdXQQg/94P74s
 qdY6VMz3wWPXLcxcP8WbSYEMTForkCx/07Fn55bqdPoeEVKTwcPILIY0gRdTxqaopFga
 y8WQ==
X-Gm-Message-State: APjAAAWC5be502Zp90fitYpk05Ml+UcM2CntfCyGVbCXvVLtifTdekeE
 +eYlMxmy+wxpJKNdm8F9/KFeCwLl23obTD0jZSLn9dngsmltZlDfoH5iJDTvb2j8HnOX4MXMUmv
 hibvh1nUs0o7b0BBXJFZejqetfPo1xQh929/wzLVCxw==
X-Received: by 2002:a1c:7d16:: with SMTP id y22mr8565193wmc.106.1574330713223; 
 Thu, 21 Nov 2019 02:05:13 -0800 (PST)
X-Google-Smtp-Source: APXvYqyOlfVU/bWpGIHnKv57s8kK3m5vYZ/Pt8KTmBF8V0SJrqfD//MnSWSTdrBYEv5kqItZozpMBg==
X-Received: by 2002:a1c:7d16:: with SMTP id y22mr8565167wmc.106.1574330712947; 
 Thu, 21 Nov 2019 02:05:12 -0800 (PST)
Received: from steredhat (a-nu5-32.tin.it. [212.216.181.31])
 by smtp.gmail.com with ESMTPSA id 17sm2273656wmg.19.2019.11.21.02.05.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2019 02:05:12 -0800 (PST)
Date: Thu, 21 Nov 2019 11:05:10 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Subject: Re: [PATCH net-next 0/6] vsock: add local transport support
Message-ID: <20191121100510.7gdcx7c3qom2f3wo@steredhat>
References: <20191119110121.14480-1-sgarzare@redhat.com>
 <20191121094643.GD439743@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <20191121094643.GD439743@stefanha-x1.localdomain>
X-MC-Unique: m78ryESFO3SlbOH0UpMiEQ-1
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

On Thu, Nov 21, 2019 at 09:46:43AM +0000, Stefan Hajnoczi wrote:
> On Tue, Nov 19, 2019 at 12:01:15PM +0100, Stefano Garzarella wrote:
> > This series introduces a new transport (vsock_loopback) to handle
> > local communication.
> > This could be useful to test vsock core itself and to allow developers
> > to test their applications without launching a VM.
> > 
> > Before this series, vmci and virtio transports allowed this behavior,
> > but only in the guest.
> > We are moving the loopback handling in a new transport, because it
> > might be useful to provide this feature also in the host or when
> > no H2G/G2H transports (hyperv, virtio, vmci) are loaded.
> > 
> > The user can use the loopback with the new VMADDR_CID_LOCAL (that
> > replaces VMADDR_CID_RESERVED) in any condition.
> > Otherwise, if the G2H transport is loaded, it can also use the guest
> > local CID as previously supported by vmci and virtio transports.
> > If G2H transport is not loaded, the user can also use VMADDR_CID_HOST
> > for local communication.
> > 
> > Patch 1 is a cleanup to build virtio_transport_common without virtio
> > Patch 2 adds the new VMADDR_CID_LOCAL, replacing VMADDR_CID_RESERVED
> > Patch 3 adds a new feature flag to register a loopback transport
> > Patch 4 adds the new vsock_loopback transport based on the loopback
> >         implementation of virtio_transport
> > Patch 5 implements the logic to use the local transport for loopback
> >         communication
> > Patch 6 removes the loopback from virtio_transport
> > 
> > @Jorgen: Do you think it might be a problem to replace
> > VMADDR_CID_RESERVED with VMADDR_CID_LOCAL?
> > 
> > Thanks,
> > Stefano
> > 
> > Stefano Garzarella (6):
> >   vsock/virtio_transport_common: remove unused virtio header includes
> >   vsock: add VMADDR_CID_LOCAL definition
> >   vsock: add local transport support in the vsock core
> >   vsock: add vsock_loopback transport
> >   vsock: use local transport when it is loaded
> >   vsock/virtio: remove loopback handling
> > 
> >  MAINTAINERS                             |   1 +
> >  include/net/af_vsock.h                  |   2 +
> >  include/uapi/linux/vm_sockets.h         |   8 +-
> >  net/vmw_vsock/Kconfig                   |  12 ++
> >  net/vmw_vsock/Makefile                  |   1 +
> >  net/vmw_vsock/af_vsock.c                |  49 +++++-
> >  net/vmw_vsock/virtio_transport.c        |  61 +------
> >  net/vmw_vsock/virtio_transport_common.c |   3 -
> >  net/vmw_vsock/vmci_transport.c          |   2 +-
> >  net/vmw_vsock/vsock_loopback.c          | 217 ++++++++++++++++++++++++
> >  10 files changed, 283 insertions(+), 73 deletions(-)
> >  create mode 100644 net/vmw_vsock/vsock_loopback.c
> 
> Please see my comments.  Otherwise:
> 
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

Thanks!
I'll send a v2 following your comments.

Stefano

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
