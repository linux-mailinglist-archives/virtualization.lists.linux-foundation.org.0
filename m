Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 92034438523
	for <lists.virtualization@lfdr.de>; Sat, 23 Oct 2021 22:03:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 00ECA819F3;
	Sat, 23 Oct 2021 20:03:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SGZD08ph4gd0; Sat, 23 Oct 2021 20:03:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 6A995819D5;
	Sat, 23 Oct 2021 20:03:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E7DE6C000E;
	Sat, 23 Oct 2021 20:03:23 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6759EC000E
 for <virtualization@lists.linux-foundation.org>;
 Sat, 23 Oct 2021 20:03:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 557A440365
 for <virtualization@lists.linux-foundation.org>;
 Sat, 23 Oct 2021 20:03:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uLbhBQfwmE6x
 for <virtualization@lists.linux-foundation.org>;
 Sat, 23 Oct 2021 20:03:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 229B340360
 for <virtualization@lists.linux-foundation.org>;
 Sat, 23 Oct 2021 20:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635019399;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=P44nF1dbZnk5yhy599UguGwg/FZrXwmTIohqHszP8rc=;
 b=cUjrN7DcBr43khNabHE8Yg3ZogbeW/hUyqbZ0caLOqSbYLIZ4zdcN9vHWNwHITnRWCyCJh
 E2BofRAdRwxapuFqlnfmfkwmgvZhuYcTWr6FVbcKnEyvqnNH8HDHPj0Ne189zQY8HXMhUi
 PKF3m3QwQPOXKrhdOh/cno+CNNRJeT0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-527-Uvh_4eA1MC6Bgj-EUqt_Wg-1; Sat, 23 Oct 2021 16:03:14 -0400
X-MC-Unique: Uvh_4eA1MC6Bgj-EUqt_Wg-1
Received: by mail-wr1-f69.google.com with SMTP id
 x1-20020adfffc1000000b001679fc9c018so1567064wrs.18
 for <virtualization@lists.linux-foundation.org>;
 Sat, 23 Oct 2021 13:03:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=P44nF1dbZnk5yhy599UguGwg/FZrXwmTIohqHszP8rc=;
 b=q6NI7GGfNAe/QhnzXLlJaMwneeE7evRxctm8lRQbNkMoiJydaAUTcZsn3OdHRq2w47
 yTwT5+jeq377+xvXfhAcGzvE2KLjsURD6DN9LKMzq5YJtsTupYs8vlbAYTTVSJgtigbB
 TnBcPbCFVCxlLUWCKo5+WObDqWXqB1CJmlIQO7GqNLEN+yMPhm2BkOWW0leAN9nMm7jr
 OHNV+1nHk1hQFdxn09sfA6cU2zYZ/dGNXFLdTVrUmAX3CJnC7OIzvv7JtBj/aSFpPmhX
 VgA28PedWlm+MiFvZicOgrFw9w3CKVORuStVvtaZ2wLSnd5wvO9wSuQr2hgQPiTBkslf
 ZpXQ==
X-Gm-Message-State: AOAM5324HW8k+7I9+t+Kn9M1jX/pgOAcI8gHLjhkYVItKggIg7g02STe
 7XmqqjGORyN032F/PADFqXizuafuch79B0Yz6UjoxCAr4j1IK0gvc80IzlRZ1y24kdVjRVAlnzw
 VK49rV3k0IbXcf9GRo8dtDOJenLkIaFxdQomMmEJv6g==
X-Received: by 2002:a5d:6c66:: with SMTP id r6mr10531990wrz.293.1635019392866; 
 Sat, 23 Oct 2021 13:03:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzeBU8GyK4mP1iM0XBp5njnxdY6G5c4mMJdfp4ZtjdtC6ls9Y/yQbg4lSVgGSQQVWaYCL9Oqg==
X-Received: by 2002:a5d:6c66:: with SMTP id r6mr10531958wrz.293.1635019392591; 
 Sat, 23 Oct 2021 13:03:12 -0700 (PDT)
Received: from redhat.com ([2.55.9.147])
 by smtp.gmail.com with ESMTPSA id x8sm8206892wrr.53.2021.10.23.13.03.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Oct 2021 13:03:11 -0700 (PDT)
Date: Sat, 23 Oct 2021 16:03:08 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Subject: Re: [PATCH linux-next v4 0/8] vdpa: enable user to set mac, mtu
Message-ID: <20211023155850-mutt-send-email-mst@kernel.org>
References: <20211021163509.6978-1-parav@nvidia.com>
 <20211022064007-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481D9037F79F3118AACDB3FDC809@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481D9037F79F3118AACDB3FDC809@PH0PR12MB5481.namprd12.prod.outlook.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Eli Cohen <elic@nvidia.com>, "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>
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

On Fri, Oct 22, 2021 at 03:07:32PM +0000, Parav Pandit wrote:
> Hi Michael,
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Friday, October 22, 2021 4:11 PM
> > 
> > On Thu, Oct 21, 2021 at 07:35:01PM +0300, Parav Pandit wrote:
> > > Currently user cannot view the vdpa device config space. Also user
> > > cannot set the mac address and mtu of the vdpa device.
> > > This patchset enables users to set the mac address and mtu of the vdpa
> > > device once the device is created.
> > > If a vendor driver supports such configuration user can set it
> > > otherwise user gets unsupported error.
> > >
> > > vdpa mac address and mtu are device configuration layout fields.
> > > To keep interface generic enough for multiple types of vdpa devices,
> > > mac address and mtu setting is implemented as configuration layout fields.
> > 
> > 
> > So I got lots of "sha1 is lacking or useless" warnings with this.
> > I did my best to merge but please check out the result in linux-next.
> >
> I was able to test vdpasim_net on one system with rebase code with these patches.
> On 2nd system I started verifying mlx5 vdpa.
> System has mlx5 vdpa and virtio blk devices.
> After rebase, I hit the below crash at system boot time on virtio blk device.
> 
> I have some internal issues in accessing crashed system, unable to proceed to verify it.
> However, the crash doesn't seems to occur due to this patches, as its happening on virtio blk dev (non vdpa based blk dev).
> 
> [    1.238098] virtio_blk virtio0: [vda] 73400320 512-byte logical blocks (37.6 GB/35.0 GiB)
>  [    1.240177] BUG: unable to handle page fault for address: 00000000fffedbeb
>  [    1.240973] #PF: supervisor write access in kernel mode
>  [    1.241590] #PF: error_code(0x0002) - not-present page
>  [    1.242202] PGD 0 P4D 0 
>  [    1.242559] Oops: 0002 [#1] SMP NOPTI
>  [    1.243023] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.15.0-rc6-vdpa-mac+ #7
>  [    1.243559] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.13.0-0-gf21b5a4aeb02-prebuilt.qemu.org 04/01/2014
>  [    1.243559] RIP: 0010:virtqueue_add_sgs+0x9e2/0xe50
>  [    1.243559] Code: 0e 41 89 4d 40 49 8b 4d 78 48 89 1c 11 48 8b 5c 24 08 49 8b 4d 78 48 89 5c 11 08 49 8b 95 b0 00 00 00 48 85 d2 74 06 8b 1c 24 <89> 1c 82 41 8b 45 50 0f b7 5c 24 10 49 8b 55 60 83 e8 01 66 41 23
>  [    1.243559] RSP: 0000:ffff88810092b5a8 EFLAGS: 00010006
>  [    1.243559] RAX: 0000000000000000 RBX: 0000000000001001 RCX: ffff888104f91000
>  [    1.243559] RDX: 00000000fffedbeb RSI: 0000000000000000 RDI: 0000000000000004
>  [    1.243559] RBP: 0000000000000003 R08: 0000000000000004 R09: ffffffff8289920c
>  [    1.243559] R10: 0000000000000003 R11: 0000000000000001 R12: 0000000000000030
>  [    1.243559] R13: ffff88810547ef00 R14: 0000000000000001 R15: 0000000000000000
>  [    1.243559] FS:  0000000000000000(0000) GS:ffff88846fa00000(0000) knlGS:0000000000000000
>  [    1.243559] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>  [    1.243559] CR2: 00000000fffedbeb CR3: 0000000002612001 CR4: 0000000000370eb0
>  [    1.243559] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
>  [    1.243559] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
>  [    1.243559] Call Trace:
>  [    1.243559]  virtio_queue_rq+0x1e4/0x5f0
>  [    1.243559]  __blk_mq_try_issue_directly+0x138/0x1e0
>  [    1.243559]  blk_mq_try_issue_directly+0x47/0xa0
>  [    1.243559]  blk_mq_submit_bio+0x5af/0x890
>  [    1.243559]  __submit_bio+0x2af/0x2e0
>  [    1.243559]  ? create_page_buffers+0x55/0x70
>  [    1.243559]  submit_bio_noacct+0x26c/0x2d0
>  [    1.243559]  submit_bh_wbc.isra.0+0x122/0x150
>  [    1.243559]  block_read_full_page+0x2f7/0x3f0
>  [    1.243559]  ? blkdev_direct_IO+0x4b0/0x4b0
>  [    1.243559]  ? lru_cache_add+0xcf/0x150
>  [    1.243559]  do_read_cache_page+0x4f2/0x6a0
>  [    1.243559]  ? lockdep_hardirqs_on_prepare+0xe4/0x190
>  [    1.243559]  read_part_sector+0x39/0xd0
>  [    1.243559]  read_lba+0xca/0x140
>  [    1.243559]  efi_partition+0xe6/0x770
>  [    1.243559]  ? snprintf+0x49/0x60
>  [    1.243559]  ? is_gpt_valid.part.0+0x420/0x420
>  [    1.243559]  bdev_disk_changed+0x21c/0x4a0
>  [    1.243559]  blkdev_get_whole+0x76/0x90
>  [    1.243559]  blkdev_get_by_dev+0xd4/0x2c0
>  [    1.243559]  device_add_disk+0x351/0x390
>  [    1.243559]  virtblk_probe+0x804/0xa40
>  [    1.243559]  ? ncpus_cmp_func+0x10/0x10
>  [    1.243559]  virtio_dev_probe+0x155/0x250
>  [    1.243559]  really_probe+0xdb/0x3b0
>  [    1.243559]  __driver_probe_device+0x8c/0x180
>  [    1.243559]  driver_probe_device+0x1e/0xa0
>  [    1.243559]  __driver_attach+0xaa/0x160
>  [    1.243559]  ? __device_attach_driver+0x110/0x110
>  [    1.243559]  ? __device_attach_driver+0x110/0x110
>  [    1.243559]  bus_for_each_dev+0x7a/0xc0
>  [    1.243559]  bus_add_driver+0x198/0x200
>  [    1.243559]  driver_register+0x6c/0xc0
>  [    1.243559]  ? loop_init+0x149/0x149
>  [    1.243559]  init+0x52/0x7d
>  [    1.243559]  do_one_initcall+0x63/0x300
>  [    1.243559]  ? rcu_read_lock_sched_held+0x5d/0x90
>  [    1.243559]  kernel_init_freeable+0x26a/0x2b2
>  [    1.243559]  ? rest_init+0x2e0/0x2e0
>  [    1.243559]  kernel_init+0x17/0x130
>  [    1.243559]  ? rest_init+0x2e0/0x2e0
>  [    1.243559]  ret_from_fork+0x1f/0x30
>  [    1.243559] Modules linked in:
>  [    1.243559] CR2: 00000000fffedbeb

Thanks for the report. Parav, could you help bisect this please?
I also pushed out a new head with some patches dropped.
Could you test that maybe?

Thanks!

-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
