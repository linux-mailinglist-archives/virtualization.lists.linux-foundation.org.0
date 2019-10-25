Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D47E4759
	for <lists.virtualization@lfdr.de>; Fri, 25 Oct 2019 11:33:06 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 4308E13F4;
	Fri, 25 Oct 2019 09:32:59 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 75B2BAF7
	for <virtualization@lists.linux-foundation.org>;
	Fri, 25 Oct 2019 09:32:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id DF524896
	for <virtualization@lists.linux-foundation.org>;
	Fri, 25 Oct 2019 09:32:55 +0000 (UTC)
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
	[209.85.160.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 376188553A
	for <virtualization@lists.linux-foundation.org>;
	Fri, 25 Oct 2019 09:32:55 +0000 (UTC)
Received: by mail-qt1-f199.google.com with SMTP id y10so1487877qti.1
	for <virtualization@lists.linux-foundation.org>;
	Fri, 25 Oct 2019 02:32:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=0d74AjJDnD6jco/YjYHUkzrDx/F9ftmJVA5AfGT2n84=;
	b=E761tiAK8SjssY3zMDsrYfqZ4Xij5D8DxDhyOOn53084hB3R0hRrJuqfhONzi+FdXY
	vnMFSgw1VmBalIzRR/jWyNvfxAlTv03tCVb1e24Cqq+YC4QIb0alLIC4dPzoF2f09MCp
	toy2HK8gYr4ouuGreFA9mjgGup9z+aqny2Mz0+9c8vLkON1NcKYQQ8jMt7e5mYIQ6hjR
	hEg1HiM+oUnGs+7v7Jjc56C2qT//gvLqVTWlJhGwpGlvAoG/E1eBa1p8AREF3Evey/Lg
	O6+InQOLlyKitaMj2wNHfgx7zDxW2ssn7pp1IZRG6vTVxPAZDCKxkXoNciVEzBaJKo+F
	qitA==
X-Gm-Message-State: APjAAAW7EkwMNsiBY9JecFiXSYemcCgY9C5ggaxf3/PBBk5qyPm361g0
	85AVNT/1fk7vJMP5EHLHvG2OawrR+QNW1hpRXCPLbeEVlTjJpeeBKUdZc3apRYOoUpduTTC62PR
	WfBFKCmHZipKnQD0JPBz9Io7wSyPdkGMY034///VuuQ==
X-Received: by 2002:a37:a09:: with SMTP id 9mr2024423qkk.182.1571995974488;
	Fri, 25 Oct 2019 02:32:54 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw3byW9bEn6ru9e930dAK6dfQX5AKUMTrMqm3uIb0czsLeacJwrEsAtHSAW/Ai8kLM7cAgZTw==
X-Received: by 2002:a37:a09:: with SMTP id 9mr2024413qkk.182.1571995974230;
	Fri, 25 Oct 2019 02:32:54 -0700 (PDT)
Received: from redhat.com (bzq-79-176-10-77.red.bezeqint.net. [79.176.10.77])
	by smtp.gmail.com with ESMTPSA id
	x7sm929005qkj.74.2019.10.25.02.32.51
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 25 Oct 2019 02:32:53 -0700 (PDT)
Date: Fri, 25 Oct 2019 05:32:49 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Marvin Liu <yong.liu@intel.com>
Subject: Re: [PATCH] virtio_ring: fix packed ring event may missing
Message-ID: <20191025052401-mutt-send-email-mst@kernel.org>
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

This mention of event offset I don't understand: your patch
only affects code that runs when !event. So how can it
affect event offset?



> may not be valid for descriptor's status checking. Fix it by using last
> used index as replacement. Tx queue will be stopped if there's not
> enough freed buffers after recheck.
> 
> Signed-off-by: Marvin Liu <yong.liu@intel.com>
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


Is all this theorectical? Or did you actually see a problem
and then fixed it?
Because as far as I could see after this patch and with
event index off, used_idx and wrap_counter will be used
without being initialized.

OTOH the behaviour with event index on is completely unaffected.


>  
>  	if (vq->packed.event_flags_shadow == VRING_PACKED_EVENT_FLAG_DISABLE) {

OK so trying to unpack the scenario.

First you patch only affects code running when EVENT_IDX is off, so
legal values for flags are enable and disable.


Next point, this calculates the index at which we are going
to look for the flags to change, in other words
it affects the line
        if (is_used_desc_packed(vq, used_idx, wrap_counter)) {
below.

Without your patch, we simply look at the next descriptor.
This is exactly what the spec says we should do:

	Writes of device and driver descriptors can generally be
	reordered, but each side (driver and device) are only required to
	poll (or test) a single location in memory: the next device descriptor after
	the one they processed previously, in circular order.






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
