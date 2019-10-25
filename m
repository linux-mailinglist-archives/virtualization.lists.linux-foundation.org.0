Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B54E48F9
	for <lists.virtualization@lfdr.de>; Fri, 25 Oct 2019 12:54:06 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 12D241162;
	Fri, 25 Oct 2019 10:54:00 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 1A9861149
	for <virtualization@lists.linux-foundation.org>;
	Fri, 25 Oct 2019 10:53:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 205C687B
	for <virtualization@lists.linux-foundation.org>;
	Fri, 25 Oct 2019 10:53:57 +0000 (UTC)
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
	[209.85.222.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 79EFC5AFE9
	for <virtualization@lists.linux-foundation.org>;
	Fri, 25 Oct 2019 10:53:56 +0000 (UTC)
Received: by mail-qk1-f200.google.com with SMTP id n17so1723360qkg.14
	for <virtualization@lists.linux-foundation.org>;
	Fri, 25 Oct 2019 03:53:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=LLKu9nP6T0E291qxSdGazDeCgC4I59Wot9C2AwuOhK0=;
	b=X45yZo7A6j3U2YxgIPgYzJ+0OafOiLT9ARVu3uyTbmlLU8mrc8pw5rYo0y+fUJjhmL
	e1o0fmJZuBYxFR52WQFca6kru6neYUeod5DYVx2O5KDOe2XdxdSCcMErhFj9d+Ikuach
	IqDY8Re7a+7N5PI49a2uTHERUU9WKxIGc48APC5xs/8ZIbMtbuW0RwD3sV76GbnrUdP5
	KUk2Pvgnh1MytocEaRamcQZVY+NCsRoLtjfcEK9GJxN7isOhz65EoFqkAUvXzM8nrHBQ
	35CtstyvxHqzoJ3EwoskzkeOxvozK+62+AOXDMe3+9z3/mc/h1NYUTWasBPWDNvLXQa9
	6uKQ==
X-Gm-Message-State: APjAAAVond/7SQWt70i269Nt4Ddc3I9JejgNZdow8QgtBzuHyN56jqzU
	qTLfqGHRS9QFJ3D4CxAdNcYAv87OHbni4eUyjaxk66uFyjeRViAYDY0YFsKexXs/4kJIstqBGLX
	J5n7w9yk8upfPxpke4dm8k1YnCxEd5BSjBuHwmywNaw==
X-Received: by 2002:ae9:e317:: with SMTP id v23mr2341967qkf.12.1572000835711; 
	Fri, 25 Oct 2019 03:53:55 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx5XjbW8svK2LqhRwiHf9v89f9EbcXHWuIHZ4XWaPNHT0biHufOXgM7rPnswfvxI5AyibJ6BA==
X-Received: by 2002:ae9:e317:: with SMTP id v23mr2341954qkf.12.1572000835333; 
	Fri, 25 Oct 2019 03:53:55 -0700 (PDT)
Received: from redhat.com (bzq-79-176-10-77.red.bezeqint.net. [79.176.10.77])
	by smtp.gmail.com with ESMTPSA id
	44sm1129750qtu.45.2019.10.25.03.53.52
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 25 Oct 2019 03:53:54 -0700 (PDT)
Date: Fri, 25 Oct 2019 06:53:49 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Marvin Liu <yong.liu@intel.com>
Subject: Re: [PATCH] virtio_ring: fix packed ring event may missing
Message-ID: <20191025063511-mutt-send-email-mst@kernel.org>
References: <20191021171004.18729-1-yong.liu@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191021171004.18729-1-yong.liu@intel.com>
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

On Tue, Oct 22, 2019 at 01:10:04AM +0800, Marvin Liu wrote:
> When callback is delayed, virtio expect that vhost will kick when
> rolling over event offset. Recheck should be taken as used index may
> exceed event offset between status check and driver event update.
> 
> However, it is possible that flags was not modified if descriptors are
> chained or in_order feature was negotiated. So flags at event offset
> may not be valid for descriptor's status checking. Fix it by using last
> used index as replacement. Tx queue will be stopped if there's not
> enough freed buffers after recheck.
> 
> Signed-off-by: Marvin Liu <yong.liu@intel.com>

So as I wrote separately, I don't think the patch is correct.  And it
doesn't look like it was tested properly.  However, I do think
virtqueue_enable_cb_delayed_packed is implemented incorrectly in case of
chained s/g and ring that is close to being full.  It's just that
chained only happens on OOM at the moment, so it's hard to trigger.
virtio_ring.c can be hacked to force chained to make it trigger more.
And with napi_tx the default this function is barely used at all.

So it's hard to test, and I think in this area we really should include
info on how patch was tested before applying.


But just theoretically speaking I agree: the trick
virtqueue_enable_cb_delayed_packed is using to check that 3/4 of the
ring has been used just by looking at a single s/g entry can't work
reliably.

We generally really need to scan the ring.  How much to scan?  If we
want to implement this efficiently, I propose that we track the number
of outstanding bufs.  Then # of s/g - # of bufs is the max number of
entries we need to scan. For the common case of a single s/g this will
give exactly 0.


Alternatively, we can just scan the whole ring up to the index using the
standard logic. virtqueue_enable_cb_delayed_packed is rare enough.



> 
> diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
> index bdc08244a648..a8041e451e9e 100644
> --- a/drivers/virtio/virtio_ring.c
> +++ b/drivers/virtio/virtio_ring.c
> @@ -1499,9 +1499,6 @@ static bool virtqueue_enable_cb_delayed_packed(struct virtqueue *_vq)
>  		 * counter first before updating event flags.
>  		 */
>  		virtio_wmb(vq->weak_barriers);
> -	} else {
> -		used_idx = vq->last_used_idx;
> -		wrap_counter = vq->packed.used_wrap_counter;
>  	}
>  
>  	if (vq->packed.event_flags_shadow == VRING_PACKED_EVENT_FLAG_DISABLE) {
> @@ -1518,7 +1515,9 @@ static bool virtqueue_enable_cb_delayed_packed(struct virtqueue *_vq)
>  	 */
>  	virtio_mb(vq->weak_barriers);
>  
> -	if (is_used_desc_packed(vq, used_idx, wrap_counter)) {
> +	if (is_used_desc_packed(vq,
> +				vq->last_used_idx,
> +				vq->packed.used_wrap_counter)) {
>  		END_USE(vq);
>  		return false;
>  	}
> -- 
> 2.17.1
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
