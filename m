Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC3C13C547
	for <lists.virtualization@lfdr.de>; Wed, 15 Jan 2020 15:14:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id F057981AE8;
	Wed, 15 Jan 2020 14:14:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nEVQAwWvoAUH; Wed, 15 Jan 2020 14:14:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1CCA881ECF;
	Wed, 15 Jan 2020 14:14:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F2BECC077D;
	Wed, 15 Jan 2020 14:14:06 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 65E12C077D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jan 2020 14:14:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 54E0986947
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jan 2020 14:14:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4P6UWvIVBLII
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jan 2020 14:13:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by hemlock.osuosl.org (Postfix) with ESMTPS id BBC31866B3
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jan 2020 14:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579097637;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nM8PRIxkmwBclCVDrfwCpSyiQy0HRF6zA3gXQvGKSRs=;
 b=MU3S+Rl17meGSry9Q8FhzjdK0ZWqk+U4ewhW96M7W9izK9HDK4+VV9yRqziXlbk1NnsLhI
 yAtaElpgzn7bRrAwGIzN9N3iwwKQfHNpM5AQjqrWV2x3kx8NcxRtsQfLR2jOBgyrsEXH4U
 RW5vNc3fnFyu8iYmbyqJ1npZ0jmx0rA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-38-tRQkuM8UOy6G8jDB5xPbMw-1; Wed, 15 Jan 2020 09:13:55 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E92D0189CD20;
 Wed, 15 Jan 2020 14:13:54 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-106.ams2.redhat.com
 [10.36.116.106])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A6AA67DB4B;
 Wed, 15 Jan 2020 14:13:54 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D3C1F784F; Wed, 15 Jan 2020 15:13:53 +0100 (CET)
Date: Wed, 15 Jan 2020 15:13:53 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: bochs_hw_init fails to request framebuffer on EFI boot with
 plymouth visible
Message-ID: <20200115141353.3kse3uj2mg6ik6k5@sirius.home.kraxel.org>
References: <20200110163211.GB29736@mail-itl>
 <20200113071939.rtqb7yw45zi63fqy@sirius.home.kraxel.org>
 <20200115003356.GL2507@mail-itl>
 <20200115100821.qcdraolkoki6e5tz@sirius.home.kraxel.org>
 <20200115134119.GP1314@mail-itl>
MIME-Version: 1.0
In-Reply-To: <20200115134119.GP1314@mail-itl>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: tRQkuM8UOy6G8jDB5xPbMw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: virtualization@lists.linux-foundation.org
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

  Hi,

> > And "grep -A1 0000:00:02.0 /proc/iomem" ?
> 
>   c0000000-c0ffffff : 0000:00:02.0
>   c1000000-c103ffff : 0000:00:04.0

So no reservation left.  Whatever blocked the pci bar resource (efifb
probably) is gone now.

So the interesting question is why that reservation sticked long enough
to prevent bochs-drm from initializing.  In theory efifb de-init should
be completed when drm_fb_helper_remove_conflicting_pci_framebuffers()
returns.

Bisecting could help, or springkling printk's into efifb ...

> [46921.562805] fbcon: bochs-drmdrmfb (fb0) is primary device
> [46921.562808] fbcon: Deferring console take-over

I think that is just some eye candy which delays fbcon init until
something is actually printed.

Try "echo hello world > /dev/tty0".
Maybe tapping enter (to make getty re-print the login prompt) works too.

cheers,
  Gerd

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
