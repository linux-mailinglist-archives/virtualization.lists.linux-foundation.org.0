Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id B2946E61BB
	for <lists.virtualization@lfdr.de>; Sun, 27 Oct 2019 10:09:32 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id DA1AFC6D;
	Sun, 27 Oct 2019 09:09:25 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 709A4C59
	for <virtualization@lists.linux-foundation.org>;
	Sun, 27 Oct 2019 09:09:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id C602563D
	for <virtualization@lists.linux-foundation.org>;
	Sun, 27 Oct 2019 09:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1572167362;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=B6Zp7qhUIoGDmRaPhVu8+fUbmW5fG80SxYr2cS/hHes=;
	b=QcK23AMSxuZvsrq9mRmVgzesJ+BbXuuojTxfpC03ekLx3Ulk6Zova63ROxZEjNpXDfzgUe
	6bYMw4UNOAXZ8Gh1xFOhTC69qI4ny22shuAz4s18pf+G6HwOUAPcw0CmGTNHZ3aVYhmXb0
	FyoXsytcEdfs+xCCCz0Pn3z8SkX9uOY=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
	[209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-369-L0PHM3rONIKHvGtuFa63lg-1; Sun, 27 Oct 2019 05:09:19 -0400
Received: by mail-qt1-f198.google.com with SMTP id j5so7630924qtn.10
	for <virtualization@lists.linux-foundation.org>;
	Sun, 27 Oct 2019 02:09:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=DfpFsi3sUnWK/HX/p0T88OzarGD68pQ3cAIumG8lnVU=;
	b=cHA+Yn+TdnY05xgzJ4SnWFqKHxSaLDYmaaY42VourSvE0JSLENzcnLyoQk4Xk0l7iL
	OiAPNjbTEjzdyqM+62RfmMz8ysVz3/A4JMZ7eFm5GwfZANqlFEKbHDzT0gu8lSKxVzEs
	iH6udRbI43oPKWAKvJ/jwm+NiQlcz63CgTqPDqs47trCLrCCYSV11Dty496V1xECfwpA
	BONrH1jSP8xP5hinvq1R7M/4NnEqxzOeDq+d21WZNU/Ya/5/4/7vocuBH4umw5AEgeJi
	yq+ZjBm2bY5PDDJjrHbaLx/z9yoZV3OEZ7d2iMty0KKksKT/tl+1b1cU8qhb18KemSWI
	+Bvg==
X-Gm-Message-State: APjAAAVq/Xd7gYGEZZNjESTKDwS7NvD4gG7xMCbfNCBrfq/OJU5UHAPX
	FKl4SG66g6GyGGJeAlFAhc6xMYkI81jxJdRPbPZTN9JHfnIwSUl33fx+9rl5efMe+s4CoGSjdok
	g3zgZhGLr/8BMY0+H6k6U4xtmIEAaEI5UZOxhQ8Yufw==
X-Received: by 2002:ac8:f88:: with SMTP id b8mr12027987qtk.382.1572167359464; 
	Sun, 27 Oct 2019 02:09:19 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyRVvyHBr4GkZLMzKkZnyhOWuo+bKWwfoVSdHHxkDGkMHHtOD31tyYb1yNAfdlEA0C6IA3jEQ==
X-Received: by 2002:ac8:f88:: with SMTP id b8mr12027971qtk.382.1572167359131; 
	Sun, 27 Oct 2019 02:09:19 -0700 (PDT)
Received: from redhat.com (bzq-79-176-10-77.red.bezeqint.net. [79.176.10.77])
	by smtp.gmail.com with ESMTPSA id
	j16sm4129159qka.48.2019.10.27.02.09.16
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 27 Oct 2019 02:09:17 -0700 (PDT)
Date: Sun, 27 Oct 2019 05:09:14 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Marvin Liu <yong.liu@intel.com>
Subject: Re: [PATCH] virtio_ring: fix packed ring event may missing
Message-ID: <20191027050845-mutt-send-email-mst@kernel.org>
References: <20191021171004.18729-1-yong.liu@intel.com>
	<20191025052401-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20191025052401-mutt-send-email-mst@kernel.org>
X-MC-Unique: L0PHM3rONIKHvGtuFa63lg-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: virtualization@lists.linux-foundation.org
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

On Fri, Oct 25, 2019 at 05:32:49AM -0400, Michael S. Tsirkin wrote:
> On Tue, Oct 22, 2019 at 01:10:04AM +0800, Marvin Liu wrote:
> > When callback is delayed, virtio expect that vhost will kick when
> > rolling over event offset. Recheck should be taken as used index may
> > exceed event offset between status check and driver event update.
> > 
> > However, it is possible that flags was not modified if descriptors are
> > chained or in_order feature was negotiated. So flags at event offset
> 
> This mention of event offset I don't understand: your patch
> only affects code that runs when !event. So how can it
> affect event offset?
> 
> 
> 
> > may not be valid for descriptor's status checking. Fix it by using last
> > used index as replacement. Tx queue will be stopped if there's not
> > enough freed buffers after recheck.
> > 
> > Signed-off-by: Marvin Liu <yong.liu@intel.com>
> > 
> > diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
> > index bdc08244a648..a8041e451e9e 100644
> > --- a/drivers/virtio/virtio_ring.c
> > +++ b/drivers/virtio/virtio_ring.c
> > @@ -1499,9 +1499,6 @@ static bool virtqueue_enable_cb_delayed_packed(struct virtqueue *_vq)
> >  		 * counter first before updating event flags.
> >  		 */
> >  		virtio_wmb(vq->weak_barriers);
> > -	} else {
> > -		used_idx = vq->last_used_idx;
> > -		wrap_counter = vq->packed.used_wrap_counter;
> >  	}
> 
> 
> Is all this theorectical? Or did you actually see a problem
> and then fixed it?
> Because as far as I could see after this patch and with
> event index off, used_idx and wrap_counter will be used
> without being initialized.
> 
> OTOH the behaviour with event index on is completely unaffected.
> 
> 
> >  
> >  	if (vq->packed.event_flags_shadow == VRING_PACKED_EVENT_FLAG_DISABLE) {
> 
> OK so trying to unpack the scenario.
> 
> First you patch only affects code running when EVENT_IDX is off, so
> legal values for flags are enable and disable.
> 
> 
> Next point, this calculates the index at which we are going
> to look for the flags to change, in other words
> it affects the line
>         if (is_used_desc_packed(vq, used_idx, wrap_counter)) {
> below.
> 
> Without your patch, we simply look at the next descriptor.
> This is exactly what the spec says we should do:
> 
> 	Writes of device and driver descriptors can generally be
> 	reordered, but each side (driver and device) are only required to
> 	poll (or test) a single location in memory: the next device descriptor after
> 	the one they processed previously, in circular order.
> 

OK please ignore all this, I misunderstood the patch. Sorry about the
noise.


> 
> 
> 
> 
> > @@ -1518,7 +1515,9 @@ static bool virtqueue_enable_cb_delayed_packed(struct virtqueue *_vq)
> >  	 */
> >  	virtio_mb(vq->weak_barriers);
> >  
> > -	if (is_used_desc_packed(vq, used_idx, wrap_counter)) {
> > +	if (is_used_desc_packed(vq,
> > +				vq->last_used_idx,
> > +				vq->packed.used_wrap_counter)) {
> >  		END_USE(vq);
> >  		return false;
> >  	}
> > -- 
> > 2.17.1
> _______________________________________________
> Virtualization mailing list
> Virtualization@lists.linux-foundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/virtualization

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
