Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id AC7331C5D98
	for <lists.virtualization@lfdr.de>; Tue,  5 May 2020 18:30:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 402E38942D;
	Tue,  5 May 2020 16:30:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FmWxX9C2Gzue; Tue,  5 May 2020 16:30:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6B48488909;
	Tue,  5 May 2020 16:30:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4023FC0175;
	Tue,  5 May 2020 16:30:44 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2D48EC0175
 for <virtualization@lists.linux-foundation.org>;
 Tue,  5 May 2020 16:30:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 17E7E86D2B
 for <virtualization@lists.linux-foundation.org>;
 Tue,  5 May 2020 16:30:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QzBKF2xLhCw6
 for <virtualization@lists.linux-foundation.org>;
 Tue,  5 May 2020 16:30:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id C40C086AC6
 for <virtualization@lists.linux-foundation.org>;
 Tue,  5 May 2020 16:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588696239;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yMBKhgqvtU6JZa2/gwth5BlYVmq3nyyl0uG0nZStcYk=;
 b=VRk02Ujd1Qec1U1BuABFsYthQpjfFkTPREu7oQqBglgWk65r3Zl0i/vQDvRSzLUDvshtjh
 UtudByAwIEGMgSpmpe9Nb92qAkwRbtlCs4r49O0mn5FT+hXpV6xecT+uyM5dC2GG2kZf6D
 e9gW5TGMDzJgyWgmk7ItZLPKeK/FGz4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-90-xzq0L3U_Mk2_463hqMUUtw-1; Tue, 05 May 2020 12:30:37 -0400
X-MC-Unique: xzq0L3U_Mk2_463hqMUUtw-1
Received: by mail-wr1-f69.google.com with SMTP id z5so1466328wrt.17
 for <virtualization@lists.linux-foundation.org>;
 Tue, 05 May 2020 09:30:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=yMBKhgqvtU6JZa2/gwth5BlYVmq3nyyl0uG0nZStcYk=;
 b=dwfgi0p1IPHrHczEhVgEqlPo2xoudkcx8at5e2n6bq2PA+B7cHy1h5a149YDO2cZWx
 SjKaK91sg2dLMeqMDXkV0JE7E0JEEBuoOlrvTQEF/dl9hM78VFfMeBkNCi2je1OY5qOM
 8AXdi+goybnlyG9Zyup4iLq7d7ks7Rw9NdLHHBo6qdEWO7TLkXx0puMlpzwUePOu1Vok
 EBqXBBuXHaIjUXbpKz34zPQ2SWf3EiMKe+5Hg7HUCan9XCRBSqEoWVBZH1DafPf9wY0e
 jMpJYRlqPz+lqx5G8aeFAVwxanLYGmESadD2BKgmT7OekX3FogUYaHlAdcwgluOT8iJd
 ab8g==
X-Gm-Message-State: AGi0PuY5kUACr47alQU8GyWw23lAWvd1j46BenYvRsVxWN5iRI3bUD31
 WvwOJwi1XtJCUo04tWdj6G6zmEXyBrIClq2h4p5hJ/SVnI33OqJGzxFImcXg7prhG6mj+dptLoq
 qnj/Cao8qtwoHl/xzG/a2ksPK8AS+nrRk7oqsswPdKA==
X-Received: by 2002:a5d:5261:: with SMTP id l1mr4495417wrc.24.1588696236459;
 Tue, 05 May 2020 09:30:36 -0700 (PDT)
X-Google-Smtp-Source: APiQypL6c2ZhSqgyVCoh+9xYBBrRpeIbvWaVoWn35WDDllP8SgqQVe+xSldK3GCh2yVta3+pQW6bDg==
X-Received: by 2002:a5d:5261:: with SMTP id l1mr4495399wrc.24.1588696236272;
 Tue, 05 May 2020 09:30:36 -0700 (PDT)
Received: from redhat.com (bzq-109-66-7-121.red.bezeqint.net. [109.66.7.121])
 by smtp.gmail.com with ESMTPSA id
 x5sm3669458wro.12.2020.05.05.09.30.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 May 2020 09:30:35 -0700 (PDT)
Date: Tue, 5 May 2020 12:30:33 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [vhost:vhost 8/22] drivers/virtio/virtio_mem.c:1375:20: error:
 implicit declaration of function 'kzalloc'; did you mean 'vzalloc'?
Message-ID: <20200505123009-mutt-send-email-mst@kernel.org>
References: <202005052221.83QerHmG%lkp@intel.com>
 <7dea2810-85cf-0892-20a8-bba3e3a2c133@redhat.com>
 <20200505114433-mutt-send-email-mst@kernel.org>
 <3eaebd8d-750a-d046-15f5-706fb00a196e@redhat.com>
 <20200505121732-mutt-send-email-mst@kernel.org>
 <e607a850-ba5c-6033-93fc-144639b125b8@redhat.com>
MIME-Version: 1.0
In-Reply-To: <e607a850-ba5c-6033-93fc-144639b125b8@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>, kbuild-all@lists.01.org,
 kbuild test robot <lkp@intel.com>, kvm@vger.kernel.org, netdev@vger.kernel.org,
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

On Tue, May 05, 2020 at 06:22:51PM +0200, David Hildenbrand wrote:
> On 05.05.20 18:20, Michael S. Tsirkin wrote:
> > On Tue, May 05, 2020 at 05:46:44PM +0200, David Hildenbrand wrote:
> >> On 05.05.20 17:44, Michael S. Tsirkin wrote:
> >>> On Tue, May 05, 2020 at 04:50:13PM +0200, David Hildenbrand wrote:
> >>>> On 05.05.20 16:15, kbuild test robot wrote:
> >>>>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git vhost
> >>>>> head:   da1742791d8c0c0a8e5471f181549c4726a5c5f9
> >>>>> commit: 7527631e900d464ed2d533f799cb0da2b29cc6f0 [8/22] virtio-mem: Paravirtualized memory hotplug
> >>>>> config: x86_64-randconfig-b002-20200505 (attached as .config)
> >>>>> compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
> >>>>> reproduce:
> >>>>>         git checkout 7527631e900d464ed2d533f799cb0da2b29cc6f0
> >>>>>         # save the attached .config to linux build tree
> >>>>>         make ARCH=x86_64 
> >>>>>
> >>>>> If you fix the issue, kindly add following tag as appropriate
> >>>>> Reported-by: kbuild test robot <lkp@intel.com>
> >>>>>
> >>>>> All error/warnings (new ones prefixed by >>):
> >>>>>
> >>>>>    drivers/virtio/virtio_mem.c: In function 'virtio_mem_probe':
> >>>>>>> drivers/virtio/virtio_mem.c:1375:20: error: implicit declaration of function 'kzalloc'; did you mean 'vzalloc'? [-Werror=implicit-function-declaration]
> >>>>>      vdev->priv = vm = kzalloc(sizeof(*vm), GFP_KERNEL);
> >>>>>                        ^~~~~~~
> >>>>>                        vzalloc
> >>>>>>> drivers/virtio/virtio_mem.c:1375:18: warning: assignment makes pointer from integer without a cast [-Wint-conversion]
> >>>>>      vdev->priv = vm = kzalloc(sizeof(*vm), GFP_KERNEL);
> >>>>>                      ^
> >>>>>>> drivers/virtio/virtio_mem.c:1419:2: error: implicit declaration of function 'kfree'; did you mean 'vfree'? [-Werror=implicit-function-declaration]
> >>>>>      kfree(vm);
> >>>>>      ^~~~~
> >>>>>      vfree
> >>>>>    cc1: some warnings being treated as errors
> >>>>>
> >>>>> vim +1375 drivers/virtio/virtio_mem.c
> >>>>
> >>>> Guess we simply need
> >>>>
> >>>>  #include <linux/slab.h>
> >>>>
> >>>> to make it work for that config.
> >>>
> >>>
> >>> OK I added that in the 1st commit that introduced virtio-mem.
> >>
> >> Thanks. I have some addon-patches ready, what's the best way to continue
> >> with these?
> > 
> > If these are bugfixes, just respin the series (including this fix).
> 
> There are two really minor bugfixes for corner-case error handling and
> one simplification. I can squash them and resend, makes things easier.
> 
> The other stuff I have are extensions, I will send as add-on.
> 
> Thanks!

So just send a giant patchbomb explaining what's what in the
cover letter. Thanks!


> 
> -- 
> Thanks,
> 
> David / dhildenb

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
