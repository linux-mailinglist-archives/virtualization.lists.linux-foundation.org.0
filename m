Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id C12EB221CAE
	for <lists.virtualization@lfdr.de>; Thu, 16 Jul 2020 08:38:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 47A768ADCA;
	Thu, 16 Jul 2020 06:38:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 41h4D4ho6wq4; Thu, 16 Jul 2020 06:38:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8A8B78ADB1;
	Thu, 16 Jul 2020 06:38:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4D4D7C0733;
	Thu, 16 Jul 2020 06:38:24 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CE7E8C0733
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jul 2020 06:38:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id B545D8ADCA
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jul 2020 06:38:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xqtX4vD3+I9o
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jul 2020 06:38:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 46C368ADB1
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jul 2020 06:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594881500;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mgsbCofvuyqXz4CiSAjrSGg+j5I3SP1iCQXPN1fyRB0=;
 b=H3g80ZY8u3/IXUTzA2dZ33d9oDlRkXB12ULYhLQSFh1YuVzgXgQP5FRBtd7iuVZzyYV5xb
 xzjHagbrzgyknDbwp7w7JZ5rLnJ4yJbkXO5CGDEUM1fkKmFGY37Ohk65eURRdtpiRdCKaf
 fCIrnvN9/hfIJ1duCflu+cuWaDE/MBg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-208-h1CLjfw6NWmOHOGXy_bv1g-1; Thu, 16 Jul 2020 02:38:14 -0400
X-MC-Unique: h1CLjfw6NWmOHOGXy_bv1g-1
Received: by mail-wm1-f72.google.com with SMTP id b13so4411377wme.9
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 23:38:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mgsbCofvuyqXz4CiSAjrSGg+j5I3SP1iCQXPN1fyRB0=;
 b=ESvuyESDZSaiGvq1s9t5UuElO6c2tZ+5+W9p+pmzDp4Z/dHKf/b9iXZ9ia/KA1tkzW
 OqHQUpoeE5jtVxAprp7gRmeLGhFNctKLVxa0O3SaNnJYP6wJnFV9t+ZPkrJcoZmHDOQr
 f3YRD8FIktnz2lAtTmxHGxRmbTawY1J4YkH0k8A5fs7fpha8qmr7yTq3dCzxfIaAU9jC
 DNswLz1wzVdEoddF3VE3N9wwCfHNyDZx8SOe5AIhpmJLIyNl/8//vg6Wg58pZ4+MthFB
 RD2D26c/9uc+M5JD493isi6V7IB0CmQ4nI7MTJguKWnb5lEyPApRAytdNLBCEb3FVWJ7
 uQ/g==
X-Gm-Message-State: AOAM531DLtDji/sQyVCAXpL0gwmEsHRcNkeDzZpDAmbNbIp9obP845YX
 yP4BOeY+GCanTH2grtEo8itnwr7rlvcdWhj8/aNp8FrDg9k5z4Ri39qjjkNBB+P/w+1f9hR0/OE
 Gzx9T7Bh13SZNsX2920HnvascxTm0tlo5cT+0t5LQ5A==
X-Received: by 2002:a1c:bb89:: with SMTP id l131mr2738038wmf.125.1594881492234; 
 Wed, 15 Jul 2020 23:38:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzzaPeWg1JnBNar2FAbNPZoF5EQR8AmndjmfZn9b+/T6UDyq076UKRxNe2r8PFt/+RlfkD65g==
X-Received: by 2002:a1c:bb89:: with SMTP id l131mr2738003wmf.125.1594881491787; 
 Wed, 15 Jul 2020 23:38:11 -0700 (PDT)
Received: from redhat.com (bzq-79-182-31-92.red.bezeqint.net. [79.182.31.92])
 by smtp.gmail.com with ESMTPSA id
 p14sm8342659wrj.14.2020.07.15.23.38.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jul 2020 23:38:11 -0700 (PDT)
Date: Thu, 16 Jul 2020 02:38:07 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Hui Zhu <teawater@gmail.com>
Subject: Re: [RFC for Linux v4 0/2] virtio_balloon: Add
 VIRTIO_BALLOON_F_CONT_PAGES to report continuous pages
Message-ID: <20200716021929-mutt-send-email-mst@kernel.org>
References: <1594867315-8626-1-git-send-email-teawater@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1594867315-8626-1-git-send-email-teawater@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Andrea Arcangeli <aarcange@redhat.com>, virtio-dev@lists.oasis-open.org,
 qemu-devel@nongnu.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 akpm@linux-foundation.org
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

On Thu, Jul 16, 2020 at 10:41:50AM +0800, Hui Zhu wrote:
> The first, second and third version are in [1], [2] and [3].
> Code of current version for Linux and qemu is available in [4] and [5].
> Update of this version:
> 1. Report continuous pages will increase the speed.  So added deflate
>    continuous pages.
> 2. According to the comments from David in [6], added 2 new vqs inflate_cont_vq
>    and deflate_cont_vq to report continuous pages with format 32 bits pfn and 32
>    bits size.
> Following is the introduction of the function.
> These patches add VIRTIO_BALLOON_F_CONT_PAGES to virtio_balloon. With this
> flag, balloon tries to use continuous pages to inflate and deflate.
> Opening this flag can bring two benefits:
> 1. Report continuous pages will increase memory report size of each time
>    call tell_host.  Then it will increase the speed of balloon inflate and
>    deflate.
> 2. Host THPs will be splitted when qemu release the page of balloon inflate.
>    Inflate balloon with continuous pages will let QEMU release the pages
>    of same THPs.  That will help decrease the splitted THPs number in
>    the host.
>    Following is an example in a VM with 1G memory 1CPU.  This test setups an
>    environment that has a lot of fragmentation pages.  Then inflate balloon will
>    split the THPs.
> // This is the THP number before VM execution in the host.
> // None use THP.
> cat /proc/meminfo | grep AnonHugePages:
> AnonHugePages:         0 kB
> // After VM start, use usemem
> // (https://git.kernel.org/pub/scm/linux/kernel/git/wfg/vm-scalability.git)
> // punch-holes function generates 400m fragmentation pages in the guest
> // kernel.
> usemem --punch-holes -s -1 800m &
> // This is the THP number after this command in the host.
> // Some THP is used by VM because usemem will access 800M memory
> // in the guest.
> cat /proc/meminfo | grep AnonHugePages:
> AnonHugePages:    911360 kB
> // Connect to the QEMU monitor, setup balloon, and set it size to 600M.
> (qemu) device_add virtio-balloon-pci,id=balloon1
> (qemu) info balloon
> balloon: actual=1024
> (qemu) balloon 600
> (qemu) info balloon
> balloon: actual=600
> // This is the THP number after inflate the balloon in the host.
> cat /proc/meminfo | grep AnonHugePages:
> AnonHugePages:     88064 kB
> // Set the size back to 1024M in the QEMU monitor.
> (qemu) balloon 1024
> (qemu) info balloon
> balloon: actual=1024
> // Use usemem to increase the memory usage of QEMU.
> killall usemem
> usemem 800m
> // This is the THP number after this operation.
> cat /proc/meminfo | grep AnonHugePages:
> AnonHugePages:     65536 kB
> 
> Following example change to use continuous pages balloon.  The number of
> splitted THPs is decreased.
> // This is the THP number before VM execution in the host.
> // None use THP.
> cat /proc/meminfo | grep AnonHugePages:
> AnonHugePages:         0 kB
> // After VM start, use usemem punch-holes function generates 400M
> // fragmentation pages in the guest kernel.
> usemem --punch-holes -s -1 800m &
> // This is the THP number after this command in the host.
> // Some THP is used by VM because usemem will access 800M memory
> // in the guest.
> cat /proc/meminfo | grep AnonHugePages:
> AnonHugePages:    911360 kB
> // Connect to the QEMU monitor, setup balloon, and set it size to 600M.
> (qemu) device_add virtio-balloon-pci,id=balloon1,cont-pages=on
> (qemu) info balloon
> balloon: actual=1024
> (qemu) balloon 600
> (qemu) info balloon
> balloon: actual=600
> // This is the THP number after inflate the balloon in the host.
> cat /proc/meminfo | grep AnonHugePages:
> AnonHugePages:    616448 kB
> // Set the size back to 1024M in the QEMU monitor.
> (qemu) balloon 1024
> (qemu) info balloon
> balloon: actual=1024
> // Use usemem to increase the memory usage of QEMU.
> killall usemem
> usemem 800m
> // This is the THP number after this operation.
> cat /proc/meminfo | grep AnonHugePages:
> AnonHugePages:    907264 kB

I'm a bit confused about which of the above run within guest,
and which run within host. Could you explain pls?



> [1] https://lkml.org/lkml/2020/3/12/144
> [2] https://lore.kernel.org/linux-mm/1584893097-12317-1-git-send-email-teawater@gmail.com/
> [3] https://lkml.org/lkml/2020/5/12/324
> [4] https://github.com/teawater/linux/tree/balloon_conts
> [5] https://github.com/teawater/qemu/tree/balloon_conts
> [6] https://lkml.org/lkml/2020/5/13/1211
> 
> Hui Zhu (2):
>   virtio_balloon: Add VIRTIO_BALLOON_F_CONT_PAGES and inflate_cont_vq
>   virtio_balloon: Add deflate_cont_vq to deflate continuous pages
> 
>  drivers/virtio/virtio_balloon.c     |  180 +++++++++++++++++++++++++++++++-----
>  include/linux/balloon_compaction.h  |   12 ++
>  include/uapi/linux/virtio_balloon.h |    1
>  mm/balloon_compaction.c             |  117 +++++++++++++++++++++--
>  4 files changed, 280 insertions(+), 30 deletions(-)

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
