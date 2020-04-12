Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id F33E31A5D81
	for <lists.virtualization@lfdr.de>; Sun, 12 Apr 2020 10:38:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 857C9848A9;
	Sun, 12 Apr 2020 08:38:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id srzNfEmHt5ZO; Sun, 12 Apr 2020 08:38:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id DFE0783C00;
	Sun, 12 Apr 2020 08:38:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C3944C0172;
	Sun, 12 Apr 2020 08:38:09 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 66EF6C0172
 for <virtualization@lists.linux-foundation.org>;
 Sun, 12 Apr 2020 08:38:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 51DA88789C
 for <virtualization@lists.linux-foundation.org>;
 Sun, 12 Apr 2020 08:38:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jYsrbSIetOYw
 for <virtualization@lists.linux-foundation.org>;
 Sun, 12 Apr 2020 08:38:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 6D37A8788B
 for <virtualization@lists.linux-foundation.org>;
 Sun, 12 Apr 2020 08:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586680686;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pa4kCZZR1TWcPuT6bVou7G+wE1hyHACGM2NIHCRQaQs=;
 b=cKHT/F663EhCbfUSqQ14Q/Ypd68OFhiYA4WfknbkWHUuAgUx2W4mf0ecThO+SdKtKxAnxI
 qc0bQ2OOKtj7iuoDKXSHXZ+yKBrpsejR/DK9EcIN3czU5rPAUTH0Uq2bb5CktYxoBTy5+9
 AfwyerYo/UY4UqizBRZLgqpPEuJvaHo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-225-GlmrTGdRPlWwZ7bF7mrZ_g-1; Sun, 12 Apr 2020 04:38:02 -0400
X-MC-Unique: GlmrTGdRPlWwZ7bF7mrZ_g-1
Received: by mail-wr1-f72.google.com with SMTP id d17so3667450wrr.17
 for <virtualization@lists.linux-foundation.org>;
 Sun, 12 Apr 2020 01:38:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=pa4kCZZR1TWcPuT6bVou7G+wE1hyHACGM2NIHCRQaQs=;
 b=fgeJ2FTUxSTkOLut5VD+zfQvalBMmxi7RyFjO66n0Fnsiy+4OxX6DekhH4log3/BMz
 wtK1KLSyjWSc9eALnXNf9iAPtWN+MFd/7qbHKgUwp10u6lJHrlRRwLX9Y4Em6s7EEPu6
 OWgAVU/n9XGYduppbjKiA0fJfcpGRx4A6OVlAwpJBcisC0hUVsyErylTtLOyJjVpixn+
 feiUdxjBd/Yvp37Vn0mls0G+Ed68WKKRMRE9usz40azgubAgFUnArar/Qj5/CdIRAwGK
 UZ43Q+sr/ifqwvlR/WMG87oTIJjX77iVw+7m0nzrmkBRxNOB8gigzMifVcgMSHrkKOTB
 jerQ==
X-Gm-Message-State: AGi0PuYbGscHXk6BYavBT6H3kKzvo0F9RpUGfQl8m1hGXrdKub7prI0R
 NDF/XPObEtHDv1JGJq+NjQHz0w8JDQ+0beh4lJCDjbrED3OHzgwguWVQHpnoYPCbi9Y05gysJrD
 klaLFyrOqsU0+Cu3rBITKQg6KBj4oyU7R5GnsF9imig==
X-Received: by 2002:a1c:c90a:: with SMTP id f10mr12983085wmb.179.1586680680914; 
 Sun, 12 Apr 2020 01:38:00 -0700 (PDT)
X-Google-Smtp-Source: APiQypJpGQcwg9BNxwrWgtjJoNNurdp47wD0GtLgDgtuiAQDaLS5bakxHQGpI2dtKfuzN5LGIim6Aw==
X-Received: by 2002:a1c:c90a:: with SMTP id f10mr12983074wmb.179.1586680680653; 
 Sun, 12 Apr 2020 01:38:00 -0700 (PDT)
Received: from redhat.com (bzq-79-183-51-3.red.bezeqint.net. [79.183.51.3])
 by smtp.gmail.com with ESMTPSA id y5sm10563354wru.15.2020.04.12.01.37.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Apr 2020 01:37:59 -0700 (PDT)
Date: Sun, 12 Apr 2020 04:37:55 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [GIT PULL] vhost: fixes, vdpa
Message-ID: <20200412041730-mutt-send-email-mst@kernel.org>
References: <20200406171124-mutt-send-email-mst@kernel.org>
 <CAHk-=wg7sMywb2V8gifhpUDE=DWQTvg1wDieKVc0UoOSsOrynw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHk-=wg7sMywb2V8gifhpUDE=DWQTvg1wDieKVc0UoOSsOrynw@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: tiwei.bie@intel.com, KVM list <kvm@vger.kernel.org>,
 Netdev <netdev@vger.kernel.org>, Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 virtualization@lists.linux-foundation.org, tysand@google.com,
 eperezma@redhat.com, xiao.w.wang@intel.com, Nadav Amit <namit@vmware.com>,
 David Rientjes <rientjes@google.com>, yuri.benditovich@daynix.com,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 Michal Hocko <mhocko@kernel.org>, lingshan.zhu@intel.com
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

On Sat, Apr 11, 2020 at 09:38:05AM -0700, Linus Torvalds wrote:
> On Mon, Apr 6, 2020 at 2:11 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > The new vdpa subsystem with two first drivers.
> 
> So this one is really annoying to configure.
> 
> First it asks for vDPA driver for virtio devices (VIRTIO_VDPA) support.
> 
> If you say 'n', it then asks *again* for VDPA drivers (VDPA_MENU).
> 
> And then when you say 'n' to *that* it asks you for Vhost driver for
> vDPA-based backend (VHOST_VDPA).
> 
> This kind of crazy needs to stop.
> 
> Doing kernel configuration is not supposed to be like some truly
> horrendously boring Colossal Cave Adventure game where you have to
> search for a way out of maze of twisty little passages, all alike.
> 
>                 Linus

Hmm it's a good point.  Thanks, Linus!
I think this was copied from virtio which has drivers spread all over
the tree.

Jason, if VDPA_MENU is off, then we don't have any drivers. So what's
the point of selecting VDPA core from vhost/virtio then?

So how about this? Lightly tested. Jason, could you pls play with this
a bit more and let me know if you see any issues?

-->
vdpa: make vhost, virtio depend on menu

If user did not configure any vdpa drivers, neither vhost
nor virtio vdpa are going to be useful. So there's no point
in prompting for these and selecting vdpa core automatically.
Simplify configuration by making virtio and vhost vdpa
drivers depend on vdpa menu entry. Once done, we no longer
need a separate menu entry, so also get rid of this.
While at it, fix up the IFC entry: VDPA->vDPA for consistency
with other places.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

---

diff --git a/drivers/vhost/Kconfig b/drivers/vhost/Kconfig
index cb6b17323eb2..3b43411361fe 100644
--- a/drivers/vhost/Kconfig
+++ b/drivers/vhost/Kconfig
@@ -64,7 +64,7 @@ config VHOST_VDPA
 	tristate "Vhost driver for vDPA-based backend"
 	depends on EVENTFD
 	select VHOST
-	select VDPA
+	depends on VDPA_MENU
 	help
 	  This kernel module can be loaded in host kernel to accelerate
 	  guest virtio devices with the vDPA-based backends.
diff --git a/drivers/virtio/Kconfig b/drivers/virtio/Kconfig
index 2aadf398d8cc..bf13755a5ba5 100644
--- a/drivers/virtio/Kconfig
+++ b/drivers/virtio/Kconfig
@@ -45,7 +45,7 @@ config VIRTIO_PCI_LEGACY
 
 config VIRTIO_VDPA
 	tristate "vDPA driver for virtio devices"
-	select VDPA
+	depend on VDPA_MENU
 	select VIRTIO
 	help
 	  This driver provides support for virtio based paravirtual

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
