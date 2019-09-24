Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 1715CBC9B9
	for <lists.virtualization@lfdr.de>; Tue, 24 Sep 2019 16:04:33 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id D097BD07;
	Tue, 24 Sep 2019 14:04:25 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id A0F05D07
	for <virtualization@lists.linux-foundation.org>;
	Tue, 24 Sep 2019 14:04:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 368D1B0
	for <virtualization@lists.linux-foundation.org>;
	Tue, 24 Sep 2019 14:04:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5A2E420F0;
	Tue, 24 Sep 2019 14:04:22 +0000 (UTC)
Received: from x1.home (ovpn-118-102.phx2.redhat.com [10.3.118.102])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C6E5960C5E;
	Tue, 24 Sep 2019 14:04:13 +0000 (UTC)
Date: Tue, 24 Sep 2019 08:04:13 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH 5/6] vringh: fix copy direction of vringh_iov_push_kern()
Message-ID: <20190924080413.0cc875c5@x1.home>
In-Reply-To: <20190923115930-mutt-send-email-mst@kernel.org>
References: <20190923130331.29324-1-jasowang@redhat.com>
	<20190923130331.29324-6-jasowang@redhat.com>
	<20190923094559.765da494@x1.home>
	<20190923115930-mutt-send-email-mst@kernel.org>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.71]);
	Tue, 24 Sep 2019 14:04:22 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, airlied@linux.ie, joonas.lahtinen@linux.intel.com,
	heiko.carstens@de.ibm.com, dri-devel@lists.freedesktop.org,
	virtualization@lists.linux-foundation.org, kwankhede@nvidia.com,
	rob.miller@broadcom.com, linux-s390@vger.kernel.org,
	sebott@linux.ibm.com, lulu@redhat.com, eperezma@redhat.com,
	pasic@linux.ibm.com, borntraeger@de.ibm.com,
	haotian.wang@sifive.com, intel-gfx@lists.freedesktop.org,
	zhi.a.wang@intel.com, farman@linux.ibm.com, idos@mellanox.com,
	gor@linux.ibm.com, jani.nikula@linux.intel.com,
	rodrigo.vivi@intel.com, xiao.w.wang@intel.com,
	freude@linux.ibm.com, zhenyuw@linux.intel.com,
	parav@mellanox.com, zhihong.wang@intel.com,
	intel-gvt-dev@lists.freedesktop.org, akrowiak@linux.ibm.com,
	oberpar@linux.ibm.com, netdev@vger.kernel.org, cohuck@redhat.com,
	linux-kernel@vger.kernel.org, maxime.coquelin@redhat.com,
	daniel@ffwll.ch, lingshan.zhu@intel.com
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

On Mon, 23 Sep 2019 12:00:41 -0400
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Mon, Sep 23, 2019 at 09:45:59AM -0600, Alex Williamson wrote:
> > On Mon, 23 Sep 2019 21:03:30 +0800
> > Jason Wang <jasowang@redhat.com> wrote:
> >   
> > > We want to copy from iov to buf, so the direction was wrong.
> > > 
> > > Signed-off-by: Jason Wang <jasowang@redhat.com>
> > > ---
> > >  drivers/vhost/vringh.c | 8 +++++++-
> > >  1 file changed, 7 insertions(+), 1 deletion(-)  
> > 
> > 
> > Why is this included in the series?  Seems like an unrelated fix being
> > held up within a proposal for a new feature.  Thanks,
> > 
> > Alex  
> 
> It's better to have it as patch 1/6, but it's a dependency of the
> example driver in the series. I can reorder when I apply.

It's a fix, please submit it separately through virtio/vhost channels,
then it will already be in the base kernel we use for the rest of the
series.  The remainder of the series certainly suggests a workflow
through the vfio tree rather than virtio/vhost.  Thanks,

Alex

> > > diff --git a/drivers/vhost/vringh.c b/drivers/vhost/vringh.c
> > > index 08ad0d1f0476..a0a2d74967ef 100644
> > > --- a/drivers/vhost/vringh.c
> > > +++ b/drivers/vhost/vringh.c
> > > @@ -852,6 +852,12 @@ static inline int xfer_kern(void *src, void *dst, size_t len)
> > >  	return 0;
> > >  }
> > >  
> > > +static inline int kern_xfer(void *dst, void *src, size_t len)
> > > +{
> > > +	memcpy(dst, src, len);
> > > +	return 0;
> > > +}
> > > +
> > >  /**
> > >   * vringh_init_kern - initialize a vringh for a kernelspace vring.
> > >   * @vrh: the vringh to initialize.
> > > @@ -958,7 +964,7 @@ EXPORT_SYMBOL(vringh_iov_pull_kern);
> > >  ssize_t vringh_iov_push_kern(struct vringh_kiov *wiov,
> > >  			     const void *src, size_t len)
> > >  {
> > > -	return vringh_iov_xfer(wiov, (void *)src, len, xfer_kern);
> > > +	return vringh_iov_xfer(wiov, (void *)src, len, kern_xfer);
> > >  }
> > >  EXPORT_SYMBOL(vringh_iov_push_kern);
> > >    

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
