Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C57652181
	for <lists.virtualization@lfdr.de>; Tue, 20 Dec 2022 14:27:03 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B45180BF0;
	Tue, 20 Dec 2022 13:27:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B45180BF0
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Xtd7tbAC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jb80MH-C5wtj; Tue, 20 Dec 2022 13:27:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id D65C781B7B;
	Tue, 20 Dec 2022 13:27:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D65C781B7B
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 23193C0070;
	Tue, 20 Dec 2022 13:27:00 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8A2E1C002D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 20 Dec 2022 13:26:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4E4744037A
 for <virtualization@lists.linux-foundation.org>;
 Tue, 20 Dec 2022 13:26:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E4744037A
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=Xtd7tbAC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CBu2X8ZGR9h9
 for <virtualization@lists.linux-foundation.org>;
 Tue, 20 Dec 2022 13:26:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AEB7840338
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AEB7840338
 for <virtualization@lists.linux-foundation.org>;
 Tue, 20 Dec 2022 13:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671542815;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uZGdrKBewMl+PwYkvKTX/bS9wY/qPohgjpJbhZ36Hw8=;
 b=Xtd7tbACuTeZz4rMEKee1MYvjh/Up0T+ltqXqOC8GpZd1PA+Fe6nB7v5GPWzasXwvivmDA
 ZavlN1o4MWypVG/7LXzCTJHjTMkavzoh+S04vmOCUX7vemmxb7aiVkbbCnowNQMSmBYg/o
 psrUlMm/Z3J2UwdF1UCy+342sA8FzOg=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-582-TAwKsodWMBOeayCmjVPN_g-1; Tue, 20 Dec 2022 08:26:54 -0500
X-MC-Unique: TAwKsodWMBOeayCmjVPN_g-1
Received: by mail-qv1-f71.google.com with SMTP id
 u15-20020a0cec8f000000b004c704e015f7so7104934qvo.1
 for <virtualization@lists.linux-foundation.org>;
 Tue, 20 Dec 2022 05:26:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uZGdrKBewMl+PwYkvKTX/bS9wY/qPohgjpJbhZ36Hw8=;
 b=PkXTbqcrzGUbFj5y7bBu95jeg0i5utsmgk+/mA1Awl5hoeXPCUeBRchSAF5tBugj/x
 vnOMvV7ZzpvnTFeWhjqJShsx67XTCYALtMxzksn602yovOFMSYTTy81ZXQ5AvBpl9M53
 FoBlbTGvmd1y0t7MvhSRAWxtYQOi1HHOczog1bvCCJr9go3EvVAsfky6S5ILTnVrc7/x
 1ZZCYL6eZfZw/3Wulr9285eZuX5AHibPqqEHagr8gc++WUZ3UWVUwchuayW7PmG3mArI
 +R5X5+AQkz9OU7wznxByn7SsQmBtVp82SXCKjlVbVTAVA0y5xxls0YN9MTc5SmMBRbdc
 iv/w==
X-Gm-Message-State: ANoB5pkCfGuUKOtKarFeZVc3e01Z1/EZ92Spneup+hNyWWXyUlIGxZq7
 a6GEj0wTHnB2rU1u9TxbLJolynGJkBpnE94cx5xxoMYmvG236Ec6yCOTC66rv5cqjyRrEO8rDBj
 AL3QJ2R7eGlJM6qs8D7295F+fuc4ng8zqq2XpHWv4ag==
X-Received: by 2002:ac8:5a8c:0:b0:3a5:460f:9650 with SMTP id
 c12-20020ac85a8c000000b003a5460f9650mr82880195qtc.46.1671542813422; 
 Tue, 20 Dec 2022 05:26:53 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7SVL3vqEyD4G/TLdIVPAjHiElg9RdMaMsyyD5zvvpaibcKBXjns6zWYuqDHHVU8Y8fhmuBrg==
X-Received: by 2002:ac8:5a8c:0:b0:3a5:460f:9650 with SMTP id
 c12-20020ac85a8c000000b003a5460f9650mr82880155qtc.46.1671542813044; 
 Tue, 20 Dec 2022 05:26:53 -0800 (PST)
Received: from redhat.com ([37.19.199.118]) by smtp.gmail.com with ESMTPSA id
 f7-20020ac84707000000b00397b1c60780sm7541712qtp.61.2022.12.20.05.26.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Dec 2022 05:26:52 -0800 (PST)
Date: Tue, 20 Dec 2022 08:26:44 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: next: kernel BUG at drivers/virtio/virtio.c:122!
Message-ID: <20221220082606-mutt-send-email-mst@kernel.org>
References: <CA+G9fYvz1eNS5fw1Wg5f4HqwdWPNg3EQyrGZVEOJ=OQzYzZ_YQ@mail.gmail.com>
 <1671532079.1159124-1-xuanzhuo@linux.alibaba.com>
 <20221220054938-mutt-send-email-mst@kernel.org>
 <CGME20221220131747eucas1p1411947fee7d65825ccedad8f8a12a4df@eucas1p1.samsung.com>
 <206f30df-4833-3909-2d01-472fcfa2baa6@samsung.com>
MIME-Version: 1.0
In-Reply-To: <206f30df-4833-3909-2d01-472fcfa2baa6@samsung.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Anders Roxell <anders.roxell@linaro.org>, regressions@lists.linux.dev,
 Arnd Bergmann <arnd@arndb.de>, dmitry.fomichev@wdc.com,
 Naresh Kamboju <naresh.kamboju@linaro.org>,
 open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
 virtualization@lists.linux-foundation.org,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 Angus Chen <angus.chen@jaguarmicro.com>
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

On Tue, Dec 20, 2022 at 02:17:45PM +0100, Marek Szyprowski wrote:
> On 20.12.2022 11:54, Michael S. Tsirkin wrote:
> > On Tue, Dec 20, 2022 at 06:27:59PM +0800, Xuan Zhuo wrote:
> >> On Tue, 20 Dec 2022 14:51:54 +0530, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
> >>> The qemu-x86_64 and qemu-arm64 boot failed with Linux next-20221220 tag.
> >>> It is always reproducible with gcc-11/ gcc-12 and clang tool chains.
> >>>
> >>> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> >>>
> >>> <6>[    0.000000] Booting Linux on physical CPU 0x0000000000 [0x000f0510]
> >>> <5>[    0.000000] Linux version 6.1.0-next-20221220 (tuxmake@tuxmake)
> >>> (Debian clang version 16.0.0
> >>> (++20221218072110+9c1b82599dac-1~exp1~20221218072217.501), Debian LLD
> >>> 16.0.0) #1 SMP PREEMPT @1671498176
> >>> <5>[    0.000000] random: crng init done
> >>> <6>[    0.000000] Machine model: linux,dummy-virt
> >>> ....
> >>> <6>[    3.571098] loop: module loaded
> >>> <6>[    3.573410] virtio_blk virtio0: 1/0/0 default/read/poll queues
> >>> <5>[    3.578816] virtio_blk virtio0: [vda] 2816420 512-byte logical
> >>> blocks (1.44 GB/1.34 GiB)
> >>> <4>[    3.581234] ------------[ cut here ]------------
> >>> <2>[    3.581595] kernel BUG at drivers/virtio/virtio.c:122!
> >>> <0>[    3.582906] Internal error: Oops - BUG: 00000000f2000800 [#1] PREEMPT SMP
> >>> <4>[    3.583672] Modules linked in:
> >>> <4>[    3.584905] CPU: 0 PID: 1 Comm: swapper/0 Not tainted
> >>> 6.1.0-next-20221220 #1
> >>> <4>[    3.585801] Hardware name: linux,dummy-virt (DT)
> >>> <4>[    3.586591] pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT
> >>> -SSBS BTYPE=--)
> >>> <4>[    3.587349] pc : virtio_check_driver_offered_feature+0x60/0x6c
> >>> <4>[    3.588613] lr : virtblk_probe+0x7cc/0x8f0
> >>> <4>[    3.588915] sp : ffff80000802b840
> >>> <4>[    3.589314] x29: ffff80000802b850 x28: 0000000000000000 x27:
> >>> 0000000000000001
> >>> <4>[    3.590509] x26: 0000000000000001 x25: 0000000000000200 x24:
> >>> ffff0000c1699b00
> >>> <4>[    3.590832] x23: 00000000000000fe x22: ffff0000c0313c30 x21:
> >>> ffff0000c0313c00
> >>> <4>[    3.591568] x20: ffff0000c02f4080 x19: 0000000000000000 x18:
> >>> ffffffffffffffff
> >>> <4>[    3.592056] x17: 00000000ffffffea x16: 00000000fffffffe x15:
> >>> 0000000000000004
> >>> <4>[    3.592632] x14: 0000000000000fff x13: ffff800008028000 x12:
> >>> ffff80000802c000
> >>> <4>[    3.593157] x11: 000000000000000f x10: 000000000000000f x9 :
> >>> ffffae66eee314d8
> >>> <4>[    3.594048] x8 : 0000000000000000 x7 : 3631383837352e33 x6 :
> >>> 202020205b3e353c
> >>> <4>[    3.594429] x5 : 0000000000000001 x4 : 0000000000000000 x3 :
> >>> ffff80000802b780
> >>> <4>[    3.594956] x2 : ffff80000802b6f8 x1 : 0000000000000011 x0 :
> >>> ffff0000c02f4080
> >>> <4>[    3.595811] Call trace:
> >>> <4>[    3.596120]  virtio_check_driver_offered_feature+0x60/0x6c
> >>> <4>[    3.596632]  virtio_dev_probe+0x274/0x320
> >>> <4>[    3.597064]  really_probe+0x178/0x418
> >>> <4>[    3.597547]  __driver_probe_device+0x120/0x188
> >>> <4>[    3.597820]  driver_probe_device+0x48/0x22c
> >>> <4>[    3.598189]  __driver_attach+0xf8/0x250
> >>> <4>[    3.598656]  bus_for_each_dev+0x8c/0xd8
> >>> <4>[    3.599151]  driver_attach+0x30/0x3c
> >>> <4>[    3.599321]  bus_add_driver+0x11c/0x22c
> >>> <4>[    3.599684]  driver_register+0x84/0x120
> >>> <4>[    3.600175]  register_virtio_driver+0x38/0x48
> >>> <4>[    3.600575]  virtio_blk_init+0x6c/0xb4
> >>> <4>[    3.600759]  do_one_initcall+0xe0/0x2f8
> >>> <4>[    3.601197]  do_initcall_level+0xa8/0x150
> >>> <4>[    3.601703]  do_initcalls+0x60/0xa0
> >>> <4>[    3.601892]  do_basic_setup+0x28/0x34
> >>> <4>[    3.602229]  kernel_init_freeable+0x100/0x178
> >>> <4>[    3.602706]  kernel_init+0x2c/0x1b4
> >>> <4>[    3.603162]  ret_from_fork+0x10/0x20
> >>> <0>[    3.604398] Code: 540000a0 91001129 f1000508 54ffff61 (d4210000)
> >>> <4>[    3.606108] ---[ end trace 0000000000000000 ]---
> >>> <6>[    3.606714] note: swapper/0[1] exited with preempt_count 1
> >>> <0>[    3.608155] Kernel panic - not syncing: Attempted to kill init!
> >>> exitcode=0x0000000b
> >>> <2>[    3.609173] SMP: stopping secondary CPUs
> >>> <0>[    3.610506] Kernel Offset: 0x2e66e4800000 from 0xffff800008000000
> >>> <0>[    3.610970] PHYS_OFFSET: 0x40000000
> >>> <0>[    3.611428] CPU features: 0x00000,003a612f,cd22773f
> >>> <0>[    3.612277] Memory Limit: none
> >>> <0>[    3.613192] ---[ end Kernel panic - not syncing: Attempted to
> >>> kill init! exitcode=0x0000000b ]---
> >>>
> >>> Ref Links,
> >>> https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20221220/testrun/13764099/suite/log-parser-test/test/check-kernel-bug/details/
> >>> https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20221220/testrun/13766814/suite/boot/test/clang-nightly-lkftconfig/details/
> >>> https://storage.tuxsuite.com/public/linaro/lkft/builds/2J9l3qxSBmPWVa1S2uWn0Xuwl1J/config
> >>>
> >>
> >> I think there is a bug, VIRTIO_BLK_F_ZONED depends the CONFIG_BLK_DEV_ZONE, but
> >> checking its code in virtblk_probe does not depend on this config.
> >>
> >> This option in your config file is indeed not opened.
> >>
> >>
> >> static int virtblk_probe(struct virtio_device *vdev){
> >> .....
> >> 	virtblk_update_capacity(vblk, false);
> >> 	virtio_device_ready(vdev);
> >>
> >> 	if (virtio_has_feature(vdev, VIRTIO_BLK_F_ZONED)) {
> >> 		err = virtblk_probe_zoned_device(vdev, vblk, q);
> >> 		if (err)
> >> 			goto out_cleanup_disk;
> >> 	}
> >>
> >> 	dev_info(&vdev->dev, "blk config size: %zu\n",
> >> 		sizeof(struct virtio_blk_config));
> >>
> >> ....
> >>
> >> static unsigned int features[] = {
> >> 	VIRTIO_BLK_F_SEG_MAX, VIRTIO_BLK_F_SIZE_MAX, VIRTIO_BLK_F_GEOMETRY,
> >> 	VIRTIO_BLK_F_RO, VIRTIO_BLK_F_BLK_SIZE,
> >> 	VIRTIO_BLK_F_FLUSH, VIRTIO_BLK_F_TOPOLOGY, VIRTIO_BLK_F_CONFIG_WCE,
> >> 	VIRTIO_BLK_F_MQ, VIRTIO_BLK_F_DISCARD, VIRTIO_BLK_F_WRITE_ZEROES,
> >> 	VIRTIO_BLK_F_SECURE_ERASE, VIRTIO_BLK_F_LIFETIME,
> >> #ifdef CONFIG_BLK_DEV_ZONED
> >> 	VIRTIO_BLK_F_ZONED,
> >> #endif /* CONFIG_BLK_DEV_ZONED */
> >> }
> >>
> >>
> >> Thanks.
> > Oh you are right, I wanted to test it so of course I enabled it.
> >
> > Testing this fixup now:
> >
> > commit f9503d0fd839b59e0f48b00c20635437c41420ed
> > Author: Michael S. Tsirkin <mst@redhat.com>
> > Date:   Tue Dec 20 05:53:41 2022 -0500
> >
> >      fixup! virtio-blk: add support for zoned block devices
> 
> I also confirm that this patch fixes the issue with broken virtio block 
> device observed on QEMU arm/arm64 'virt' machines and linux 
> next-20221220. Thanks for the fix!
> 
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

Merged the fix already so I'm not sure I can add this tag.
If I rebase before pull request I will, thanks!

> > diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
> > index ff49052e26f7..d8cdaeb51d1c 100644
> > --- a/drivers/block/virtio_blk.c
> > +++ b/drivers/block/virtio_blk.c
> > @@ -775,6 +775,10 @@ static int virtblk_probe_zoned_device(struct virtio_device *vdev,
> >   	return ret;
> >   }
> >   
> > +static inline bool virtblk_has_zoned_feature(struct virtio_device *vdev)
> > +{
> > +	return virtio_has_feature(vdev, VIRTIO_BLK_F_ZONED);
> > +}
> >   #else
> >   
> >   /*
> > @@ -790,6 +794,11 @@ static inline int virtblk_probe_zoned_device(struct virtio_device *vdev,
> >   {
> >   	return -EOPNOTSUPP;
> >   }
> > +
> > +static inline bool virtblk_has_zoned_feature(struct virtio_device *vdev)
> > +{
> > +	return false;
> > +}
> >   #endif /* CONFIG_BLK_DEV_ZONED */
> >   
> >   /* return id (s/n) string for *disk to *id_str
> > @@ -1576,11 +1585,11 @@ static int virtblk_probe(struct virtio_device *vdev)
> >   		else
> >   			q->limits.discard_granularity = blk_size;
> >   	}
> >   
> >   	virtblk_update_capacity(vblk, false);
> >   	virtio_device_ready(vdev);
> >   
> > -	if (virtio_has_feature(vdev, VIRTIO_BLK_F_ZONED)) {
> > +	if (virtblk_has_zoned_feature(vdev)) {
> >   		err = virtblk_probe_zoned_device(vdev, vblk, q);
> >   		if (err)
> >   			goto out_cleanup_disk;
> 
> Best regards
> -- 
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
