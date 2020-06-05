Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2BA1EF241
	for <lists.virtualization@lfdr.de>; Fri,  5 Jun 2020 09:39:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5DF6D889FE;
	Fri,  5 Jun 2020 07:39:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id owC+A9SymNsR; Fri,  5 Jun 2020 07:39:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id C92B7889AB;
	Fri,  5 Jun 2020 07:39:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B75C0C016E;
	Fri,  5 Jun 2020 07:39:40 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D85B8C016E
 for <virtualization@lists.linux-foundation.org>;
 Fri,  5 Jun 2020 07:39:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id C1C8D889AB
 for <virtualization@lists.linux-foundation.org>;
 Fri,  5 Jun 2020 07:39:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id epzbvTYJAORO
 for <virtualization@lists.linux-foundation.org>;
 Fri,  5 Jun 2020 07:39:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 762F78899A
 for <virtualization@lists.linux-foundation.org>;
 Fri,  5 Jun 2020 07:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591342776;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HhMc+d91L3zYiW99EmslarMDb7Iy+cphIwMBvcR3gAk=;
 b=YBgjJpjOWGCT0Owz3UB7/J615Wyx6tGhmrTopdIiK1ekbwmieDYxOxuBM8uAr74HOnb/S/
 HvRp5Yg1CaDEZoQKTkCBjV36njkSUB4OrqC17fQRnB7MYPMvlkHXXtcGoHZGdQh3nHxzKA
 4QTQT8yo//ki3OAOjEuqzle8QofAS28=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-280-MK3r3kGGPaK3OXCo4l8cfA-1; Fri, 05 Jun 2020 03:39:16 -0400
X-MC-Unique: MK3r3kGGPaK3OXCo4l8cfA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 288031B18BC2;
 Fri,  5 Jun 2020 07:39:15 +0000 (UTC)
Received: from gondolin (ovpn-113-2.ams2.redhat.com [10.36.113.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A31007B5F2;
 Fri,  5 Jun 2020 07:39:10 +0000 (UTC)
Date: Fri, 5 Jun 2020 09:39:07 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Halil Pasic <pasic@linux.ibm.com>, Heiko Carstens
 <heiko.carstens@de.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Christian
 Borntraeger <borntraeger@de.ibm.com>, "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH] s390/virtio: remove unused pm callbacks
Message-ID: <20200605093907.4d4b3c2a.cohuck@redhat.com>
In-Reply-To: <20200604234421.4ada966b.pasic@linux.ibm.com>
References: <20200526093629.257649-1-cohuck@redhat.com>
 <20200604234421.4ada966b.pasic@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Cc: linux-s390@vger.kernel.org, kvm@vger.kernel.org,
 virtualization@lists.linux-foundation.org
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

On Thu, 4 Jun 2020 23:44:21 +0200
Halil Pasic <pasic@linux.ibm.com> wrote:

> On Tue, 26 May 2020 11:36:29 +0200
> Cornelia Huck <cohuck@redhat.com> wrote:
> 
> > Support for hibernation on s390 has been recently been removed with

s/been recently been removed/recently been removed/

> > commit 394216275c7d ("s390: remove broken hibernate / power management
> > support"), no need to keep unused code around.
> > 
> > Signed-off-by: Cornelia Huck <cohuck@redhat.com>  
> 
> Reviewed-by: Halil Pasic <pasic@linux.ibm.com>

Thanks!

As this is only a single patch, I think a pull request is a bit
overkill, so it would probably be best for someone to pick this
directly.

s390 arch maintainers? Michael?

> 
> > ---
> >  drivers/s390/virtio/virtio_ccw.c | 26 --------------------------
> >  1 file changed, 26 deletions(-)
> > 
> > diff --git a/drivers/s390/virtio/virtio_ccw.c b/drivers/s390/virtio/virtio_ccw.c
> > index 957889a42d2e..5730572b52cd 100644
> > --- a/drivers/s390/virtio/virtio_ccw.c
> > +++ b/drivers/s390/virtio/virtio_ccw.c
> > @@ -1372,27 +1372,6 @@ static struct ccw_device_id virtio_ids[] = {
> >  	{},
> >  };
> >  
> > -#ifdef CONFIG_PM_SLEEP
> > -static int virtio_ccw_freeze(struct ccw_device *cdev)
> > -{
> > -	struct virtio_ccw_device *vcdev = dev_get_drvdata(&cdev->dev);
> > -
> > -	return virtio_device_freeze(&vcdev->vdev);
> > -}
> > -
> > -static int virtio_ccw_restore(struct ccw_device *cdev)
> > -{
> > -	struct virtio_ccw_device *vcdev = dev_get_drvdata(&cdev->dev);
> > -	int ret;
> > -
> > -	ret = virtio_ccw_set_transport_rev(vcdev);
> > -	if (ret)
> > -		return ret;
> > -
> > -	return virtio_device_restore(&vcdev->vdev);
> > -}
> > -#endif
> > -
> >  static struct ccw_driver virtio_ccw_driver = {
> >  	.driver = {
> >  		.owner = THIS_MODULE,
> > @@ -1405,11 +1384,6 @@ static struct ccw_driver virtio_ccw_driver = {
> >  	.set_online = virtio_ccw_online,
> >  	.notify = virtio_ccw_cio_notify,
> >  	.int_class = IRQIO_VIR,
> > -#ifdef CONFIG_PM_SLEEP
> > -	.freeze = virtio_ccw_freeze,
> > -	.thaw = virtio_ccw_restore,
> > -	.restore = virtio_ccw_restore,
> > -#endif
> >  };
> >  
> >  static int __init pure_hex(char **cp, unsigned int *val, int min_digit,  
> 

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
