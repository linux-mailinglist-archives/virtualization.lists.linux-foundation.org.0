Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2511C69EE
	for <lists.virtualization@lfdr.de>; Wed,  6 May 2020 09:20:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 5348B2051F;
	Wed,  6 May 2020 07:20:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3ALJY6JQ+osl; Wed,  6 May 2020 07:20:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id F2FCD20762;
	Wed,  6 May 2020 07:20:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CE8BDC0859;
	Wed,  6 May 2020 07:20:08 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8D9C1C0859
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 May 2020 07:20:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 89FD18708C
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 May 2020 07:20:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gtJCDWD8Dm14
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 May 2020 07:20:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 37FCD86E6F
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 May 2020 07:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588749603;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=736cry6ayk4bFoTJ6GjBafnY0xYXIZ6Pinl17EvWj60=;
 b=iXYbXcn2wkkHPzf66OFWmbjSyOJCBgF8EQty7nQAS/yFyCQL3gam8jLso3BckTuVNy1RUD
 GiVTCtGYxM1YSkQuZAOgJ1x4J1C5/CQcw//REfBJYrh5Pcr37sXf91kjHn3yrCh0kjzSbz
 wxTrvAMyYzGKB/6U05I1ME1mgiEHqMc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-228-pLC6e27vPJmiyVxcQnd1QA-1; Wed, 06 May 2020 03:20:00 -0400
X-MC-Unique: pLC6e27vPJmiyVxcQnd1QA-1
Received: by mail-wm1-f70.google.com with SMTP id q5so724768wmc.9
 for <virtualization@lists.linux-foundation.org>;
 Wed, 06 May 2020 00:20:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=736cry6ayk4bFoTJ6GjBafnY0xYXIZ6Pinl17EvWj60=;
 b=V8LSje7EL8h2VIKu3SzXnx7kTXpar6uZ91T/KymyP2xHum7W0w0bDHgqfuEVAdMJo+
 tXlabFM+vNMXrWwXHDxMZ5kZwbhAGqAmAhm7qWTVcWLQ1SUAe6yU2f20UQR1UPN71YfT
 zqKpCgzLTuJqU17b38E4hzzVqepoUO63ALexIqhHSKpMkqZPjpl6F7nKNUz+2QgVk4PC
 3omjyI3QyD/umLh3My6J5eQRUWH23cBP57HZWjPJkz5lRb2kllywcWcTpSP9m1Y+zKut
 M+SXfQLUDLnewXCLAeX7tPviUU8tylh7MfBwWyrh+77r/Up4QIVKFuMWIZCrwunBTyh6
 Bz5g==
X-Gm-Message-State: AGi0Pua1sFjPIc5v+o9Ft1qnHHMqr4vX66ZRzvsnplDFkAtwDCTUMF/o
 Yea1td4Usvu3BXsY8zH44H+JhHa0Dkrp6Fhwxc9kVTrYkxGIWNFkEKW06BY5ShCiu25gV6WCLC6
 QB1GMVns5FEZ/AS+mS6kiozXvkWJK9gq5wQDN4cLV0g==
X-Received: by 2002:a7b:c38e:: with SMTP id s14mr2569990wmj.12.1588749599088; 
 Wed, 06 May 2020 00:19:59 -0700 (PDT)
X-Google-Smtp-Source: APiQypIV+r+NtiFQvVY9XndOnisjRoTPFVUYqnvGw+P8xp0StDMwaXBjj0p0abeACiuHrrh2hF04MA==
X-Received: by 2002:a7b:c38e:: with SMTP id s14mr2569971wmj.12.1588749598878; 
 Wed, 06 May 2020 00:19:58 -0700 (PDT)
Received: from redhat.com (bzq-109-66-7-121.red.bezeqint.net. [109.66.7.121])
 by smtp.gmail.com with ESMTPSA id
 o129sm1727634wme.16.2020.05.06.00.19.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 May 2020 00:19:58 -0700 (PDT)
Date: Wed, 6 May 2020 03:19:55 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Justin He <Justin.He@arm.com>
Subject: Re: [GIT PULL] vhost: fixes
Message-ID: <20200506031918-mutt-send-email-mst@kernel.org>
References: <20200504081540-mutt-send-email-mst@kernel.org>
 <AM6PR08MB40696EFF8BE389C134AC04F6F7A40@AM6PR08MB4069.eurprd08.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <AM6PR08MB40696EFF8BE389C134AC04F6F7A40@AM6PR08MB4069.eurprd08.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: "n.b@live.com" <n.b@live.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "ldigby@redhat.com" <ldigby@redhat.com>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
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

On Wed, May 06, 2020 at 03:28:47AM +0000, Justin He wrote:
> Hi Michael
> 
> > -----Original Message-----
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Monday, May 4, 2020 8:16 PM
> > To: Linus Torvalds <torvalds@linux-foundation.org>
> > Cc: kvm@vger.kernel.org; virtualization@lists.linux-foundation.org;
> > netdev@vger.kernel.org; linux-kernel@vger.kernel.org; Justin He
> > <Justin.He@arm.com>; ldigby@redhat.com; mst@redhat.com; n.b@live.com;
> > stefanha@redhat.com
> > Subject: [GIT PULL] vhost: fixes
> >
> > The following changes since commit
> > 6a8b55ed4056ea5559ebe4f6a4b247f627870d4c:
> >
> >   Linux 5.7-rc3 (2020-04-26 13:51:02 -0700)
> >
> > are available in the Git repository at:
> >
> >   https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git tags/for_linus
> >
> > for you to fetch changes up to
> > 0b841030625cde5f784dd62aec72d6a766faae70:
> >
> >   vhost: vsock: kick send_pkt worker once device is started (2020-05-02
> > 10:28:21 -0400)
> >
> > ----------------------------------------------------------------
> > virtio: fixes
> >
> > A couple of bug fixes.
> >
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> >
> > ----------------------------------------------------------------
> > Jia He (1):
> >       vhost: vsock: kick send_pkt worker once device is started
> 
> Should this fix also be CC-ed to stable? Sorry I forgot to cc it to stable.
> 
> --
> Cheers,
> Justin (Jia He)


Go ahead, though recently just including Fixes seems to be enough.


> 
> >
> > Stefan Hajnoczi (1):
> >       virtio-blk: handle block_device_operations callbacks after hot unplug
> >
> >  drivers/block/virtio_blk.c | 86
> > +++++++++++++++++++++++++++++++++++++++++-----
> >  drivers/vhost/vsock.c      |  5 +++
> >  2 files changed, 83 insertions(+), 8 deletions(-)
> 
> IMPORTANT NOTICE: The contents of this email and any attachments are confidential and may also be privileged. If you are not the intended recipient, please notify the sender immediately and do not disclose the contents to any other person, use it for any purpose, or store or copy the information in any medium. Thank you.

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
