Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id A53F02C68B2
	for <lists.virtualization@lfdr.de>; Fri, 27 Nov 2020 16:29:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 59E1487A41;
	Fri, 27 Nov 2020 15:29:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vtBHJO3ti5n0; Fri, 27 Nov 2020 15:29:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id EA57F87A33;
	Fri, 27 Nov 2020 15:29:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C90CDC0052;
	Fri, 27 Nov 2020 15:29:12 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 24992C0052
 for <virtualization@lists.linux-foundation.org>;
 Fri, 27 Nov 2020 15:29:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 0939C8792E
 for <virtualization@lists.linux-foundation.org>;
 Fri, 27 Nov 2020 15:29:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JQPzpOfz6H2T
 for <virtualization@lists.linux-foundation.org>;
 Fri, 27 Nov 2020 15:29:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by hemlock.osuosl.org (Postfix) with ESMTPS id F27CA87A56
 for <virtualization@lists.linux-foundation.org>;
 Fri, 27 Nov 2020 15:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606490948;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XKH3Q9C0g9DkG272hqpSTp7g2ugMtGEgrEgUqH3qkKE=;
 b=Dwn8xf80lBCmLF3eehtY/sO64uOhz7UpR452xLS08JazHSXoiN+eurNzOgFWrOy00JJftj
 SR+TEdDFvLU2izSXb3Z2/5zMAyeeVQ+f/ej8Dc8L32SBGFpuNjevKjfL6eCyINBPvSJYeD
 L875SwvgXI6uLU4YUaGEbJsPTGiMa84=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-461-R__lzFEHOQefCFkEAAC9Tg-1; Fri, 27 Nov 2020 10:29:06 -0500
X-MC-Unique: R__lzFEHOQefCFkEAAC9Tg-1
Received: by mail-wr1-f70.google.com with SMTP id n13so3614300wrs.10
 for <virtualization@lists.linux-foundation.org>;
 Fri, 27 Nov 2020 07:29:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=oXKdmvLkDWwHXIC1vCfXtPKtHEwtoC4CPS+KvE2OLhs=;
 b=GxVgflL1IXkLgjxm1DztJ/EhQqFKgtAq263lb3EJtl8Q46i+M5y4myJTpO6nZ7Bag1
 3CRxYtU/fK3LzP5ua0oZSuFJmwEqVuOBy7RIZ1IoSgaPe0gArUR7YY46XUXhuRVdMmWR
 K9FyDWZqA5Xyol2QCdNO4wTvdi1KfeKaEO3v2124L22pmYTDYyaUN5iMwhHnBFRULxAU
 7pCt7/zkmc3a16aO6qIQ0kkfGsRwWxFYiRDpgT5cgauP/JeIomy/xgwAEk/MfymsK5Q/
 rcL1/Gg5/Er0WXeEzJx6aDIHFA6dswSn7v837YR/Y2+jgkVdD1GLlHX2If82wMfVhKr+
 IKuQ==
X-Gm-Message-State: AOAM5334yrpvupzTa1j03g5cItvibiGI91RQyaRi+2fusaYE9h1isZA7
 pexaGRXdffwSbEQxLPFbcuYvAaqoTpd7YZdeR3td96VxyPZBDVgpQ4fsLIfadnvLl5IrDsuDdZs
 vmkTFS9TpKtnrVOZjXBGWN9RM89aDqxvlfebHx7lcEg==
X-Received: by 2002:a5d:67c5:: with SMTP id n5mr11453729wrw.179.1606490945471; 
 Fri, 27 Nov 2020 07:29:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy/4cCpUXCG3PtHNxRVLUGmUfj2FFttkpnXAUAHHS8uWedyJzj98T7fAMDHerVy+9j1MoYo4Q==
X-Received: by 2002:a5d:67c5:: with SMTP id n5mr11453684wrw.179.1606490945268; 
 Fri, 27 Nov 2020 07:29:05 -0800 (PST)
Received: from steredhat (host-79-17-248-175.retail.telecomitalia.it.
 [79.17.248.175])
 by smtp.gmail.com with ESMTPSA id d3sm14667103wrr.2.2020.11.27.07.29.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2020 07:29:04 -0800 (PST)
Date: Fri, 27 Nov 2020 16:29:01 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>
Subject: Re: [RFC PATCH 23/27] vhost: unmap qemu's shadow virtqueues on sw
 live migration
Message-ID: <20201127152901.cbfu7rmewbxventr@steredhat>
References: <20201120185105.279030-1-eperezma@redhat.com>
 <20201120185105.279030-24-eperezma@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201120185105.279030-24-eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Daniel Daly <dandaly0@gmail.com>,
 virtualization@lists.linux-foundation.org, Liran Alon <liralon@gmail.com>,
 Eli Cohen <eli@mellanox.com>, Nitin Shrivastav <nitin.shrivastav@broadcom.com>,
 Alex Barba <alex.barba@broadcom.com>,
 Christophe Fontaine <cfontain@redhat.com>, Lee Ballard <ballle98@gmail.com>,
 Lars Ganrot <lars.ganrot@gmail.com>, Rob Miller <rob.miller@broadcom.com>,
 Howard Cai <howard.cai@gmail.com>, Parav Pandit <parav@mellanox.com>,
 vm <vmireyno@marvell.com>, Salil Mehta <mehta.salil.lnk@gmail.com>,
 Stephen Finucane <stephenfin@redhat.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Sean Mooney <smooney@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Jim Harford <jim.harford@broadcom.com>,
 Dmytro Kazantsev <dmytro.kazantsev@gmail.com>, Siwei Liu <loseweigh@gmail.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Michael Lilja <ml@napatech.com>,
 Max Gurtovoy <maxgu14@gmail.com>
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Fri, Nov 20, 2020 at 07:51:01PM +0100, Eugenio P=C3=A9rez wrote:
>Since vhost does not need to access it, it has no sense to keep it
>mapped.
>
>Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
>---
> hw/virtio/vhost.c | 1 +
> 1 file changed, 1 insertion(+)
>
>diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
>index f640d4edf0..eebfac4455 100644
>--- a/hw/virtio/vhost.c
>+++ b/hw/virtio/vhost.c
>@@ -1124,6 +1124,7 @@ static int vhost_sw_live_migration_start(struct vhos=
t_dev *dev)
>
>         dev->sw_lm_shadow_vq[idx] =3D vhost_sw_lm_shadow_vq(dev, idx);
>         event_notifier_set_handler(&vq->masked_notifier, vhost_handle_cal=
l);
>+        vhost_virtqueue_memory_unmap(dev, &dev->vqs[idx], true);

IIUC vhost_virtqueue_memory_unmap() is already called at the end of =

vhost_virtqueue_stop(), so we can skip this call, right?

>
>         vhost_vring_write_addr(dev->sw_lm_shadow_vq[idx], &addr);
>         r =3D dev->vhost_ops->vhost_set_vring_addr(dev, &addr);
>-- 2.18.4
>

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
