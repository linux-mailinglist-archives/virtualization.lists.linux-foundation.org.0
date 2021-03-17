Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id EFBD833F062
	for <lists.virtualization@lfdr.de>; Wed, 17 Mar 2021 13:31:57 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 847BE42FDF;
	Wed, 17 Mar 2021 12:31:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RmmCQeYPSVMA; Wed, 17 Mar 2021 12:31:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTP id 623D24320A;
	Wed, 17 Mar 2021 12:31:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E3EC0C0001;
	Wed, 17 Mar 2021 12:31:54 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DAAFFC0001
 for <virtualization@lists.linux-foundation.org>;
 Wed, 17 Mar 2021 12:31:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C89244EBD1
 for <virtualization@lists.linux-foundation.org>;
 Wed, 17 Mar 2021 12:31:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SMU3KgFS1czr
 for <virtualization@lists.linux-foundation.org>;
 Wed, 17 Mar 2021 12:31:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DC5264EBFA
 for <virtualization@lists.linux-foundation.org>;
 Wed, 17 Mar 2021 12:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615984311;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=opf2IYPL2Wwj1A/EGzJ6ciC0XM7X9zmQqBqco2eLuXw=;
 b=QjGDHyAAoXQkx09G2BcNzmpfUC895TEFOehyzK51xBkR+mDiujkkK4mSqpPmWItDYf1cy0
 oVrRAVcaft59AieKrAIDov77sXkpLz2wqTKPpvTJ8xlgAM81DElfv73tEeRbnc/iMRV4Ym
 DecmVJ9kTOC+ojaKHv+FfdfQ0PlajVQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-57-3e1aosdpNcuB4oXFchzEZA-1; Wed, 17 Mar 2021 08:31:47 -0400
X-MC-Unique: 3e1aosdpNcuB4oXFchzEZA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3CA0F593A1;
 Wed, 17 Mar 2021 12:31:45 +0000 (UTC)
Received: from horse.redhat.com (ovpn-116-32.rdu2.redhat.com [10.10.116.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 559BC60C13;
 Wed, 17 Mar 2021 12:31:38 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id E454D220BCF; Wed, 17 Mar 2021 08:31:37 -0400 (EDT)
Date: Wed, 17 Mar 2021 08:31:37 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: Luis Henriques <lhenriques@suse.de>
Subject: Re: [PATCH v2] virtiofs: fix memory leak in virtio_fs_probe()
Message-ID: <20210317123137.GA324911@redhat.com>
References: <20210317084443.22657-1-lhenriques@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210317084443.22657-1-lhenriques@suse.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Cc: Miklos Szeredi <miklos@szeredi.hu>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, virtualization@lists.linux-foundation.org,
 virtio-fs@redhat.com, Stefan Hajnoczi <stefanha@redhat.com>,
 linux-fsdevel@vger.kernel.org
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

On Wed, Mar 17, 2021 at 08:44:43AM +0000, Luis Henriques wrote:
> When accidentally passing twice the same tag to qemu, kmemleak ended up
> reporting a memory leak in virtiofs.  Also, looking at the log I saw the
> following error (that's when I realised the duplicated tag):
> 
>   virtiofs: probe of virtio5 failed with error -17
> 
> Here's the kmemleak log for reference:
> 
> unreferenced object 0xffff888103d47800 (size 1024):
>   comm "systemd-udevd", pid 118, jiffies 4294893780 (age 18.340s)
>   hex dump (first 32 bytes):
>     00 00 00 00 ad 4e ad de ff ff ff ff 00 00 00 00  .....N..........
>     ff ff ff ff ff ff ff ff 80 90 02 a0 ff ff ff ff  ................
>   backtrace:
>     [<000000000ebb87c1>] virtio_fs_probe+0x171/0x7ae [virtiofs]
>     [<00000000f8aca419>] virtio_dev_probe+0x15f/0x210
>     [<000000004d6baf3c>] really_probe+0xea/0x430
>     [<00000000a6ceeac8>] device_driver_attach+0xa8/0xb0
>     [<00000000196f47a7>] __driver_attach+0x98/0x140
>     [<000000000b20601d>] bus_for_each_dev+0x7b/0xc0
>     [<00000000399c7b7f>] bus_add_driver+0x11b/0x1f0
>     [<0000000032b09ba7>] driver_register+0x8f/0xe0
>     [<00000000cdd55998>] 0xffffffffa002c013
>     [<000000000ea196a2>] do_one_initcall+0x64/0x2e0
>     [<0000000008f727ce>] do_init_module+0x5c/0x260
>     [<000000003cdedab6>] __do_sys_finit_module+0xb5/0x120
>     [<00000000ad2f48c6>] do_syscall_64+0x33/0x40
>     [<00000000809526b5>] entry_SYSCALL_64_after_hwframe+0x44/0xae
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Luis Henriques <lhenriques@suse.de>

Reviewed-by: Vivek Goyal <vgoyal@redhat.com>

Thanks
Vivek

> ---
> Changes since v1:
> - Use kfree() to free fs->vqs instead of calling virtio_fs_put()
> 
>  fs/fuse/virtio_fs.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/fs/fuse/virtio_fs.c b/fs/fuse/virtio_fs.c
> index 8868ac31a3c0..989ef4f88636 100644
> --- a/fs/fuse/virtio_fs.c
> +++ b/fs/fuse/virtio_fs.c
> @@ -896,6 +896,7 @@ static int virtio_fs_probe(struct virtio_device *vdev)
>  out_vqs:
>  	vdev->config->reset(vdev);
>  	virtio_fs_cleanup_vqs(vdev, fs);
> +	kfree(fs->vqs);
>  
>  out:
>  	vdev->priv = NULL;
> 

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
