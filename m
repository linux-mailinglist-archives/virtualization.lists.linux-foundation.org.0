Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D05F6044B9
	for <lists.virtualization@lfdr.de>; Wed, 19 Oct 2022 14:13:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 17DED61183;
	Wed, 19 Oct 2022 12:13:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 17DED61183
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iROx/tYY
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n0xJ-Hf0nWD5; Wed, 19 Oct 2022 12:13:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 9851560B20;
	Wed, 19 Oct 2022 12:13:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9851560B20
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C6D3BC007C;
	Wed, 19 Oct 2022 12:13:45 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4CC35C002D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 Oct 2022 12:13:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3012D40C66
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 Oct 2022 12:13:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3012D40C66
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=iROx/tYY
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f2UueqcgQZim
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 Oct 2022 12:13:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1BA6940140
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1BA6940140
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 Oct 2022 12:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666181621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rt+KjTtKd5GM/lbgv3ThuxZ4mjfxNVrl70y97s4Oa2I=;
 b=iROx/tYYLluPNorEvABvNQNQNkjqGJTGKXMYTAIZZjTM+SVVQ7bDZFZObj/Uz0YObsQqVz
 fk0c8cjDCJ+jiX0CnI4arnoSeQ6z8QixStdwtITRFJymajf5D3BqoxRtsc6QNKT3Ijjno0
 BKXRuDwJ1S5QYDm6PkvAMLUoy+6rAaQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-256-2dXZazLhNv-Rt1YbP0DI0w-1; Wed, 19 Oct 2022 08:13:39 -0400
X-MC-Unique: 2dXZazLhNv-Rt1YbP0DI0w-1
Received: by mail-wr1-f69.google.com with SMTP id
 s4-20020adfbc04000000b0022e03fc10a9so5513219wrg.15
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 Oct 2022 05:13:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rt+KjTtKd5GM/lbgv3ThuxZ4mjfxNVrl70y97s4Oa2I=;
 b=0DxrIk9tiOXnuH9q1CWAHaGF07s80VlKleYzOY2NHwKyOdbMQDpp2pK6v1ufuV8uWQ
 BPmyre+aIO8/bZwSEG1ibd93h3TROqbHpIGunPu5mXyIdWAXWAb5aZtU0qxyKr3mkque
 VsPckvekGdF0fYN7ixTVpR4jhQlgjldYbJDs/3T6Fm0RuecVShbm1UqW81OzdEqXCq26
 h0ssRtCPxIke2nNpwDzQcvr7tBhFfaCwUaEgUhrsTOSL8PmsWn/PWPQkcfEEniLzkOqG
 6+VOGuizTuFrfVKM4AEluZzttj2Np/I86z61+kCVkQv1ctopJANISZRCsN674a7y/hGv
 S1sA==
X-Gm-Message-State: ACrzQf3AUnKtRYB9J5hpYpEh5yKGBhGJFvYk189z5N3g0nE+Y6vGUGZV
 lKJRx7j2eruCArWsFpm8AQmoxiIoZzKlzAJGwm5A5yJ5hKABTa0CAbo95PqgdBvm8+NzkJII2Bl
 hRJq3E9h057WoPRu4fa+W7tAUwNhPbrDkUu2FW0mQpA==
X-Received: by 2002:a05:6000:15c7:b0:22e:7aea:f7b1 with SMTP id
 y7-20020a05600015c700b0022e7aeaf7b1mr4993886wry.213.1666181618814; 
 Wed, 19 Oct 2022 05:13:38 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6JN+v9V/eI4lFO+Gpxy/bvHqkz+lbhiqh+NhJiJzp++eKrJi9AtneI5CkR/vfIsCG6bdbq4w==
X-Received: by 2002:a05:6000:15c7:b0:22e:7aea:f7b1 with SMTP id
 y7-20020a05600015c700b0022e7aeaf7b1mr4993865wry.213.1666181618507; 
 Wed, 19 Oct 2022 05:13:38 -0700 (PDT)
Received: from redhat.com ([2.54.191.184]) by smtp.gmail.com with ESMTPSA id
 o36-20020a05600c512400b003c6edc05159sm14710053wms.1.2022.10.19.05.13.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Oct 2022 05:13:37 -0700 (PDT)
Date: Wed, 19 Oct 2022 08:13:34 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Christian Borntraeger <borntraeger@linux.ibm.com>
Subject: Re: 6.1-rc1 regression: virtio-net cpumask and during reboot
Message-ID: <20221019081320-mutt-send-email-mst@kernel.org>
References: <ac72ff9d-4246-3631-6e31-8c3033a70bf0@linux.ibm.com>
 <20221019074308-mutt-send-email-mst@kernel.org>
 <780306ca-4aba-3cf7-88ca-75e1903f76d0@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <780306ca-4aba-3cf7-88ca-75e1903f76d0@linux.ibm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: linux-s390 <linux-s390@vger.kernel.org>, kvm list <kvm@vger.kernel.org>,
 Yury Norov <yury.norov@gmail.com>, netdev@vger.kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "virtualization@lists.linux-foundation.org"
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

On Wed, Oct 19, 2022 at 02:11:37PM +0200, Christian Borntraeger wrote:
> Am 19.10.22 um 13:50 schrieb Michael S. Tsirkin:
> > On Wed, Oct 19, 2022 at 12:59:58PM +0200, Christian Borntraeger wrote:
> > > Michael,
> > > 
> > > as a heads-up.
> > > I have not looked into any details yet but we do get the following during reboot of a system on s390.
> > > It seems to be new with 6.1-rc1 (over 6.0)
> > > 
> > >    [    8.532461] ------------[ cut here ]------------
> > >    [    8.532497] WARNING: CPU: 8 PID: 377 at include/linux/cpumask.h:110 __netif_set_xps_queue+0x3d8/0xca8
> > >    [    8.532507] Modules linked in: sha1_s390(+) sha_common virtio_net(+) net_failover failover pkey zcrypt rng_core autofs4
> > >    [    8.532528] CPU: 8 PID: 377 Comm: systemd-udevd Not tainted 6.1.0-20221018.rc1.git15.0fd5f2557625.300.fc36.s390x+debug #1
> > >    [    8.532533] Hardware name: IBM 8561 T01 701 (KVM/Linux)
> > >    [    8.532537] Krnl PSW : 0704e00180000000 00000000b05ec33c (__netif_set_xps_queue+0x3dc/0xca8)
> > >    [    8.532546]            R:0 T:1 IO:1 EX:1 Key:0 M:1 W:0 P:0 AS:3 CC:2 PM:0 RI:0 EA:3
> > >    [    8.532552] Krnl GPRS: 00000000e7fb8b3f 0000000080000001 00000000b1870700 00000000b0ca1d3c
> > >    [    8.532557]            0000000000000100 0000000000000300 000000008b362500 00000000b133ba48
> > >    [    8.532561]            000000000000000c 0000038000000100 000000000000000c 0000000000000070
> > >    [    8.532566]            0000000084cd3200 0000000000000000 00000000b05ec0c2 00000380010b77c8
> > >    [    8.532575] Krnl Code: 00000000b05ec32e: c0e500187331      brasl   %r14,00000000b08fa990
> > >                              00000000b05ec334: a7f4ff0c          brc     15,00000000b05ec14c
> > >                             #00000000b05ec338: af000000          mc      0,0
> > >                             >00000000b05ec33c: ec76fed8007c      cgij    %r7,0,6,00000000b05ec0ec
> > >                              00000000b05ec342: e310f0b00004      lg      %r1,176(%r15)
> > >                              00000000b05ec348: ec16ffac007c      cgij    %r1,0,6,00000000b05ec2a0
> > >                              00000000b05ec34e: ec680388007c      cgij    %r6,0,8,00000000b05eca5e
> > >                              00000000b05ec354: e310f0b80004      lg      %r1,184(%r15)
> > >    [    8.532600] Call Trace:
> > >    [    8.532604]  [<00000000b05ec33c>] __netif_set_xps_queue+0x3dc/0xca8
> > >    [    8.532609] ([<00000000b05ec0c2>] __netif_set_xps_queue+0x162/0xca8)
> > >    [    8.532614]  [<000003ff7fbb81ce>] virtnet_set_affinity+0x1de/0x2a0 [virtio_net]
> > >    [    8.532622]  [<000003ff7fbbb674>] virtnet_probe+0x4d4/0xc08 [virtio_net]
> > >    [    8.532630]  [<00000000b04ec4e8>] virtio_dev_probe+0x1e8/0x418
> > >    [    8.532638]  [<00000000b05350ea>] really_probe+0xd2/0x480
> > >    [    8.532644]  [<00000000b0535648>] driver_probe_device+0x40/0xf0
> > >    [    8.532649]  [<00000000b0535fac>] __driver_attach+0x10c/0x208
> > >    [    8.532655]  [<00000000b0532542>] bus_for_each_dev+0x82/0xb8
> > >    [    8.532662]  [<00000000b053422e>] bus_add_driver+0x1d6/0x260
> > >    [    8.532667]  [<00000000b0536a70>] driver_register+0xa8/0x170
> > >    [    8.532672]  [<000003ff7fbc8088>] virtio_net_driver_init+0x88/0x1000 [virtio_net]
> > >    [    8.532680]  [<00000000afb50ab0>] do_one_initcall+0x78/0x388
> > >    [    8.532685]  [<00000000afc7b5b8>] do_init_module+0x60/0x248
> > >    [    8.532692]  [<00000000afc7ce96>] __do_sys_init_module+0xbe/0xd8
> > >    [    8.532698]  [<00000000b09123b2>] __do_syscall+0x1da/0x208
> > >    [    8.532704]  [<00000000b0925b12>] system_call+0x82/0xb0
> > >    [    8.532710] 3 locks held by systemd-udevd/377:
> > >    [    8.532715]  #0: 0000000089af5188 (&dev->mutex){....}-{3:3}, at: __driver_attach+0xfe/0x208
> > >    [    8.532728]  #1: 00000000b14668f0 (cpu_hotplug_lock){++++}-{0:0}, at: virtnet_probe+0x4ca/0xc08 [virtio_net]
> > >    [    8.532744]  #2: 00000000b1509d40 (xps_map_mutex){+.+.}-{3:3}, at: __netif_set_xps_queue+0x88/0xca8
> > >    [    8.532757] Last Breaking-Event-Address:
> > >    [    8.532760]  [<00000000b05ec0e0>] __netif_set_xps_queue+0x180/0xca8
> > 
> > 
> > Does this fix it for you?
> > 
> > https://lore.kernel.org/r/20221017030947.1295426-1-yury.norov%40gmail.com
> 
> Yes, it does. Thanks a lot.
> 
> Tested-by: Christian Borntraeger <borntraeger@linux.ibm.com>

You will want to reply to that one P).

-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
