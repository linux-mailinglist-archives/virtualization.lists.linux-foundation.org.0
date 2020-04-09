Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE3C1A3B49
	for <lists.virtualization@lfdr.de>; Thu,  9 Apr 2020 22:25:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 461ED86AC9;
	Thu,  9 Apr 2020 20:25:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v4AfiaUwGPN3; Thu,  9 Apr 2020 20:25:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B715C86A42;
	Thu,  9 Apr 2020 20:25:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8C838C0177;
	Thu,  9 Apr 2020 20:25:27 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6940FC0177
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Apr 2020 20:25:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 4C7B724B6C
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Apr 2020 20:25:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9tF2-xZrS-XA
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Apr 2020 20:25:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by silver.osuosl.org (Postfix) with ESMTPS id 2F028204FB
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Apr 2020 20:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586463922;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=L8axp0M5oMyn2GgLyL35ut9Src771+7B+nC1atGx9hE=;
 b=CtodDgnmq14Flol6VGruMyhaU1bHSCY72jifTfhul+kYGHODaHiyY3/B/HBS+lTwR33Bj9
 QkxqTti1MfRM5Na21hiRn7rdTJlK3HtcaDV5IEz1CnLAxZMEW9xIPjcsxgA+JXtCUeMVmh
 9IakI0XvXCYw1Uc1ixVJsp1w3rfezkE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-513-VvRblQlsNRyBaG9fHNa81A-1; Thu, 09 Apr 2020 16:25:21 -0400
X-MC-Unique: VvRblQlsNRyBaG9fHNa81A-1
Received: by mail-wr1-f71.google.com with SMTP id f15so4286667wrj.2
 for <virtualization@lists.linux-foundation.org>;
 Thu, 09 Apr 2020 13:25:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=L8axp0M5oMyn2GgLyL35ut9Src771+7B+nC1atGx9hE=;
 b=f/uHFvSQzo72IW8mkug47XFf7mzF51weIoobIeBg6LTvyMTGgt98WBZ+7PxLCwtIic
 PF/tWkJJyyWCc2e5HsXQvgnOoBuxqv96pIx6tNU2Wh0qzmEqYDPqIlG3X1CghxWYlubI
 63VJxB3LTDVR2EBRAZkPROyxdpBmC9EstQQ8K2uncOQbKEgFN6EJtrtlaWrvBxS4ka/a
 3BAEvCCmACN83d1+ejKJw9D8/I7rthm21l2YAQX/g36JVn43XfawD5wzVoueDjFmKlGV
 6SEu2WMwKcX6dtYkx+C6oVWuVqO6FY6SvULOb6SXNVIznvMcZBmunBV/VVp0T3z7WI1N
 rENw==
X-Gm-Message-State: AGi0Pua+AWrvVbleEqVvJCA/iRvV8law4i2vGT+/sLSD5zBN2WGNgNmg
 byLEGLlT6AV8+9riCrNABluf/zUqWVyDO3Zm+cKFVpNc+qdxMeVLhK4Rr/bsG1WxtLcIit5H+GG
 jZIKqVz7vH+RRaL26kqycNJ03xxWFe4fNzwCxXpmW4w==
X-Received: by 2002:a5d:5273:: with SMTP id l19mr962753wrc.42.1586463920112;
 Thu, 09 Apr 2020 13:25:20 -0700 (PDT)
X-Google-Smtp-Source: APiQypK9hgUgDJGxmm/80KKJjVxLtENNXunW/R8rpld3/YZUF/cp56xBd16lnX4CPWATeKNdabIvmw==
X-Received: by 2002:a5d:5273:: with SMTP id l19mr962722wrc.42.1586463919863;
 Thu, 09 Apr 2020 13:25:19 -0700 (PDT)
Received: from redhat.com (bzq-109-67-97-76.red.bezeqint.net. [109.67.97.76])
 by smtp.gmail.com with ESMTPSA id
 s13sm25438882wrw.20.2020.04.09.13.25.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Apr 2020 13:25:19 -0700 (PDT)
Date: Thu, 9 Apr 2020 16:25:15 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH V9 9/9] virtio: Intel IFC VF driver for VDPA
Message-ID: <20200409162427-mutt-send-email-mst@kernel.org>
References: <20200326140125.19794-1-jasowang@redhat.com>
 <20200326140125.19794-10-jasowang@redhat.com>
 <CAK8P3a1RXUXs5oYjB=Jq5cpvG11eTnmJ+vc18_-0fzgTH6envA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAK8P3a1RXUXs5oYjB=Jq5cpvG11eTnmJ+vc18_-0fzgTH6envA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: kvm list <kvm@vger.kernel.org>, virtualization@lists.linux-foundation.org,
 rob.miller@broadcom.com, saugatm@xilinx.com, lulu@redhat.com,
 hanand@xilinx.com, Christoph Hellwig <hch@infradead.org>, eperezma@redhat.com,
 Jason Gunthorpe <jgg@mellanox.com>, mhabets@solarflare.com,
 shahafs@mellanox.com, Parav Pandit <parav@mellanox.com>, vmireyno@marvell.com,
 gdawar@xilinx.com, Jiri Pirko <jiri@mellanox.com>, xiao.w.wang@intel.com,
 Stefan Hajnoczi <stefanha@redhat.com>, zhihong.wang@intel.com,
 zhangweining@ruijie.com.cn, Bie Tiwei <tiwei.bie@intel.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 maxime.coquelin@redhat.com, Networking <netdev@vger.kernel.org>,
 lingshan.zhu@intel.com
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

On Thu, Apr 09, 2020 at 12:41:13PM +0200, Arnd Bergmann wrote:
> On Thu, Mar 26, 2020 at 3:08 PM Jason Wang <jasowang@redhat.com> wrote:
> >
> > From: Zhu Lingshan <lingshan.zhu@intel.com>
> >
> > This commit introduced two layers to drive IFC VF:
> >
> > (1) ifcvf_base layer, which handles IFC VF NIC hardware operations and
> >     configurations.
> >
> > (2) ifcvf_main layer, which complies to VDPA bus framework,
> >     implemented device operations for VDPA bus, handles device probe,
> >     bus attaching, vring operations, etc.
> >
> > Signed-off-by: Zhu Lingshan <lingshan.zhu@intel.com>
> > Signed-off-by: Bie Tiwei <tiwei.bie@intel.com>
> > Signed-off-by: Wang Xiao <xiao.w.wang@intel.com>
> > Signed-off-by: Jason Wang <jasowang@redhat.com>
> 
> > +
> > +#define IFCVF_QUEUE_ALIGNMENT  PAGE_SIZE
> > +#define IFCVF_QUEUE_MAX                32768
> > +static u16 ifcvf_vdpa_get_vq_align(struct vdpa_device *vdpa_dev)
> > +{
> > +       return IFCVF_QUEUE_ALIGNMENT;
> > +}
> 
> This fails to build on arm64 with 64kb page size (found in linux-next):
> 
> /drivers/vdpa/ifcvf/ifcvf_main.c: In function 'ifcvf_vdpa_get_vq_align':
> arch/arm64/include/asm/page-def.h:17:20: error: conversion from 'long
> unsigned int' to 'u16' {aka 'short unsigned int'} changes value from
> '65536' to '0' [-Werror=overflow]
>    17 | #define PAGE_SIZE  (_AC(1, UL) << PAGE_SHIFT)
>       |                    ^
> drivers/vdpa/ifcvf/ifcvf_base.h:37:31: note: in expansion of macro 'PAGE_SIZE'
>    37 | #define IFCVF_QUEUE_ALIGNMENT PAGE_SIZE
>       |                               ^~~~~~~~~
> drivers/vdpa/ifcvf/ifcvf_main.c:231:9: note: in expansion of macro
> 'IFCVF_QUEUE_ALIGNMENT'
>   231 |  return IFCVF_QUEUE_ALIGNMENT;
>       |         ^~~~~~~~~~~~~~~~~~~~~
> 
> It's probably good enough to just not allow the driver to be built in that
> configuration as it's fairly rare but unfortunately there is no simple Kconfig
> symbol for it.
> 
> In a similar driver, we did
> 
> config VMXNET3
>         tristate "VMware VMXNET3 ethernet driver"
>         depends on PCI && INET
>         depends on !(PAGE_SIZE_64KB || ARM64_64K_PAGES || \
>                      IA64_PAGE_SIZE_64KB || MICROBLAZE_64K_PAGES || \
>                      PARISC_PAGE_SIZE_64KB || PPC_64K_PAGES)
> 
> I think we should probably make PAGE_SIZE_64KB a global symbol
> in arch/Kconfig and have it selected by the other symbols so drivers
> like yours can add a dependency for it.
> 
>          Arnd

It's probably easier to make the alignment u32 - I don't really know why it's
u16, all callers seem to assign the result to a u32 value.

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
