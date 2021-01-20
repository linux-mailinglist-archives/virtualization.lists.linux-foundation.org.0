Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id DBCB92FCF23
	for <lists.virtualization@lfdr.de>; Wed, 20 Jan 2021 12:33:16 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7ACB4869A2;
	Wed, 20 Jan 2021 11:33:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R9+QMj8aNvzw; Wed, 20 Jan 2021 11:33:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 932FC86988;
	Wed, 20 Jan 2021 11:33:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4D570C1DA7;
	Wed, 20 Jan 2021 11:33:13 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 103A3C013A
 for <virtualization@lists.linux-foundation.org>;
 Wed, 20 Jan 2021 11:33:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id E30A6203DC
 for <virtualization@lists.linux-foundation.org>;
 Wed, 20 Jan 2021 11:33:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jP6KFlOtVGuq
 for <virtualization@lists.linux-foundation.org>;
 Wed, 20 Jan 2021 11:33:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by silver.osuosl.org (Postfix) with ESMTPS id 5E224203D5
 for <virtualization@lists.linux-foundation.org>;
 Wed, 20 Jan 2021 11:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611142387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pFGGWQjriPthIYfyi3X3sOv+nCS3Pi6CkQN1y+wI4Fk=;
 b=FC/3g5Pp6QJbg0nD7+lVlHHkibyhibzysxm2MYHa68cJxDO2b+IOPHv07AjuaCKmxugRQB
 KXP10OYKvIZmSGUbJVC15bIY2Akq2JXzDnyZbMb24wqWl5EJxJFjIagvak3IAUYyt700QE
 fLPdRvUJw36rDF7bAMffTivXOBgIgXs=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-433-Ru53TD4lNRO_ucoeKB5JbA-1; Wed, 20 Jan 2021 06:33:05 -0500
X-MC-Unique: Ru53TD4lNRO_ucoeKB5JbA-1
Received: by mail-wr1-f72.google.com with SMTP id w5so11194308wrl.9
 for <virtualization@lists.linux-foundation.org>;
 Wed, 20 Jan 2021 03:33:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=pFGGWQjriPthIYfyi3X3sOv+nCS3Pi6CkQN1y+wI4Fk=;
 b=uepQzQijLZoviJpWsn0dBysJ4mQfccHkWIwi83CmFJ8Mw/GqvBZSC4dTLLVmvNNUgh
 eLjRwH/NDmDUFXDJWr8Lppeon4m9w0WT5gFRdT+oU+2T7DzM9W4VY+iPb/SeFHrYr1uu
 wdHAECoD878Cc9X6YYLl7rgmcXlj8MykFHFtitaqdI850/Ib2GvpCS5zXs+eIDy9FWzW
 b25y0EVdoN0H1IOOzJOOorVv+/MM0zaRrWV9XRBfrRxa2GSTDhDoeKaqE8+LRocTmaDr
 dUNQSrOq/rqU2DQZ46oT3QQXv6ZYbjUQOup/Zhg45gfOjiE/4iWTFnPZIbNpApG2iN9r
 SJNw==
X-Gm-Message-State: AOAM533IGF2Fo1q2BOD8O/Rc/+SGQlDvPOB3t1LXaQ75E7W9AuF18qVI
 GILxM266YSDjf/IrStQDUJHwX7Q04AcMyUd9Fyo/XHAQe5GuGr8gVGYG3mJYXWv7GfTNh7g8LV0
 ZxPUwOYdZBqNqCuUFGXRFgB1fIqWN/C2np3EMSiKMAA==
X-Received: by 2002:adf:f78e:: with SMTP id q14mr8804240wrp.320.1611142384134; 
 Wed, 20 Jan 2021 03:33:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxpAzKVhVIbT4hcSrf3FM2z1FMS/LGB4HGq2jsjXgqDx5dXW8G7egeuMP2ItkYMGP6U/CzXlw==
X-Received: by 2002:adf:f78e:: with SMTP id q14mr8804219wrp.320.1611142383943; 
 Wed, 20 Jan 2021 03:33:03 -0800 (PST)
Received: from redhat.com (bzq-79-177-39-148.red.bezeqint.net. [79.177.39.148])
 by smtp.gmail.com with ESMTPSA id a16sm2548221wrr.89.2021.01.20.03.33.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jan 2021 03:33:03 -0800 (PST)
Date: Wed, 20 Jan 2021 06:33:00 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH] virtio-mem: Assign boolean values to a bool variable
Message-ID: <20210120063209-mutt-send-email-mst@kernel.org>
References: <1611129031-82818-1-git-send-email-abaci-bugfix@linux.alibaba.com>
 <81a1817d-a1f5-dfca-550c-3e3f62cf3a9d@redhat.com>
 <20210120045736-mutt-send-email-mst@kernel.org>
 <da2cb3fb-0ea5-5afd-afb5-a9e7f474e148@redhat.com>
 <20210120060301-mutt-send-email-mst@kernel.org>
 <a61b016e-7896-134c-a1be-8ff8e8e6fbe2@redhat.com>
MIME-Version: 1.0
In-Reply-To: <a61b016e-7896-134c-a1be-8ff8e8e6fbe2@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Tian Tao <tiantao6@hisilicon.com>,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 Jiapeng Zhong <abaci-bugfix@linux.alibaba.com>
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

On Wed, Jan 20, 2021 at 12:14:14PM +0100, David Hildenbrand wrote:
> On 20.01.21 12:03, Michael S. Tsirkin wrote:
> > On Wed, Jan 20, 2021 at 11:04:18AM +0100, David Hildenbrand wrote:
> >> On 20.01.21 10:57, Michael S. Tsirkin wrote:
> >>> On Wed, Jan 20, 2021 at 10:40:37AM +0100, David Hildenbrand wrote:
> >>>> On 20.01.21 08:50, Jiapeng Zhong wrote:
> >>>>> Fix the following coccicheck warnings:
> >>>>>
> >>>>> ./drivers/virtio/virtio_mem.c:2580:2-25: WARNING: Assignment
> >>>>> of 0/1 to bool variable.
> >>>>>
> >>>>> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> >>>>> Signed-off-by: Jiapeng Zhong <abaci-bugfix@linux.alibaba.com>
> >>>>> ---
> >>>>>  drivers/virtio/virtio_mem.c | 2 +-
> >>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>>>
> >>>>> diff --git a/drivers/virtio/virtio_mem.c b/drivers/virtio/virtio_mem.c
> >>>>> index 9fc9ec4..85a272c 100644
> >>>>> --- a/drivers/virtio/virtio_mem.c
> >>>>> +++ b/drivers/virtio/virtio_mem.c
> >>>>> @@ -2577,7 +2577,7 @@ static int virtio_mem_probe(struct virtio_device *vdev)
> >>>>>  	 * actually in use (e.g., trying to reload the driver).
> >>>>>  	 */
> >>>>>  	if (vm->plugged_size) {
> >>>>> -		vm->unplug_all_required = 1;
> >>>>> +		vm->unplug_all_required = true;
> >>>>>  		dev_info(&vm->vdev->dev, "unplugging all memory is required\n");
> >>>>>  	}
> >>>>>  
> >>>>>
> >>>>
> >>>> Hi,
> >>>>
> >>>> we already had a fix on the list for quite a while:
> >>>>
> >>>> https://lkml.kernel.org/r/1609233239-60313-1-git-send-email-tiantao6@hisilicon.com
> >>>
> >>> Can't find that one.
> >>
> >> Looks like it was only on virtualization@ and a couple of people on cc.
> >>
> >> https://lists.linuxfoundation.org/pipermail/virtualization/2020-December/051662.html
> >>
> >> Interestingly, I cannot find the follow-up ("[PATCH] virtio-mem: use
> >> boolean value when setting vm->unplug_all_required") in the mailing list
> >> archives, even though it has virtualization@ on cc.
> > 
> > 
> > Unsurprising that I didn't merge it then ;)
> 
> Well, you were on cc ;)

Hmm true. Found it now.

> > Want to send your ack on this one?
> 
> Sure
> 
> Acked-by: David Hildenbrand <david@redhat.com>


Added yours and the original Signed-off-by.

Thanks!

> 
> -- 
> Thanks,
> 
> David / dhildenb

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
