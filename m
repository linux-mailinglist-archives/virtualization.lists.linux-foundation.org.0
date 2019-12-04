Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id A8FDE112D17
	for <lists.virtualization@lfdr.de>; Wed,  4 Dec 2019 14:59:02 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 55E0386B0E;
	Wed,  4 Dec 2019 13:59:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5lZHD-GxW1cB; Wed,  4 Dec 2019 13:59:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id AE20D86AE9;
	Wed,  4 Dec 2019 13:59:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8C43EC18DD;
	Wed,  4 Dec 2019 13:59:00 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6AEA9C077D
 for <virtualization@lists.linux-foundation.org>;
 Wed,  4 Dec 2019 13:58:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 53EB022DDB
 for <virtualization@lists.linux-foundation.org>;
 Wed,  4 Dec 2019 13:58:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gM5Vyqdr2oym
 for <virtualization@lists.linux-foundation.org>;
 Wed,  4 Dec 2019 13:58:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by silver.osuosl.org (Postfix) with ESMTPS id 7D65622D0D
 for <virtualization@lists.linux-foundation.org>;
 Wed,  4 Dec 2019 13:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Mime-Version:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1O3RASwSBQtukZSsiULD4Oz8VPMmlubHuY7PxIAb5yg=; b=DQlqMhee5t6rs7/yLDNfMIzRx
 2PC5TdPG/McP0TnA7ja0ZmSD6npxQ7/Vxl60N407jJm82Ly/lFfjczxz27RjppptRB12qVMYbnyve
 cywGhi/oMKg6zgHUAgzo1886oi0C3ZlEjc1+4B42dFffXprOj++Ht0NIaM87lzg63sxti+ekXbhlj
 MQ1efmvUdK2e8xxFbXIWeNd2ebuUcvF1kXF49ZrubBVX9V2M3y5C5FbOATt/OPJ1MJnAIjqQgyOWb
 cR25AeTiCXfoOE6gWsgV+6gM1ko7oplDCjzaX/nhfDq6UVFWTsPgfhcjmhhR7q2oqWQImqnrMHTCI
 e4c+pIbOw==;
Received: from [54.239.6.185] (helo=u0c626add9cce5a.drs10.amazon.com)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1icVB8-0001fV-4J; Wed, 04 Dec 2019 13:58:54 +0000
Message-ID: <108357faa8d7add057a8dc0870b42c482eec34ee.camel@infradead.org>
Subject: Re: [PATCH v3] virtio_console: allocate inbufs in add_port() only
 if it is needed
From: Amit Shah <amit@infradead.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Date: Wed, 04 Dec 2019 14:58:51 +0100
In-Reply-To: <20191203103840-mutt-send-email-mst@kernel.org>
References: <20191114122548.24364-1-lvivier@redhat.com>
 <ae3451423c18f2e408245d745d1f28e311a2845c.camel@infradead.org>
 <20191203103840-mutt-send-email-mst@kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Cc: Laurent Vivier <lvivier@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, virtualization@lists.linux-foundation.org
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

On Tue, 2019-12-03 at 10:42 -0500, Michael S. Tsirkin wrote:
> On Tue, Dec 03, 2019 at 03:46:50PM +0100, Amit Shah wrote:
> > On Thu, 2019-11-14 at 13:25 +0100, Laurent Vivier wrote:
> > > When we hot unplug a virtserialport and then try to hot plug
> > > again,
> > > it fails:
> > > 
> > > (qemu) chardev-add
> > > socket,id=serial0,path=/tmp/serial0,server,nowait
> > > (qemu) device_add virtserialport,bus=virtio-serial0.0,nr=2,\
> > >                   chardev=serial0,id=serial0,name=serial0
> > > (qemu) device_del serial0
> > > (qemu) device_add virtserialport,bus=virtio-serial0.0,nr=2,\
> > >                   chardev=serial0,id=serial0,name=serial0
> > > kernel error:
> > >   virtio-ports vport2p2: Error allocating inbufs
> > > qemu error:
> > >   virtio-serial-bus: Guest failure in adding port 2 for device \
> > >                      virtio-serial0.0
> > > 
> > > This happens because buffers for the in_vq are allocated when the
> > > port is
> > > added but are not released when the port is unplugged.
> > > 
> > > They are only released when virtconsole is removed (see
> > > a7a69ec0d8e4)
> > > 
> > > To avoid the problem and to be symmetric, we could allocate all
> > > the
> > > buffers
> > > in init_vqs() as they are released in remove_vqs(), but it sounds
> > > like
> > > a waste of memory.
> > > 
> > > Rather than that, this patch changes add_port() logic to ignore
> > > ENOSPC
> > > error in fill_queue(), which means queue has already been filled.
> > > 
> > > Fixes: a7a69ec0d8e4 ("virtio_console: free buffers after reset")
> > > Cc: mst@redhat.com
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> > 
> > Reviewed-by: Amit Shah <amit@kernel.org>
> > 
> > Thanks!
> 
> 
> Thanks, however this has already been merged by Linus.
> I can't add the tag retroactively, sorry about that.

Right, no problem - but I wanted to ensure it's on-list :)

> 
> For bugfix patches like that, I think we can reasonably
> target a turn around of a couple of days, these
> shouldn't really need to wait weeks for review.

Sure, thanks for picking it up fast enough.  Life happens, etc., and
it's not always possible to reply in a couple of days.  Since we had
already covered the main comments in v1 and v2, v3 wasn't going to need
much attention anyway.


_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
