Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D32E1C5D55
	for <lists.virtualization@lfdr.de>; Tue,  5 May 2020 18:20:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2819E8889B;
	Tue,  5 May 2020 16:20:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id scX8yJtUVMV6; Tue,  5 May 2020 16:20:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 021DB8781C;
	Tue,  5 May 2020 16:20:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C5409C0175;
	Tue,  5 May 2020 16:20:35 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 19241C0175
 for <virtualization@lists.linux-foundation.org>;
 Tue,  5 May 2020 16:20:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id EDDDA23B44
 for <virtualization@lists.linux-foundation.org>;
 Tue,  5 May 2020 16:20:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xav+zNfxb8WC
 for <virtualization@lists.linux-foundation.org>;
 Tue,  5 May 2020 16:20:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by silver.osuosl.org (Postfix) with ESMTPS id 1E7E4204DD
 for <virtualization@lists.linux-foundation.org>;
 Tue,  5 May 2020 16:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588695630;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=I2s71uL8xGKEolWyYIMtKAtRYtl4jyJkJ/99unlnUqU=;
 b=A/MJKhwwgy1KvKpw2EM9WQLdZ2E1/g3dYOpQMrxiVdVPXDaHYmxMEHZlqFT7kn7hZrPb+O
 x1VWc9qBeyJUiQT5XlqcuSlxokv/pDJ/Mn63r+jaS9Q4engpqwvblT421Netz/anCVPcmf
 aDe7u2SO7bdp3xdedG1yR42TlEGON6k=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-386-bYNz8DWsMC6LmtnOYcapFA-1; Tue, 05 May 2020 12:20:12 -0400
X-MC-Unique: bYNz8DWsMC6LmtnOYcapFA-1
Received: by mail-wr1-f70.google.com with SMTP id p2so1456163wrx.12
 for <virtualization@lists.linux-foundation.org>;
 Tue, 05 May 2020 09:20:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=I2s71uL8xGKEolWyYIMtKAtRYtl4jyJkJ/99unlnUqU=;
 b=m44JFRmAhZGzs3mM6BDtQ/0wG9qGe1+TDKb+yQfbrIe48h+Omfk6ZoU1kYLgCzo4SS
 wlj10u1QI/LwpU0ZfwMOIgURyJEfdikN+Wwfe/XzXxtHCTxje/QVlD+eaIDuxFe97Hwk
 n5hqC6ndS23pGwaG4RZ7NPeEmgpOVGAf5fPGPQ5wUCqOZ+JkZfNOr4WTOmeSpLg7ZK4w
 tpywxpcMLVx376snV2MDiLtzqjrkUibZQqe1H25jnApI2wBKu22piXM+ZLnBpliyUn9B
 WiwJgahkKaWyX1XBffpbkHWZpNTlHjSpztVc6EI2vaq9E/zBBMCpn+ghUSXfiiQTChg9
 /Icw==
X-Gm-Message-State: AGi0PuagGeTqXEBmOexDct7AwZvUrcsK4bRO6q2b9X6TnkN9ybMyyiPr
 xUUQc9u/yz3fayn+L4PZPbCygv4HYSooS//uFdN11DPvbqoUaBsXo7mTvMVROKza9Qg7+Btl3mR
 tLtQBsBpYg09v8OskppTKs6P4ZCeT0QWs/DL9nZXC6Q==
X-Received: by 2002:a05:600c:c9:: with SMTP id u9mr4061975wmm.15.1588695610846; 
 Tue, 05 May 2020 09:20:10 -0700 (PDT)
X-Google-Smtp-Source: APiQypItx4pewXH8KspumOw+hW8KlzDc1X/wIkpla2d9GHs5ihHGkbZ8JJ4G4js7d++2/VPr7p4xvA==
X-Received: by 2002:a05:600c:c9:: with SMTP id u9mr4061952wmm.15.1588695610624; 
 Tue, 05 May 2020 09:20:10 -0700 (PDT)
Received: from redhat.com (bzq-109-66-7-121.red.bezeqint.net. [109.66.7.121])
 by smtp.gmail.com with ESMTPSA id
 d1sm3805662wrx.65.2020.05.05.09.20.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 May 2020 09:20:10 -0700 (PDT)
Date: Tue, 5 May 2020 12:20:07 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [vhost:vhost 8/22] drivers/virtio/virtio_mem.c:1375:20: error:
 implicit declaration of function 'kzalloc'; did you mean 'vzalloc'?
Message-ID: <20200505121732-mutt-send-email-mst@kernel.org>
References: <202005052221.83QerHmG%lkp@intel.com>
 <7dea2810-85cf-0892-20a8-bba3e3a2c133@redhat.com>
 <20200505114433-mutt-send-email-mst@kernel.org>
 <3eaebd8d-750a-d046-15f5-706fb00a196e@redhat.com>
MIME-Version: 1.0
In-Reply-To: <3eaebd8d-750a-d046-15f5-706fb00a196e@redhat.com>
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

On Tue, May 05, 2020 at 05:46:44PM +0200, David Hildenbrand wrote:
> On 05.05.20 17:44, Michael S. Tsirkin wrote:
> > On Tue, May 05, 2020 at 04:50:13PM +0200, David Hildenbrand wrote:
> >> On 05.05.20 16:15, kbuild test robot wrote:
> >>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git vhost
> >>> head:   da1742791d8c0c0a8e5471f181549c4726a5c5f9
> >>> commit: 7527631e900d464ed2d533f799cb0da2b29cc6f0 [8/22] virtio-mem: Paravirtualized memory hotplug
> >>> config: x86_64-randconfig-b002-20200505 (attached as .config)
> >>> compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
> >>> reproduce:
> >>>         git checkout 7527631e900d464ed2d533f799cb0da2b29cc6f0
> >>>         # save the attached .config to linux build tree
> >>>         make ARCH=x86_64 
> >>>
> >>> If you fix the issue, kindly add following tag as appropriate
> >>> Reported-by: kbuild test robot <lkp@intel.com>
> >>>
> >>> All error/warnings (new ones prefixed by >>):
> >>>
> >>>    drivers/virtio/virtio_mem.c: In function 'virtio_mem_probe':
> >>>>> drivers/virtio/virtio_mem.c:1375:20: error: implicit declaration of function 'kzalloc'; did you mean 'vzalloc'? [-Werror=implicit-function-declaration]
> >>>      vdev->priv = vm = kzalloc(sizeof(*vm), GFP_KERNEL);
> >>>                        ^~~~~~~
> >>>                        vzalloc
> >>>>> drivers/virtio/virtio_mem.c:1375:18: warning: assignment makes pointer from integer without a cast [-Wint-conversion]
> >>>      vdev->priv = vm = kzalloc(sizeof(*vm), GFP_KERNEL);
> >>>                      ^
> >>>>> drivers/virtio/virtio_mem.c:1419:2: error: implicit declaration of function 'kfree'; did you mean 'vfree'? [-Werror=implicit-function-declaration]
> >>>      kfree(vm);
> >>>      ^~~~~
> >>>      vfree
> >>>    cc1: some warnings being treated as errors
> >>>
> >>> vim +1375 drivers/virtio/virtio_mem.c
> >>
> >> Guess we simply need
> >>
> >>  #include <linux/slab.h>
> >>
> >> to make it work for that config.
> > 
> > 
> > OK I added that in the 1st commit that introduced virtio-mem.
> 
> Thanks. I have some addon-patches ready, what's the best way to continue
> with these?

If these are bugfixes, just respin the series (including this fix).
If these are more features, you can just post them on list noting "next" in
subject and saying "this is on top of vhost tree" after --.
I don't know how to make 0-day figure out where to apply such dependent
patches unfortunately.

> 
> -- 
> Thanks,
> 
> David / dhildenb

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
