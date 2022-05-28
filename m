Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C975369F9
	for <lists.virtualization@lfdr.de>; Sat, 28 May 2022 03:58:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 13B3F84284;
	Sat, 28 May 2022 01:58:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z9Nt3HH-sqoB; Sat, 28 May 2022 01:58:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id F03178427B;
	Sat, 28 May 2022 01:58:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5434FC007E;
	Sat, 28 May 2022 01:58:36 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 451B7C002D
 for <virtualization@lists.linux-foundation.org>;
 Sat, 28 May 2022 01:58:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3C935427B8
 for <virtualization@lists.linux-foundation.org>;
 Sat, 28 May 2022 01:58:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5hqfmVz_2abG
 for <virtualization@lists.linux-foundation.org>;
 Sat, 28 May 2022 01:58:33 +0000 (UTC)
X-Greylist: delayed 00:07:30 by SQLgrey-1.8.0
Received: from smtp232.sjtu.edu.cn (smtp232.sjtu.edu.cn [202.120.2.232])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CF614427A5
 for <virtualization@lists.linux-foundation.org>;
 Sat, 28 May 2022 01:58:32 +0000 (UTC)
Received: from mta91.sjtu.edu.cn (unknown [10.118.0.91])
 by smtp232.sjtu.edu.cn (Postfix) with ESMTPS id D8A7F1008CBC0;
 Sat, 28 May 2022 09:50:56 +0800 (CST)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mta91.sjtu.edu.cn (Postfix) with ESMTP id 9A25637C83B;
 Sat, 28 May 2022 09:50:56 +0800 (CST)
X-Virus-Scanned: amavisd-new at 
Received: from mta91.sjtu.edu.cn ([127.0.0.1])
 by localhost (mta91.sjtu.edu.cn [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id Ge9t36pe11ah; Sat, 28 May 2022 09:50:56 +0800 (CST)
Received: from mstore105.sjtu.edu.cn (mstore101.sjtu.edu.cn [10.118.0.105])
 by mta91.sjtu.edu.cn (Postfix) with ESMTP id 8388F37C83A;
 Sat, 28 May 2022 09:50:56 +0800 (CST)
Date: Sat, 28 May 2022 09:50:56 +0800 (CST)
From: Guo Zhi <qtxuning1999@sjtu.edu.cn>
To: virtualization@lists.linux-foundation.org
Message-ID: <1151206871.565467.1653702656437.JavaMail.zimbra@sjtu.edu.cn>
Subject: GSoC project: VIRTIO_F_IN_ORDER support for virtio devices
MIME-Version: 1.0
X-Originating-IP: [202.120.40.82]
X-Mailer: Zimbra 8.8.15_GA_4272 (ZimbraWebClient - GC101 (Mac)/8.8.15_GA_3928)
Thread-Index: vQUnFL6WFlzkWnBligZ02dVecSTblQ==
Thread-Topic: GSoC project: VIRTIO_F_IN_ORDER support for virtio devices
Cc: eperezma <eperezma@redhat.com>
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

Hi everyone,
I'm Zhi Guo, a student from GSoC 2022.
My project is VIRTIO_F_IN_ORDER support for virtio devices.

VIRTIO_F_IN_ORDER is a new feature presented in VIRTIO 1.1. As mentioned on the project description page(https://wiki.qemu.org/Google_Summer_of_Code_2022#VIRTIO_F_IN_ORDER_support_for_virtio_devices), VIRTIO_F_IN_ORDER is a feature that devices and drivers can negotiate when the device uses descriptors in the same order in which they were made available by the driver. This feature can help devices and drivers batch buffers and improve performance. Currently the devices and drivers available in Linux and QEMU do not support the VIRTIO_F_IN_ORDER feature. The only implementation is available in DPDK for the virtio-net driver. I will spend this summer to implement VIRTIO_F_IN_ORDER feature in both Linux and QEMU, and in both split and packed virtqueue layouts. Patches will be sent as soon as possible.

Best regards,

Zhi
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
