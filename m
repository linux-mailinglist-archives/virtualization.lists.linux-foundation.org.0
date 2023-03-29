Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id E34FC6CD8C6
	for <lists.virtualization@lfdr.de>; Wed, 29 Mar 2023 13:52:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 06EEA41CFC;
	Wed, 29 Mar 2023 11:52:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 06EEA41CFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 36kWzo7NxpGH; Wed, 29 Mar 2023 11:52:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id C4BCF41CF9;
	Wed, 29 Mar 2023 11:52:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C4BCF41CF9
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0461AC008C;
	Wed, 29 Mar 2023 11:52:40 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 899C1C002F
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Mar 2023 11:52:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5833041CF3
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Mar 2023 11:52:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5833041CF3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gIK-3tS9Znyc
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Mar 2023 11:52:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0847341CE3
Received: from out30-113.freemail.mail.aliyun.com
 (out30-113.freemail.mail.aliyun.com [115.124.30.113])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0847341CE3
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Mar 2023 11:52:36 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R261e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046059;
 MF=xuanzhuo@linux.alibaba.com; NM=1; PH=DS; RN=14; SR=0;
 TI=SMTPD_---0Vewqdy9_1680090750; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0Vewqdy9_1680090750) by smtp.aliyun-inc.com;
 Wed, 29 Mar 2023 19:52:31 +0800
Message-ID: <1680090663.603155-2-xuanzhuo@linux.alibaba.com>
Subject: Re: [RFC PATCH 0/4] eBPF RSS through QMP support.
Date: Wed, 29 Mar 2023 19:51:03 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: Andrew Melnychenko <andrew@daynix.com>
References: <20230329104546.108016-1-andrew@daynix.com>
In-Reply-To: <20230329104546.108016-1-andrew@daynix.com>
Cc: mst@redhat.com, yoshfuji@linux-ipv6.org, netdev@vger.kernel.org,
 dsahern@kernel.org, linux-kernel@vger.kernel.org, yuri.benditovich@daynix.com,
 edumazet@google.com, yan@daynix.com, kuba@kernel.org, pabeni@redhat.com,
 virtualization@lists.linux-foundation.org, davem@davemloft.net
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

Is this a patch-set of QEMU? If yes, why are the email lists all kernel mail
list without QEMU mail list?

Thanks.

On Wed, 29 Mar 2023 13:45:41 +0300, Andrew Melnychenko <andrew@daynix.com> wrote:
> This series of patches provides the ability to retrieve eBPF program
> through qmp, so management application may load bpf blob with proper capabilities.
> Now, virtio-net devices can accept eBPF programs and maps through properties
> as external file descriptors. Access to the eBPF map is direct through mmap()
> call, so it should not require additional capabilities to bpf* calls.
> eBPF file descriptors can be passed to QEMU from parent process or by unix
> socket with sendfd() qmp command.
>
> Overall, the basic scenario of using the helper looks like this:
>  * Libvirt checks for ebpf_fds property.
>  * Libvirt requests eBPF blob through QMP.
>  * Libvirt loads blob for virtio-net.
>  * Libvirt launches the QEMU with eBPF fds passed.
>
> Andrew Melnychenko (4):
>   ebpf: Added eBPF initialization by fds and map update.
>   virtio-net: Added property to load eBPF RSS with fds.
>   ebpf: Added declaration/initialization routines.
>   qmp: Added new command to retrieve eBPF blob.
>
>  ebpf/ebpf.c                    |  48 +++++++++++++
>  ebpf/ebpf.h                    |  25 +++++++
>  ebpf/ebpf_rss-stub.c           |   6 ++
>  ebpf/ebpf_rss.c                | 124 +++++++++++++++++++++++++++------
>  ebpf/ebpf_rss.h                |  10 +++
>  ebpf/meson.build               |   1 +
>  hw/net/virtio-net.c            |  77 ++++++++++++++++++--
>  include/hw/virtio/virtio-net.h |   1 +
>  monitor/qmp-cmds.c             |  17 +++++
>  qapi/misc.json                 |  25 +++++++
>  10 files changed, 307 insertions(+), 27 deletions(-)
>  create mode 100644 ebpf/ebpf.c
>  create mode 100644 ebpf/ebpf.h
>
> --
> 2.39.1
>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
