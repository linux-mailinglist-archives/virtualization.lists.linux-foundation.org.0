Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 98313144E60
	for <lists.virtualization@lfdr.de>; Wed, 22 Jan 2020 10:13:33 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id E308B8639B;
	Wed, 22 Jan 2020 09:13:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wht9GCI0HueA; Wed, 22 Jan 2020 09:13:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1476286841;
	Wed, 22 Jan 2020 09:13:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DC21EC1D81;
	Wed, 22 Jan 2020 09:13:30 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 88BE0C0174
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jan 2020 09:13:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 6C9EE87C66
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jan 2020 09:13:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fqmPAkjJxeqp
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jan 2020 09:13:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id E518287B92
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jan 2020 09:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579684405;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VCjUlObpobjgu0XJb3W7s5ESBT52LecxoFq9/8IzvlQ=;
 b=LNWKvdx/hPzhnrCN0Pq6MPISzkwdWNwYjeJciYvfNxmHNhheX8aS/pGq7NksyisCsFS6Xo
 9CFfoAjJVDAhlRalWUJQyE3s6qu2LqhMG8mwWrhThiXWZaoOuPVth5yF+T6QbGpGvCC/Sy
 BR9TeKFFl927XFTylsaRc/xn1x/JlLg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-414-bPJJXmrNPI2xLzgfMKWqoA-1; Wed, 22 Jan 2020 04:13:21 -0500
Received: by mail-wm1-f70.google.com with SMTP id n17so1107990wmk.1
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jan 2020 01:13:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VCjUlObpobjgu0XJb3W7s5ESBT52LecxoFq9/8IzvlQ=;
 b=rnRrPFSYXqUFISRVhWQeYowvn1tvoU0U4rvAHLW7xhCzw3gM+3rFsQN5zwJg3NRJO1
 kOwENVLkP2gw4PMNtAGKQf9XJQwmAS0FwVlcpY8Clime64ml6lYk8KJR7cOl4IYV+htc
 1VRqpKgntOEtYU6rVsOKhJRZP47PNJC0ryw6eY1UnD1SUhDi6B89h2G9OqFEcdML2bcJ
 VdnSzFeCyivOfUKyPdqNLIgUGzqaUaplBlkvn3t81CtEiqCT7bVdzeZzbZlW0E2eFuEZ
 nT6OzHswLYVHPnCOAaSPp6z3h550O7DSyKY7dMYeknU4rWEPwvul/LTyO58/bTyMYwGD
 wv4A==
X-Gm-Message-State: APjAAAU2BEwiLsH5Erwrwmzx5P4hBMmGZ1z/2A4DzBH/Ye1paqlpJ/R0
 rFBP5PKvO7LvlE4euTcvcq+xKYTcVjDNhJs+E7rhvJFLdAgk7+zXShKPKlurDwfG91XMsXEPFyq
 Qlse/z8oFt4q3WO+8xvSch5u0pRjw3UZRcAzs/IVicA==
X-Received: by 2002:a1c:f008:: with SMTP id a8mr1830058wmb.81.1579684400348;
 Wed, 22 Jan 2020 01:13:20 -0800 (PST)
X-Google-Smtp-Source: APXvYqyOAUFw7NHJnIEiOuVrzpIIsJ1Hl4WYbzk9zmGk9s6D1DD6KOiSk9oXHOw1MLOs5RZStZA8sQ==
X-Received: by 2002:a1c:f008:: with SMTP id a8mr1830038wmb.81.1579684400178;
 Wed, 22 Jan 2020 01:13:20 -0800 (PST)
Received: from steredhat (host84-49-dynamic.31-79-r.retail.telecomitalia.it.
 [79.31.49.84])
 by smtp.gmail.com with ESMTPSA id r15sm3049648wmh.21.2020.01.22.01.13.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jan 2020 01:13:19 -0800 (PST)
Date: Wed, 22 Jan 2020 10:13:16 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH net-next 0/3] vsock: support network namespace
Message-ID: <20200122091316.zduzvy2txtyqty2p@steredhat>
References: <20200116172428.311437-1-sgarzare@redhat.com>
 <20200121155053.GD641751@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <20200121155053.GD641751@stefanha-x1.localdomain>
X-MC-Unique: bPJJXmrNPI2xLzgfMKWqoA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: linux-hyperv@vger.kernel.org, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, netdev@vger.kernel.org,
 Dexuan Cui <decui@microsoft.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, davem@davemloft.net,
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

On Tue, Jan 21, 2020 at 03:50:53PM +0000, Stefan Hajnoczi wrote:
> What should vsock_dev_do_ioctl() IOCTL_VM_SOCKETS_GET_LOCAL_CID return?
> The answer is probably dependent on the caller's network namespace.

Right, and I'm not handling this case. I'll fix!

> 
> Ultimately we may need per-namespace transports.  Imagine assigning a
> G2H transport to a specific network namespace.

Agree.

> 
> vsock_stream_connect() needs to be namespace-aware so that other
> namespaces cannot use the G2H transport to send a connection
> establishment packet.

Right, maybe I can change the vsock_assign_transport() to check if a
transport can be assigned to a socket, checking the namespace.

I'll send a v2 handling these cases and implementing the Michael's idea
about /dev/vhost-vsock-netns

Thanks,
Stefano

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
