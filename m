Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 3186EE61C3
	for <lists.virtualization@lfdr.de>; Sun, 27 Oct 2019 10:12:49 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 86FC4C9E;
	Sun, 27 Oct 2019 09:12:43 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id CEFEBC8F
	for <virtualization@lists.linux-foundation.org>;
	Sun, 27 Oct 2019 09:12:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 5633663D
	for <virtualization@lists.linux-foundation.org>;
	Sun, 27 Oct 2019 09:12:41 +0000 (UTC)
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
	[209.85.160.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7AB623D965
	for <virtualization@lists.linux-foundation.org>;
	Sun, 27 Oct 2019 09:12:40 +0000 (UTC)
Received: by mail-qt1-f197.google.com with SMTP id y10so7673305qti.1
	for <virtualization@lists.linux-foundation.org>;
	Sun, 27 Oct 2019 02:12:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=KvcCnP+pC2nRDmzc1FpwVH7/2QvdhevY/FRchCFaPBA=;
	b=Yqyb8SoFeUf0EMHKJN6P0ZpNkx5nHvAvZbyrckcGmDCAmAbzfA74swlKLi84YENNfR
	iCyIvlKxUE4kr02yOHzDbEwokDLNpbDILYbhPdzvY7IxELsoop3h5HBhoVVyxKJh4qfn
	Anor70uZ9KKbYuhyrp19DOUOy4DJXyrh9vtR1lA2Q4fVwUXwrL0cfHbJv7AauRRViSsT
	s1cg2TpCAWAXQlNgtKLvLSuvXBEawZebTpdP01T4i0Ah5ENSdTtPKH0f+RBVxqw6+fU4
	slwbfIKRvm3V8WN2d1bmdwUok1xfTqBHxMbDvXIoHB7yXpAfUkYFhXPjBK1SVEYcp5+i
	B/1w==
X-Gm-Message-State: APjAAAW+agz35HDzlljDskRNhg06BjM+LixiMGvuuZr9kD4Y5Pz9npTi
	F2jZShMHCA62i5RaIdfY1ALwflcZfNBvAFHXD9mvjUHr4nVnYZXRorPIOg7hhKyEdJMmQcrAdFY
	HrhUUGjYzcripUjMMm5OPthHc6FPSAsO5Jlkcqa15OQ==
X-Received: by 2002:ac8:8f3:: with SMTP id y48mr9932047qth.269.1572167559784; 
	Sun, 27 Oct 2019 02:12:39 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwMFBJmrA2HTVmivkkOjNKrO07OLTid9+yhJ4j3CpmNBQT7r4g5llyljhIWh4D+B55VvXsvuA==
X-Received: by 2002:ac8:8f3:: with SMTP id y48mr9932034qth.269.1572167559579; 
	Sun, 27 Oct 2019 02:12:39 -0700 (PDT)
Received: from redhat.com (bzq-79-176-10-77.red.bezeqint.net. [79.176.10.77])
	by smtp.gmail.com with ESMTPSA id
	b135sm2065609qkg.91.2019.10.27.02.12.37
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 27 Oct 2019 02:12:38 -0700 (PDT)
Date: Sun, 27 Oct 2019 05:12:34 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Marvin Liu <yong.liu@intel.com>
Subject: Re: [PATCH] virtio_ring: fix packed ring event may missing
Message-ID: <20191027051044-mutt-send-email-mst@kernel.org>
References: <20191021171004.18729-1-yong.liu@intel.com>
	<20191025063511-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191025063511-mutt-send-email-mst@kernel.org>
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
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

On Fri, Oct 25, 2019 at 06:53:55AM -0400, Michael S. Tsirkin wrote:
> On Tue, Oct 22, 2019 at 01:10:04AM +0800, Marvin Liu wrote:
> > When callback is delayed, virtio expect that vhost will kick when
> > rolling over event offset. Recheck should be taken as used index may
> > exceed event offset between status check and driver event update.
> > 
> > However, it is possible that flags was not modified if descriptors are
> > chained or in_order feature was negotiated. So flags at event offset
> > may not be valid for descriptor's status checking. Fix it by using last
> > used index as replacement. Tx queue will be stopped if there's not
> > enough freed buffers after recheck.
> > 
> > Signed-off-by: Marvin Liu <yong.liu@intel.com>
> 
> So as I wrote separately, I don't think the patch is correct.  And it
> doesn't look like it was tested properly.

I was wrong to say this: the patch is correct.

Thanks for working on this, and sorry about creating the confusion.

It might not be the
optimal thing to do but it fixes a real bug, so I think it's
a good idea to merge it for now, and implement optimizations on top.

>  However, I do think
> virtqueue_enable_cb_delayed_packed is implemented incorrectly in case of
> chained s/g and ring that is close to being full.  It's just that
> chained only happens on OOM at the moment, so it's hard to trigger.
> virtio_ring.c can be hacked to force chained to make it trigger more.
> And with napi_tx the default this function is barely used at all.
> 
> So it's hard to test, and I think in this area we really should include
> info on how patch was tested before applying.
> 
> 
> But just theoretically speaking I agree: the trick
> virtqueue_enable_cb_delayed_packed is using to check that 3/4 of the
> ring has been used just by looking at a single s/g entry can't work
> reliably.
> 
> We generally really need to scan the ring.  How much to scan?  If we
> want to implement this efficiently, I propose that we track the number
> of outstanding bufs.  Then # of s/g - # of bufs is the max number of
> entries we need to scan. For the common case of a single s/g this will
> give exactly 0.
> 
> 
> Alternatively, we can just scan the whole ring up to the index using the
> standard logic. virtqueue_enable_cb_delayed_packed is rare enough.
> 
> 
> 
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
> >  
> >  	if (vq->packed.event_flags_shadow == VRING_PACKED_EVENT_FLAG_DISABLE) {
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
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
