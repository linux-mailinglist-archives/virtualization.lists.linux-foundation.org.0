Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 16CABBB8EC
	for <lists.virtualization@lfdr.de>; Mon, 23 Sep 2019 18:01:37 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 1A4F3E1F;
	Mon, 23 Sep 2019 16:00:56 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 980ACDA5
	for <virtualization@lists.linux-foundation.org>;
	Mon, 23 Sep 2019 16:00:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 1D15E8B0
	for <virtualization@lists.linux-foundation.org>;
	Mon, 23 Sep 2019 16:00:55 +0000 (UTC)
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
	[209.85.222.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8E1A863704
	for <virtualization@lists.linux-foundation.org>;
	Mon, 23 Sep 2019 16:00:54 +0000 (UTC)
Received: by mail-qk1-f198.google.com with SMTP id x186so18203033qke.13
	for <virtualization@lists.linux-foundation.org>;
	Mon, 23 Sep 2019 09:00:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=FnrZlG9onHbzoUOas395WBpQBkqdPWiXJrz3kgJAMNs=;
	b=Ne0IBB1r5tWRNEbVtrFBbeRJgKnmKv3Bbzu9Y/qEgVRU0VsURouTEdURFnnBMDriZH
	uPD9BI9nAge2+PF6ZsQPooZ9vukC0EGup3qvgdksU0dizoQOVHHpxqW4fwzdYobScHly
	3yNa/Wu95RM3SaRl/GqkaI8/NdD4yK5Iio/V+uuKgJ0mBNltA1HKyWp8hmgE8gfLZdzA
	UoOw1+ILz6ms2LJsS5l42jOsvf8xP+iAhCawkZKXKW74zIscO3LB59+/7mmfB4n4kxe3
	aistaV3yfngkgyOoNk4gcFtzWs8u+uyPYUvJO2jhB1ZcETlhlPrWlX9NK+yvqVcP8q6T
	g+Ow==
X-Gm-Message-State: APjAAAXBHIGcd1E97uKk7qzehj5gjeEA1m6gdf3/+ejbkdkNQeQeLk0e
	/Z9H5ua3GvZ3Ld4+VHuKxCP2w25BqA9fIZZbgiItHPSz6xxyvNmlr1pPfZuzgLK88cGiu92/QCE
	EtyWHYp4C/MRApLdqLqvobZnhWemmExHdxFOupO4Emg==
X-Received: by 2002:a0c:e48b:: with SMTP id n11mr25662867qvl.38.1569254453749; 
	Mon, 23 Sep 2019 09:00:53 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzeS0qH7VWztyzQkjfFK33LHuBL/0r9aVYJeACu8zWG4i5I+VaFWBP3hOAewtn9oF8WJysLNw==
X-Received: by 2002:a0c:e48b:: with SMTP id n11mr25662820qvl.38.1569254453463; 
	Mon, 23 Sep 2019 09:00:53 -0700 (PDT)
Received: from redhat.com (bzq-79-176-40-226.red.bezeqint.net. [79.176.40.226])
	by smtp.gmail.com with ESMTPSA id
	m125sm5840827qkd.3.2019.09.23.09.00.43
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 23 Sep 2019 09:00:52 -0700 (PDT)
Date: Mon, 23 Sep 2019 12:00:41 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH 5/6] vringh: fix copy direction of vringh_iov_push_kern()
Message-ID: <20190923115930-mutt-send-email-mst@kernel.org>
References: <20190923130331.29324-1-jasowang@redhat.com>
	<20190923130331.29324-6-jasowang@redhat.com>
	<20190923094559.765da494@x1.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190923094559.765da494@x1.home>
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

On Mon, Sep 23, 2019 at 09:45:59AM -0600, Alex Williamson wrote:
> On Mon, 23 Sep 2019 21:03:30 +0800
> Jason Wang <jasowang@redhat.com> wrote:
> 
> > We want to copy from iov to buf, so the direction was wrong.
> > 
> > Signed-off-by: Jason Wang <jasowang@redhat.com>
> > ---
> >  drivers/vhost/vringh.c | 8 +++++++-
> >  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> 
> Why is this included in the series?  Seems like an unrelated fix being
> held up within a proposal for a new feature.  Thanks,
> 
> Alex

It's better to have it as patch 1/6, but it's a dependency of the
example driver in the series. I can reorder when I apply.


> > diff --git a/drivers/vhost/vringh.c b/drivers/vhost/vringh.c
> > index 08ad0d1f0476..a0a2d74967ef 100644
> > --- a/drivers/vhost/vringh.c
> > +++ b/drivers/vhost/vringh.c
> > @@ -852,6 +852,12 @@ static inline int xfer_kern(void *src, void *dst, size_t len)
> >  	return 0;
> >  }
> >  
> > +static inline int kern_xfer(void *dst, void *src, size_t len)
> > +{
> > +	memcpy(dst, src, len);
> > +	return 0;
> > +}
> > +
> >  /**
> >   * vringh_init_kern - initialize a vringh for a kernelspace vring.
> >   * @vrh: the vringh to initialize.
> > @@ -958,7 +964,7 @@ EXPORT_SYMBOL(vringh_iov_pull_kern);
> >  ssize_t vringh_iov_push_kern(struct vringh_kiov *wiov,
> >  			     const void *src, size_t len)
> >  {
> > -	return vringh_iov_xfer(wiov, (void *)src, len, xfer_kern);
> > +	return vringh_iov_xfer(wiov, (void *)src, len, kern_xfer);
> >  }
> >  EXPORT_SYMBOL(vringh_iov_push_kern);
> >  
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
