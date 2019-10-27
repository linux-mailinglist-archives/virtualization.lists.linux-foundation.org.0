Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B402E61DD
	for <lists.virtualization@lfdr.de>; Sun, 27 Oct 2019 10:51:49 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 7DD9BA70;
	Sun, 27 Oct 2019 09:51:42 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id D774F890
	for <virtualization@lists.linux-foundation.org>;
	Sun, 27 Oct 2019 09:51:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id F3B7063D
	for <virtualization@lists.linux-foundation.org>;
	Sun, 27 Oct 2019 09:51:38 +0000 (UTC)
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
	[209.85.222.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 287BB3DE04
	for <virtualization@lists.linux-foundation.org>;
	Sun, 27 Oct 2019 09:51:38 +0000 (UTC)
Received: by mail-qk1-f199.google.com with SMTP id z136so7324942qkb.9
	for <virtualization@lists.linux-foundation.org>;
	Sun, 27 Oct 2019 02:51:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=BUsuKRXY+yZHS1fNajcJVSmX5EdxllzxlaDgLTgWhg8=;
	b=PSjnZL8dahPXinxcrQBGMsQFsT5ltWmpgayXnw2NlFjKXEL3yeui0u9hKa5/SSl/C4
	A9WSZrzSyp1rv5eNIxRxmItmTEScqegmNY25wH3Bo8sVx8SAsMp1Qpa7yDL17//KNnTz
	aJBeUwvrl0AbnNHYg+hWd37+ltSQERgOn2iZVIaDwKfl/ofc4FsK7SGd3K5pGT5KP+gN
	WJyHktmZZVyO2qd8bwnkfqCEyUsTJ8DyRA4SZk6H5WsUINCxDQ13ZkhtFsr7AOA1Re2r
	iA7hWlmJ09smH+uQLatNHwZSlWbviiMqNV087e8P2v06Vvi4EXEMhXbXIeMhXln7MRUF
	JZXw==
X-Gm-Message-State: APjAAAW6piUOesBxPUMx4eI7n0bWtGGTVHv6Tc8ftQr+EtHpyeiwuPJi
	ebgHIoSRLH+LqHkDmhhq1KNsJT4nbEQ34qE51JGX4B5P+hWmwDLfyGlBBjXPU41SnhjyMCw2Ri+
	orRIuQZDgjtEaUUTJ/6VGLVoThlhhWUAd/bPAYbXnKA==
X-Received: by 2002:ac8:45d0:: with SMTP id e16mr12029116qto.8.1572169897461; 
	Sun, 27 Oct 2019 02:51:37 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwV+AS201XRopuC6Y3E2Zm2DB69orRpTSOrQWYgR951nZHwl5g+YZNr/jcwLvEv9ThHIMDWLA==
X-Received: by 2002:ac8:45d0:: with SMTP id e16mr12029108qto.8.1572169897193; 
	Sun, 27 Oct 2019 02:51:37 -0700 (PDT)
Received: from redhat.com (bzq-79-176-10-77.red.bezeqint.net. [79.176.10.77])
	by smtp.gmail.com with ESMTPSA id
	i75sm3845231qke.22.2019.10.27.02.51.34
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 27 Oct 2019 02:51:36 -0700 (PDT)
Date: Sun, 27 Oct 2019 05:51:31 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Marvin Liu <yong.liu@intel.com>
Subject: Re: [PATCH] virtio_ring: fix packed ring event may missing
Message-ID: <20191027051015-mutt-send-email-mst@kernel.org>
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

OK I rewrote the commit log slightly:
	When VIRTIO_F_RING_EVENT_IDX is negotiated, virtio devices can
use virtqueue_enable_cb_delayed_packed to reduce the number of device
interrupts.  At the moment, this is the case for virtio-net when
the napi_tx module parameter is set to false.

In this case, the virtio driver selects an event offset in the ring and expects
that the device will send a notification when rolling over the event
offset in the ring.  However, if this roll-over happens before the event
suppression structure update, the notification won't be sent. To address
this race condition the driver needs to check wether the
device rolled over this offset after updating the event suppression structure.

With VIRTIO_F_RING_PACKED, the virtio driver did this by reading the the
flags field at the specified offset in the descriptor.

	Unfortunately, checking at the event offset isn't reliable: if
descriptors are chained (e.g. when INDIRECT is off) not all descriptors
are overwritten by the device, so it's possible that the device skipped
the specific descriptor driver is checking when writing out used
descriptors. If this happens, the driver won't detect the race condition and will
incorrectly expect the device to send a notification.

For virtio-net, the result will be TX queue stall, and transmission
getting blocked forever.

	With the packed ring, it isn't easy to find a location which is
guaranteed to change upon the roll-over, except the next device
descriptor, as described in the spec:

	Writes of device and driver descriptors can generally be
	reordered, but each side (driver and device) are only required to
	poll (or test) a single location in memory: the next device descriptor after
	the one they processed previously, in circular order.

while this might be sub-optimal, let's do exactly this for now.

And applied this.

Thanks a lot for working on this, and sorry again for not understanding
the patch originally and thinking it was not tested!

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
