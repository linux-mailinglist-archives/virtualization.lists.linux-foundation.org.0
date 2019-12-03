Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC1610FC5A
	for <lists.virtualization@lfdr.de>; Tue,  3 Dec 2019 12:17:54 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id B972122621;
	Tue,  3 Dec 2019 11:17:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4dIP5BgN5jTN; Tue,  3 Dec 2019 11:17:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id A3144221F0;
	Tue,  3 Dec 2019 11:17:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8A54AC087F;
	Tue,  3 Dec 2019 11:17:51 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 39D0DC087F
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Dec 2019 11:17:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 28F2284947
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Dec 2019 11:17:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9tK9XpRXLj6t
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Dec 2019 11:17:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 5C6808488E
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Dec 2019 11:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575371867;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P0GMfVL6QAezA2eT0aIWQXB/37RirCO0eO2hEzXqpFM=;
 b=gFVruzjSiGxkv8iSoeg1Io5S3NxZaxTBgESUeQZQ3xXUqEpUivEDkZHUidoApQXUkEPDuB
 u0nRBNfzsikXj8UCFk/P/BOceSAaL6qbghGv8khWkbUhJ4lswPW6ljTFQSpr57RBFSj/2A
 P87H56lHEMkxcCdPdgrhb4HHmnbDEvI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-389--2FjruFfNOa5BOsYP-ifjA-1; Tue, 03 Dec 2019 06:17:43 -0500
Received: by mail-wm1-f70.google.com with SMTP id q21so785027wmc.7
 for <virtualization@lists.linux-foundation.org>;
 Tue, 03 Dec 2019 03:17:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8m7nF4w29pgZQB4V/SdwIROmAwTn+h+KHeQv4HnXE8M=;
 b=PBix3aaX6tSQy8jVQxFRzSfrOtrxs+4RHTq+B/pnUiWCfeqJPohVHNbWX7Auko/1EU
 gEdctMv3YPfh5WLfa24CtPWbf6jYtynPCMwRHAwmrf4vX4JAgYz58RK8LtldJT9EmQB/
 DDPP9skIld/coPBVyKjivD6/maI0+b3uGg5t/8zZdXCu4w2yBVDjyoinkDadcvO08nst
 9F4rpJQik0plDt5cIM4BkLuBoztCERaHS9bXTILPGbJqyFDFqNw4n4BqL99n4XJka5mx
 KqI9taTbicFTgoAqtP7d0ZeBnYStOesTJp2Rslcr9i7WptDcQ/FNWm8ojtwMm/axMzer
 1ZnA==
X-Gm-Message-State: APjAAAXPXgHcE+yF8k/bmgtrDtxpA/BZDtINfaQtceDWY+0FawTN+qEM
 +Dc5bZmzdAuEtSW/o4L5/EVGljAASmiOoW7yFausFajyY8HEOAj8JZP1CWKeD6IyIBlYF+GnO2S
 93MNZbx8zEytGfU/sdT9nB2SNCofc9YwS/nh7hyXsjg==
X-Received: by 2002:a5d:49c7:: with SMTP id t7mr4444059wrs.369.1575371862793; 
 Tue, 03 Dec 2019 03:17:42 -0800 (PST)
X-Google-Smtp-Source: APXvYqxHsfuHbTjkQH8eviKJ48+Nlp7C/1JLX3I4FiWaDe4+xpQuoyOM0/YkQJewOzX/cskP8i9LEw==
X-Received: by 2002:a5d:49c7:: with SMTP id t7mr4444037wrs.369.1575371862537; 
 Tue, 03 Dec 2019 03:17:42 -0800 (PST)
Received: from steredhat (host28-88-dynamic.16-87-r.retail.telecomitalia.it.
 [87.16.88.28])
 by smtp.gmail.com with ESMTPSA id p17sm3209682wrx.20.2019.12.03.03.17.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2019 03:17:41 -0800 (PST)
Date: Tue, 3 Dec 2019 12:17:39 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Subject: Re: [RFC PATCH 0/3] vsock: support network namespace
Message-ID: <20191203111739.jbxptcpmvtwg7j2g@steredhat>
References: <20191128171519.203979-1-sgarzare@redhat.com>
 <20191203092649.GB153510@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <20191203092649.GB153510@stefanha-x1.localdomain>
X-MC-Unique: -2FjruFfNOa5BOsYP-ifjA-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
Cc: linux-hyperv@vger.kernel.org, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, netdev@vger.kernel.org,
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

On Tue, Dec 03, 2019 at 09:26:49AM +0000, Stefan Hajnoczi wrote:
> On Thu, Nov 28, 2019 at 06:15:16PM +0100, Stefano Garzarella wrote:
> > Hi,
> > now that we have multi-transport upstream, I started to take a look to
> > support network namespace (netns) in vsock.
> > 
> > As we partially discussed in the multi-transport proposal [1], it could
> > be nice to support network namespace in vsock to reach the following
> > goals:
> > - isolate host applications from guest applications using the same ports
> >   with CID_ANY
> > - assign the same CID of VMs running in different network namespaces
> > - partition VMs between VMMs or at finer granularity
> > 
> > This preliminary implementation provides the following behavior:
> > - packets received from the host (received by G2H transports) are
> >   assigned to the default netns (init_net)
> > - packets received from the guest (received by H2G - vhost-vsock) are
> >   assigned to the netns of the process that opens /dev/vhost-vsock
> >   (usually the VMM, qemu in my tests, opens the /dev/vhost-vsock)
> >     - for vmci I need some suggestions, because I don't know how to do
> >       and test the same in the vmci driver, for now vmci uses the
> >       init_net
> > - loopback packets are exchanged only in the same netns
> > 
> > Questions:
> > 1. Should we make configurable the netns (now it is init_net) where
> >    packets from the host should be delivered?
> 
> Yes, it should be possible to have multiple G2H (e.g. virtio-vsock)
> devices and to assign them to different net namespaces.  Something like
> net/core/dev.c:dev_change_net_namespace() will eventually be needed.
> 

Make sense, but for now we support only one G2H.
How we can provide this feature to the userspace?
Should we interface vsock with ip-link(8)?

I don't know if initially we can provide through sysfs a way to set the
netns of the only G2H loaded.

> > 2. Should we provide an ioctl in vhost-vsock to configure the netns
> >    to use? (instead of using the netns of the process that opens
> >    /dev/vhost-vsock)
> 
> Creating the vhost-vsock instance in the process' net namespace makes
> sense.  Maybe wait for a use case before adding an ioctl.
> 

Agree.

> > 3. Should we provide a way to disable the netns support in vsock?
> 
> The code should follow CONFIG_NET_NS semantics.  I'm not sure what they
> are exactly since struct net is always defined, regardless of whether
> network namespaces are enabled.

I think that if CONFIG_NET_NS is not defined, all sockets and processes
are assigned to init_net and this RFC should work in this case, but I'll
try this case before v1.

I was thinking about the Kata's use case, I don't know if they launch the
VM in a netns and even the runtime in the host runs inside the same netns.

I'll send an e-mail to kata mailing list.

Thanks,
Stefano

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
