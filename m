Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 77CE61ADB10
	for <lists.virtualization@lfdr.de>; Fri, 17 Apr 2020 12:29:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2E37D85F8C;
	Fri, 17 Apr 2020 10:29:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A0Qdfd0fKQsb; Fri, 17 Apr 2020 10:29:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id BF93785F69;
	Fri, 17 Apr 2020 10:29:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A2755C0172;
	Fri, 17 Apr 2020 10:29:28 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 251D1C0172
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 10:29:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 0F7DB87E57
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 10:29:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p3mijdcHVuvH
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 10:29:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 76E0087E27
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 10:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587119365;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Df++JGqRkxdrXu/o7fuFLap84JMDoE3e/yJ1f/Z5puU=;
 b=Ocd9bb69mny5rs2ZebkCCs/gc/jT63nSd+3h9WmTaarzF++5r3037KN4jGQODfTtXT/juU
 G34yphlmARut7aes661sXRGcWc87rRLvNJqViNVZo7OI+p4DAx1yEoQ2it9cdMhSHeGXAP
 xA71wD2hZFtlHmmuDA0YdTqndzlQDPw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-190-PPoUAtLWPsOStsgVkHP0Tw-1; Fri, 17 Apr 2020 06:29:23 -0400
X-MC-Unique: PPoUAtLWPsOStsgVkHP0Tw-1
Received: by mail-wr1-f70.google.com with SMTP id f15so781842wrj.2
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 03:29:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Df++JGqRkxdrXu/o7fuFLap84JMDoE3e/yJ1f/Z5puU=;
 b=JH9neH8CI0dDzti5FHpG6s10lXUUCHiSUa38GpUihMcQZ9SIR9OfXOjzrsZeza2eJ+
 LOlZBRakWBw7m10Cp6hz3Op6LQvUR1ph0YEaae5gh7slsAWfcB6rFPg/1KBh1x1lR5mn
 P+KW8PigaouEEQTBbmy+d2xgeyRTdG5spkoZh0Z6UJoE68yuFsfKcKKXfNl5vN1cOVlx
 vE8ky4eg1tYjPcBMP1C24eBk0x9YuMZM2eAcagrOSyHLtpw1XnHzWSJ6fz1GzQZVZcsA
 +UIFwE0kEsJ+6zx5a8adSqfVkAd1JoMXHlZyVmMcNKSXnb/c4MR3LMQXbsXG98yv8yx8
 9MTg==
X-Gm-Message-State: AGi0PuZmgwyAdb5Pw4APcTcgeyN4WX4Sgqwp0FVIVislUCRWosioBpqM
 KECe4s6dOlT4qujFjgDUbJNxjpFIDPC14ergI08Av8GQ0y9d8rMJZE5qfcjZCtbpjkOPp4W1wYH
 N09rkrIAt0dwA/NbJQy3EXRgc3KLHNoTbyZtR5gU1Ag==
X-Received: by 2002:a05:6000:1089:: with SMTP id
 y9mr3519045wrw.157.1587119362509; 
 Fri, 17 Apr 2020 03:29:22 -0700 (PDT)
X-Google-Smtp-Source: APiQypKLp4VubQyHvHgpxCBoYsO0pfEiAUTjg7yziI3Hg5EwznJeYlfLKPMSTHk+GJHtqlHiHkEgug==
X-Received: by 2002:a05:6000:1089:: with SMTP id
 y9mr3519030wrw.157.1587119362280; 
 Fri, 17 Apr 2020 03:29:22 -0700 (PDT)
Received: from redhat.com (bzq-79-183-51-3.red.bezeqint.net. [79.183.51.3])
 by smtp.gmail.com with ESMTPSA id w12sm16746021wrk.56.2020.04.17.03.29.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2020 03:29:21 -0700 (PDT)
Date: Fri, 17 Apr 2020 06:29:19 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [virtio-dev] Re: [PATCH] virtio-balloon: Disable free page
 hinting/reporting if page poison is disabled
Message-ID: <20200417062804-mutt-send-email-mst@kernel.org>
References: <20200417021335-mutt-send-email-mst@kernel.org>
 <08d2c4e2-8c0f-7d3c-89f1-0e6c6a2756c8@redhat.com>
 <20200417044641-mutt-send-email-mst@kernel.org>
 <0f867029-aef4-72b9-356f-ec25c265db1b@redhat.com>
 <20200417051223-mutt-send-email-mst@kernel.org>
 <3447361c-4d07-1785-c59b-8c98ddaebd92@redhat.com>
 <20200417055217-mutt-send-email-mst@kernel.org>
 <1823d9be-d175-6cb5-0c7d-8a68d959a0d5@redhat.com>
 <20200417061815-mutt-send-email-mst@kernel.org>
 <34f46dfc-be16-d057-0760-3cb7c1d1288a@redhat.com>
MIME-Version: 1.0
In-Reply-To: <34f46dfc-be16-d057-0760-3cb7c1d1288a@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: virtio-dev@lists.oasis-open.org,
 Alexander Duyck <alexander.duyck@gmail.com>,
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

On Fri, Apr 17, 2020 at 12:26:24PM +0200, David Hildenbrand wrote:
> On 17.04.20 12:19, Michael S. Tsirkin wrote:
> > On Fri, Apr 17, 2020 at 12:09:38PM +0200, David Hildenbrand wrote:
> >>  > What do you call "hinting ends" though? The fact we put
> >>> a page in the VQ is not a guarantee that it's been consumed
> >>> by the hypervisor.
> >>>
> >>
> >> I'd say hinting ends once the hypervisor sets FREE_PAGE_REPORT_S_DONE.
> > 
> > Can't find that one anywhere. what did I miss?
> 
> Sorry, the QEMU implementation is confusing. FREE_PAGE_REPORT_S_DONE is
> translated to VIRTIO_BALLOON_CMD_ID_DONE

Well VIRTIO_BALLOON_CMD_ID_DONE just means "don't give me any
more hints, I finished migration".
Guest will stop hinting even without that once it scans all
free memory.



> QEMU:
> 
> hw/virtio/virtio-balloon.c:virtio_balloon_free_page_report_notify()
> -> virtio_balloon_free_page_done(dev)
> -> s->free_page_report_status = FREE_PAGE_REPORT_S_DONE;
>    virtio_notify_config(vdev);
> 
> When the guest reads the config
> hw/virtio/virtio-balloon.c:virtio_balloon_get_config()
> -> if (dev->free_page_report_status == FREE_PAGE_REPORT_S_DONE)
> -> config.free_page_report_cmd_id = ... VIRTIO_BALLOON_CMD_ID_DONE
> 
> 
> Linux:
> 
> drivers/virtio/virtio_balloon.c:report_free_page_func()
> -> if (cmd_id_received == VIRTIO_BALLOON_CMD_ID_DONE) {
> -> return_free_pages_to_mm()
> 
> 
> So it's VIRTIO_BALLOON_CMD_ID_DONE.
> 
> 
> -- 
> Thanks,
> 
> David / dhildenb

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
