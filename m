Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E751A32A0
	for <lists.virtualization@lfdr.de>; Thu,  9 Apr 2020 12:41:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5F2C4875E0;
	Thu,  9 Apr 2020 10:41:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4V6CsuVIuMVy; Thu,  9 Apr 2020 10:41:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id F340E874D4;
	Thu,  9 Apr 2020 10:41:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D1B8CC0177;
	Thu,  9 Apr 2020 10:41:37 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4A0DEC0177
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Apr 2020 10:41:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 35E4887A5F
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Apr 2020 10:41:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NdPHYDibFFT5
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Apr 2020 10:41:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 8EB6487A5A
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Apr 2020 10:41:34 +0000 (UTC)
Received: from mail-qk1-f173.google.com ([209.85.222.173]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MofPt-1iyN181mKf-00p8TI for <virtualization@lists.linux-foundation.org>;
 Thu, 09 Apr 2020 12:41:31 +0200
Received: by mail-qk1-f173.google.com with SMTP id 130so3411762qke.4
 for <virtualization@lists.linux-foundation.org>;
 Thu, 09 Apr 2020 03:41:31 -0700 (PDT)
X-Gm-Message-State: AGi0PuYWzTGKVidwtihkZYMYGHFo5uGS8nwSUeZ2vF6l61L0Juxket6N
 8jaNlUN4bTkC2msk4JxoQ7soQ5L1gKHmxcIDRC4=
X-Google-Smtp-Source: APiQypJ+MZNDx1nAeHQJUrsxI3ccDEBo8kCLAwyqI5SJ9WAba6/XBRqyHYyNfPORCxMsxCe8/yMMMt7xih71qKreb4o=
X-Received: by 2002:a37:a52:: with SMTP id 79mr11506167qkk.3.1586428890169;
 Thu, 09 Apr 2020 03:41:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200326140125.19794-1-jasowang@redhat.com>
 <20200326140125.19794-10-jasowang@redhat.com>
In-Reply-To: <20200326140125.19794-10-jasowang@redhat.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 9 Apr 2020 12:41:13 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1RXUXs5oYjB=Jq5cpvG11eTnmJ+vc18_-0fzgTH6envA@mail.gmail.com>
Message-ID: <CAK8P3a1RXUXs5oYjB=Jq5cpvG11eTnmJ+vc18_-0fzgTH6envA@mail.gmail.com>
Subject: Re: [PATCH V9 9/9] virtio: Intel IFC VF driver for VDPA
To: Jason Wang <jasowang@redhat.com>
X-Provags-ID: V03:K1:j0NcWy04tI8K/jGmcxk632TuVME/ZCE8EQJgvbdmpSRglCMYw8b
 R8eMxa49kaCpPImdTuAo4oYShsg2USD1bamVQyXXukOG4YVbU79Z2jOnh4DynSokofGZeGX
 gH+IryAxzxJoKi+M6UhQdCVwFS3ya1OiuBve1yLrcreh+YyM9XqNnQ0Zdrr+np4QtlbNkH2
 Hp10jbiUh0WXrHl4L9Tjg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:szS33LkPLH4=:KOn9Xcrsk/Bxo+L8SjZstg
 BCFT+EcwP2q/HRJOAmN30NQdPcq91C8XW7tkNANbENUGRE/TJRAnhAFzggGCoRP1U47hBtX7b
 xpqBP9oT+2lXWYvvIrNnZtREogjEeHXjReToDotXWHNZz5dY+tem8angymNFZny/xyOMX9FXz
 4ZNKNyxyd65Zyx1iut5n2eqE52X+fZh5xsHiOa8ZOGgy0DrRHf96m187gUw1dczFPA/h9zvgC
 JXO8gPnzF83Z0b+WErhkcQFt0mfe6vITCfDA+NurAdJlShzkFyqmvj+0KFPnAN1Hog7QABaS+
 6SGdGUHV70x256Hb+iXjF+Vnf24sAYyZErb+grYaDpDPwu8RxFozPgx3CxSNG4qySsedfcE2G
 vRmOIAfdA0zeAY58hQKoNGrUQ4MNcGcuoafov3nkmPc3qaiZ29sgRa4qbhJIrEeOHXZiHft0K
 hh+b+QaaIsW3lu6Lsx9hPzCR2LxgWIMVBPy+wCxCR03DKXPW6o88sUep7zmfQZIRC2oT9y9H6
 AhDts7D5vUuUZ1J3JKulAXIvbWmRHkaot467cDXxPZ8bZug1nz8mWZFIlcCoCkv629AgldY2J
 uyK+lLW06xGtyNVvv49AkCIybIX4wPXJW3IXpc4fk5f8bn/BsxAsI9y4AvarhmkFsgSA+sf6c
 NKIB/AeW5F57SnDrmkH7PPDBR02hlYUVHR8XggOcR11Zjt5RYfpztvBEMNnBy+Ode4oQJPIuV
 saeWGgaBwowxZ1VgYBCD0Fd8/tdORZZuOIKAZ4j1rhSvjZQENmwFSOwwJNN91UrgFxKMNqbgV
 d40aDV1njXm3ZA1D1v+8GdL8OggjZOCYSDp6RF9VpXsIpTIf8Y=
Cc: kvm list <kvm@vger.kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 mhabets@solarflare.com, virtualization@lists.linux-foundation.org,
 rob.miller@broadcom.com, saugatm@xilinx.com, lulu@redhat.com,
 hanand@xilinx.com, Christoph Hellwig <hch@infradead.org>, eperezma@redhat.com,
 Jason Gunthorpe <jgg@mellanox.com>, shahafs@mellanox.com,
 Parav Pandit <parav@mellanox.com>, vmireyno@marvell.com, gdawar@xilinx.com,
 Jiri Pirko <jiri@mellanox.com>, xiao.w.wang@intel.com,
 Stefan Hajnoczi <stefanha@redhat.com>, zhihong.wang@intel.com,
 zhangweining@ruijie.com.cn, Bie Tiwei <tiwei.bie@intel.com>,
 Networking <netdev@vger.kernel.org>, Randy Dunlap <rdunlap@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 maxime.coquelin@redhat.com, lingshan.zhu@intel.com
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

On Thu, Mar 26, 2020 at 3:08 PM Jason Wang <jasowang@redhat.com> wrote:
>
> From: Zhu Lingshan <lingshan.zhu@intel.com>
>
> This commit introduced two layers to drive IFC VF:
>
> (1) ifcvf_base layer, which handles IFC VF NIC hardware operations and
>     configurations.
>
> (2) ifcvf_main layer, which complies to VDPA bus framework,
>     implemented device operations for VDPA bus, handles device probe,
>     bus attaching, vring operations, etc.
>
> Signed-off-by: Zhu Lingshan <lingshan.zhu@intel.com>
> Signed-off-by: Bie Tiwei <tiwei.bie@intel.com>
> Signed-off-by: Wang Xiao <xiao.w.wang@intel.com>
> Signed-off-by: Jason Wang <jasowang@redhat.com>

> +
> +#define IFCVF_QUEUE_ALIGNMENT  PAGE_SIZE
> +#define IFCVF_QUEUE_MAX                32768
> +static u16 ifcvf_vdpa_get_vq_align(struct vdpa_device *vdpa_dev)
> +{
> +       return IFCVF_QUEUE_ALIGNMENT;
> +}

This fails to build on arm64 with 64kb page size (found in linux-next):

/drivers/vdpa/ifcvf/ifcvf_main.c: In function 'ifcvf_vdpa_get_vq_align':
arch/arm64/include/asm/page-def.h:17:20: error: conversion from 'long
unsigned int' to 'u16' {aka 'short unsigned int'} changes value from
'65536' to '0' [-Werror=overflow]
   17 | #define PAGE_SIZE  (_AC(1, UL) << PAGE_SHIFT)
      |                    ^
drivers/vdpa/ifcvf/ifcvf_base.h:37:31: note: in expansion of macro 'PAGE_SIZE'
   37 | #define IFCVF_QUEUE_ALIGNMENT PAGE_SIZE
      |                               ^~~~~~~~~
drivers/vdpa/ifcvf/ifcvf_main.c:231:9: note: in expansion of macro
'IFCVF_QUEUE_ALIGNMENT'
  231 |  return IFCVF_QUEUE_ALIGNMENT;
      |         ^~~~~~~~~~~~~~~~~~~~~

It's probably good enough to just not allow the driver to be built in that
configuration as it's fairly rare but unfortunately there is no simple Kconfig
symbol for it.

In a similar driver, we did

config VMXNET3
        tristate "VMware VMXNET3 ethernet driver"
        depends on PCI && INET
        depends on !(PAGE_SIZE_64KB || ARM64_64K_PAGES || \
                     IA64_PAGE_SIZE_64KB || MICROBLAZE_64K_PAGES || \
                     PARISC_PAGE_SIZE_64KB || PPC_64K_PAGES)

I think we should probably make PAGE_SIZE_64KB a global symbol
in arch/Kconfig and have it selected by the other symbols so drivers
like yours can add a dependency for it.

         Arnd
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
