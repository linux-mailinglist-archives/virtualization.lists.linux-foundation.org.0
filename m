Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 450A21C7B40
	for <lists.virtualization@lfdr.de>; Wed,  6 May 2020 22:29:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 5B77825F5B;
	Wed,  6 May 2020 20:29:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lkRXtlYDKBKr; Wed,  6 May 2020 20:29:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 2C01E25C57;
	Wed,  6 May 2020 20:29:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 19030C0859;
	Wed,  6 May 2020 20:29:00 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D860AC0859
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 May 2020 20:28:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id C978489335
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 May 2020 20:28:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KsupS0t4ezYm
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 May 2020 20:28:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 0D009892B5
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 May 2020 20:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588796933;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Cu+S4C27UOFa3OfMh+dHOhDVzuXz2x4jIHvsepSqLnk=;
 b=KdfUx82HVaHJAs+y2oE4beBawHiwjCaGisvs2tb8MmYS1SJa7Qx5N+/W8Hbn+5k8eqll1U
 WVDbYu910ENK1y0mCnIN88/5lNykb6Tzjs3ftrAgPUrx8sp/rs3EJ1c1l82pCpBS3C6B7z
 D1kmj/f8XJ4AeJk4CawsGJMY7UPJ1sA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-299-V0Z0QiqROQS4hkOz1nGErg-1; Wed, 06 May 2020 16:28:52 -0400
X-MC-Unique: V0Z0QiqROQS4hkOz1nGErg-1
Received: by mail-wm1-f69.google.com with SMTP id w2so1867551wmc.3
 for <virtualization@lists.linux-foundation.org>;
 Wed, 06 May 2020 13:28:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Cu+S4C27UOFa3OfMh+dHOhDVzuXz2x4jIHvsepSqLnk=;
 b=iyK46ZZ9Pkj8BQs32NM4p9T6Vd++NeQHQUCDCd3LQ8D7OECcgVgrSoyc2p112aElmC
 qSmfTTh7XN9LD7EiIB2+ZrOGPPm1LEWSXCPC1QQQiXVmCq2VrYIgENr9azTTs3FzENUa
 hDoobb4WLZ7TwPcBQU5Cwrdqr5BiPz+5sneVl0/+3BY20Yz7XI/AWfx+nEq1pHogmdCE
 ihX9Klpkl+eKw+RVRS0gV/FJ59TBneOwtEfz2oBWGRS4b9T6KpnIu9B2F/wfB9MeNU13
 qh6nodxEhRKJHelsgA+PE/to9+nVd6b2kC/saiIz9cfXPjS9Ynx7VBEjOsOaFy1lQMUG
 9f3Q==
X-Gm-Message-State: AGi0PubOTBhc8caotZ3+E04yccJ/cNmbU0puE5LeCVQBp2PPe7TclEHI
 z1N1Fa+1DZ8IULesRzFdHDnUZg15Lfi9c8M4grADdSWhlMy8tYcJ7eq7ET7IF1D7X1q20hZ5CV/
 j5ZPGbfjIUZ1zalGlHvk2UTi84H0Utl5NorAiF7Kk4A==
X-Received: by 2002:adf:e449:: with SMTP id t9mr11428844wrm.108.1588796931026; 
 Wed, 06 May 2020 13:28:51 -0700 (PDT)
X-Google-Smtp-Source: APiQypJYl+rPKkzHvCZgpgimxYFgM4/uAdMXx173aAgzcr8cA+F2M7DbC5yVSSYFy58Q5bTl4e+qyg==
X-Received: by 2002:adf:e449:: with SMTP id t9mr11428829wrm.108.1588796930811; 
 Wed, 06 May 2020 13:28:50 -0700 (PDT)
Received: from redhat.com (bzq-109-66-7-121.red.bezeqint.net. [109.66.7.121])
 by smtp.gmail.com with ESMTPSA id
 q4sm4632965wrx.9.2020.05.06.13.28.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 May 2020 13:28:50 -0700 (PDT)
Date: Wed, 6 May 2020 16:28:48 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [vhost:vhost 8/22] drivers/virtio/virtio_mem.c:1375:20: error:
 implicit declaration of function 'kzalloc'; did you mean 'vzalloc'?
Message-ID: <20200506162751-mutt-send-email-mst@kernel.org>
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

OK try to do it ASAP, we don't want to repeat the drama we had with vdpa.

> The other stuff I have are extensions, I will send as add-on.
> 
> Thanks!
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
