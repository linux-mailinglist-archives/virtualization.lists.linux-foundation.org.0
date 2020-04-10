Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 868BF1A4324
	for <lists.virtualization@lfdr.de>; Fri, 10 Apr 2020 09:45:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id DBAF3878A0;
	Fri, 10 Apr 2020 07:45:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C6Cy1xNmuUKI; Fri, 10 Apr 2020 07:45:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0D92F8805A;
	Fri, 10 Apr 2020 07:45:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DC868C0177;
	Fri, 10 Apr 2020 07:45:23 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EEC88C0177
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Apr 2020 07:45:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id E273B2036C
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Apr 2020 07:45:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c4TNqaioFnc6
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Apr 2020 07:45:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 by silver.osuosl.org (Postfix) with ESMTPS id A5AED2035E
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Apr 2020 07:45:21 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id w12so235532otm.13
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Apr 2020 00:45:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c9BJA5kwXSY009wyyInjyYUXASRt/6Rey8B6iWb2SF0=;
 b=b7hdTCEGVlqYvbnG6CuznmIwHU0QaRUf2+uHzWSaKBcnPqtqcFIhDfox3RwudgenaR
 mCe/Zy8+vGyHHIxT8uyI08f4BFFSXnLYAV+WbJf7tSKApfPFOIkxowujHCY81Z95YAgL
 vUJ+ih/C/xTDm6u1ZYGHP/oAKJTCMXaWOCV04sTCG79iwkyVyNJY5fH7VSEfhABvfdyL
 mEGXhSaC2ibc27GChrxAii3eWpnENwzPIfqSMmQsmwI8j2TjyfKpfi0kw8H9S9ZTmOxE
 UYeeuJpIg8mT+RX0ldOHskR+TV2gnp0bfKkRGspiQwdmwqq8Ff4WTKhJC22/GIepxXrk
 1Ugw==
X-Gm-Message-State: AGi0PuapaMzN8+G99SE10eooDmrVfg8EAJ7ENDkX5qA5yEADKco+dtPT
 4lwfoWL/kIRSl2w/SqWsgWpOGsyGUCrmaCBtNCE=
X-Google-Smtp-Source: APiQypKISMwlaDr4vBs+Tumqx8h8r7SK5oimoKVzWxc+LbQ7UeKu9R+aW/E1Uql3e3RFjK7nUu4xiGQ99QHzWy0fNR8=
X-Received: by 2002:a05:6830:1e0e:: with SMTP id
 s14mr3093072otr.107.1586504720818; 
 Fri, 10 Apr 2020 00:45:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200326140125.19794-1-jasowang@redhat.com>
 <20200326140125.19794-9-jasowang@redhat.com>
In-Reply-To: <20200326140125.19794-9-jasowang@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 10 Apr 2020 09:45:09 +0200
Message-ID: <CAMuHMdUis3O_mJKOb2s=_=Zs61iHus5Aq74N3-xs7kmjN+egoQ@mail.gmail.com>
Subject: Re: [PATCH V9 8/9] vdpasim: vDPA device simulator
To: Jason Wang <jasowang@redhat.com>
Cc: KVM list <kvm@vger.kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Martin Habets <mhabets@solarflare.com>,
 virtualization@lists.linux-foundation.org, rob.miller@broadcom.com,
 saugatm@xilinx.com, lulu@redhat.com, hanand@xilinx.com,
 Christoph Hellwig <hch@infradead.org>, eperezma@redhat.com,
 Jason Gunthorpe <jgg@mellanox.com>, shahafs@mellanox.com, parav@mellanox.com,
 vmireyno@marvell.com, gdawar@xilinx.com, Jiri Pirko <jiri@mellanox.com>,
 xiao.w.wang@intel.com, stefanha@redhat.com, zhihong.wang@intel.com,
 zhangweining@ruijie.com.cn, netdev <netdev@vger.kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
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

Hi Jason,

On Thu, Mar 26, 2020 at 3:07 PM Jason Wang <jasowang@redhat.com> wrote:
> This patch implements a software vDPA networking device. The datapath
> is implemented through vringh and workqueue. The device has an on-chip
> IOMMU which translates IOVA to PA. For kernel virtio drivers, vDPA
> simulator driver provides dma_ops. For vhost driers, set_map() methods
> of vdpa_config_ops is implemented to accept mappings from vhost.
>
> Currently, vDPA device simulator will loopback TX traffic to RX. So
> the main use case for the device is vDPA feature testing, prototyping
> and development.
>
> Note, there's no management API implemented, a vDPA device will be
> registered once the module is probed. We need to handle this in the
> future development.
>
> Signed-off-by: Jason Wang <jasowang@redhat.com>

This is now commit 2c53d0f64c06f458 ("vdpasim: vDPA device simulator").

> --- a/drivers/virtio/vdpa/Kconfig
> +++ b/drivers/virtio/vdpa/Kconfig
> @@ -5,3 +5,22 @@ config VDPA
>           Enable this module to support vDPA device that uses a
>           datapath which complies with virtio specifications with
>           vendor specific control path.
> +
> +menuconfig VDPA_MENU
> +       bool "VDPA drivers"
> +       default n

    *
    * VDPA drivers
    *
    VDPA drivers (VDPA_MENU) [N/y/?] (NEW) ?

    There is no help available for this option.
    Symbol: VDPA_MENU [=n]
    Type  : bool
    Defined at drivers/vdpa/Kconfig:9
     Prompt: VDPA drivers
     Location:
       -> Device Drivers

I think this deserves a help text, so users know if they want to enable this
option or not.

I had a quick look, but couldn't find the meaning of "vdpa" in the whole kernel
source tree.

Thanks!

> +
> +if VDPA_MENU
> +
> +config VDPA_SIM
> +       tristate "vDPA device simulator"
> +       depends on RUNTIME_TESTING_MENU
> +       select VDPA
> +       select VHOST_RING
> +       default n
> +       help
> +         vDPA networking device simulator which loop TX traffic back
> +         to RX. This device is used for testing, prototyping and
> +         development of vDPA.
> +
> +endif # VDPA_MENU

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
