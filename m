Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3395ED491
	for <lists.virtualization@lfdr.de>; Wed, 28 Sep 2022 08:17:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A83681C18;
	Wed, 28 Sep 2022 06:17:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A83681C18
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SmwvDzgI
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D3ko27PlIelV; Wed, 28 Sep 2022 06:17:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 1172181C20;
	Wed, 28 Sep 2022 06:17:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1172181C20
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2F606C0078;
	Wed, 28 Sep 2022 06:17:29 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DE22CC002D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 28 Sep 2022 06:17:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AF79F81C20
 for <virtualization@lists.linux-foundation.org>;
 Wed, 28 Sep 2022 06:17:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF79F81C20
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S2jIlNNC8B-6
 for <virtualization@lists.linux-foundation.org>;
 Wed, 28 Sep 2022 06:17:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 86AD881C18
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 86AD881C18
 for <virtualization@lists.linux-foundation.org>;
 Wed, 28 Sep 2022 06:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664345845;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xmlSZkZxROIcPznagSrxrKVXTo8KbG8k1WiRu1ChMH8=;
 b=SmwvDzgIbi4MR/Pq9SO64U7LEWywe/01j7tXhdqyjGQ92uass2jOxDu+5jlntCSddwMJQC
 K5Wz+/42SXy7gINi8WA76LPMRM2ArSdPc/o+Qq0FnJ6aypq+gAwqAxnXvPRMqOBSAjQ4h6
 NnX2wfMVh7P9pIijuI7+QTz2Vz67OWM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-457-GvslDGmOOuO8jLmiubdULQ-1; Wed, 28 Sep 2022 02:17:20 -0400
X-MC-Unique: GvslDGmOOuO8jLmiubdULQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C87F03C01D9E;
 Wed, 28 Sep 2022 06:17:19 +0000 (UTC)
Received: from T590 (ovpn-8-16.pek2.redhat.com [10.72.8.16])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 81DCD2027061;
 Wed, 28 Sep 2022 06:17:11 +0000 (UTC)
Date: Wed, 28 Sep 2022 14:17:06 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Angus Chen <angus.chen@jaguarmicro.com>
Subject: Re: [PATCH v1] virtio_blk: should not use IRQD_AFFINITY_MANAGED in
 init_rq
Message-ID: <YzPm4hCx4xBuR3o9@T590>
References: <20220924034854.323-1-angus.chen@jaguarmicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220924034854.323-1-angus.chen@jaguarmicro.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Cc: axboe@kernel.dk, mst@redhat.com, linux-kernel@vger.kernel.org,
 Liming Wu <liming.wu@jaguarmicro.com>,
 virtualization@lists.linux-foundation.org, linux-block@vger.kernel.org,
 pbonzini@redhat.com, Thomas Gleixner <tglx@linutronix.de>
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

On Sat, Sep 24, 2022 at 11:48:54AM +0800, Angus Chen wrote:
> The background is that we use dpu in cloud computing,the arch is x86,80
> cores.We will have a lots of virtio devices,like 512 or more.
> When we probe about 200 virtio_blk devices,it will fail and
> the stack is print as follows:
> 
> [25338.485128] virtio-pci 0000:b3:00.0: virtio_pci: leaving for legacy driver
> [25338.496174] genirq: Flags mismatch irq 0. 00000080 (virtio418) vs. 00015a00 (timer)
> [25338.503822] CPU: 20 PID: 5431 Comm: kworker/20:0 Kdump: loaded Tainted: G           OE    --------- -  - 4.18.0-305.30.1.el8.x86_64
> [25338.516403] Hardware name: Inspur NF5280M5/YZMB-00882-10E, BIOS 4.1.21 08/25/2021
> [25338.523881] Workqueue: events work_for_cpu_fn
> [25338.528235] Call Trace:
> [25338.530687]  dump_stack+0x5c/0x80
> [25338.534000]  __setup_irq.cold.53+0x7c/0xd3
> [25338.538098]  request_threaded_irq+0xf5/0x160
> [25338.542371]  vp_find_vqs+0xc7/0x190
> [25338.545866]  init_vq+0x17c/0x2e0 [virtio_blk]
> [25338.550223]  ? ncpus_cmp_func+0x10/0x10
> [25338.554061]  virtblk_probe+0xe6/0x8a0 [virtio_blk]
> [25338.558846]  virtio_dev_probe+0x158/0x1f0
> [25338.562861]  really_probe+0x255/0x4a0
> [25338.566524]  ? __driver_attach_async_helper+0x90/0x90
> [25338.571567]  driver_probe_device+0x49/0xc0
> [25338.575660]  bus_for_each_drv+0x79/0xc0
> [25338.579499]  __device_attach+0xdc/0x160
> [25338.583337]  bus_probe_device+0x9d/0xb0
> [25338.587167]  device_add+0x418/0x780
> [25338.590654]  register_virtio_device+0x9e/0xe0
> [25338.595011]  virtio_pci_probe+0xb3/0x140
> [25338.598941]  local_pci_probe+0x41/0x90
> [25338.602689]  work_for_cpu_fn+0x16/0x20
> [25338.606443]  process_one_work+0x1a7/0x360
> [25338.610456]  ? create_worker+0x1a0/0x1a0
> [25338.614381]  worker_thread+0x1cf/0x390
> [25338.618132]  ? create_worker+0x1a0/0x1a0
> [25338.622051]  kthread+0x116/0x130
> [25338.625283]  ? kthread_flush_work_fn+0x10/0x10
> [25338.629731]  ret_from_fork+0x1f/0x40
> [25338.633395] virtio_blk: probe of virtio418 failed with error -16
> 
> After I did some work of this stack,took stap and crash to get more
> information,I found that the auto irq_affinity affect this.
> When "vp_find_vqs" call "vp_find_vqs_msix" failed,it will be go back
> to call vp_find_vqs_msix again with ctx be false, and when it failed again,
> we will call vp_find_vqs_intx,if the vp_dev->pci_dev->irq is zero,
> we will get a backtrace like above.
> 
> The log :
> "genirq: Flags mismatch irq 0. 00000080 (virtio418) vs. 00015a00 (timer)"
> was print because of the irq 0 is used by timer exclusive,and when
> vp_find_vqs called vp_find_vqs_msix and return false twice,then it will
> call vp_find_vqs_intx for the last try.
> Because vp_dev->pci_dev->irq is zero,so it will be request irq 0 with
> flag IRQF_SHARED.
> 
> without config CONFIG_GENERIC_IRQ_DEBUGFS,
> I found that we called vp_find_vqs_msix failed twice because of
> the irq resource was exhausted.
> 
> crash> irq_domain.name,parent 0xffff9bff87d4dec0
>   name = 0xffff9bff87c1fd60 "INTEL-IR-MSI-1-2"
>   parent = 0xffff9bff87400000
> crash> irq_domain.name,parent 0xffff9bff87400000
>   name = 0xffff9bff87c24300 "INTEL-IR-1"
>   parent = 0xffff9bff87c6c900
> crash> irq_domain.name,parent 0xffff9bff87c6c900
>   name = 0xffff9bff87c3ecd0 "VECTOR"
>   parent = 0x0----------------------the highest level
> 
> and stap irq_matrix_alloc_managed get return value -ENOSPC.
> 
> When no virtio_blk device probe,the vctor_matrix is:
> crash>  p *vector_matrix
> $1 = {
>   matrix_bits = 256,
>   alloc_start = 32,
>   alloc_end = 236,
>   alloc_size = 204,
>   global_available = 15593,
>   global_reserved = 149,
>   systembits_inalloc = 3,
>   total_allocated = 409,
>   online_maps = 80,
>   maps = 0x2ff20,
>   scratch_map = {1161063342014463, 0, 1, 18446726481523507200,
>  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
>  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
>   system_map = {1125904739729407, 0, 1, 18446726481523507200,
>  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
>  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
> }
> 
> When the dump stack occur,the vector_matrix of system is exhausted.
> crash> p *vector_matrix
> $82 = {
>   matrix_bits = 256,
>   alloc_start = 32,
>   alloc_end = 236,
>   alloc_size = 204,
>   global_available = 0,//caq:irq left
>   global_reserved = 151,
>   systembits_inalloc = 3,
>   total_allocated = 1922,//caq:irq that allocated
>   online_maps = 80,
>   maps = 0x2ff20,
>   scratch_map = {18446744069952503807, 18446744073709551615,
>  18446744073709551615, 18446735277616529407, 0, 0, 0, 0, 0,
>  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
>   system_map = {1125904739729407, 0, 1, 18446726481523507200,
>  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
>  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
> }
> 
> And we tested the virtio_blk device which request irq success,
> we found that in a system with 80 cores and two numa ,one
> virtio_blk device with just two data queues consume 81 irqs capacity,
> Although it just only three irqs in /proc/interrupt,80 irqs capacity 
> is effected by function "irq_build_affinity_masks" with 2*40.

irq_build_affinity_masks() is just for spreading CPUs among the two
vectors, nothing to do with your issue.

Your issue should be related with irq matrix code, which manages effective
cpu allocation for irq vector, nothing to do with irq_build_affinity_masks().

Cc Thomas.

> 
> before one virtio_blk device hotplug out:
> crash> p *vector_matrix
> $2 = {
>   matrix_bits = 256,
>   alloc_start = 32,
>   alloc_end = 236,
>   alloc_size = 204,
>   global_available = 15215,
>   global_reserved = 150,
>   systembits_inalloc = 3,
>   total_allocated = 553,
>   online_maps = 80,
>   maps = 0x2ff20,
>   scratch_map = {1179746449752063, 0, 1, 18446726481523507200, 0, 0, 0,
>  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
>  0, 0, 0, 0, 0},
>   system_map = {1125904739729407, 0, 1, 18446726481523507200, 0, 0, 0,
>  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
>  0, 0, 0, 0, 0}
> }
> 
> after one virtio_blk device hotplug out:
> crash> p *vector_matrix
> $3 = {
>   matrix_bits = 256,
>   alloc_start = 32,
>   alloc_end = 236,
>   alloc_size = 204,
>   global_available = 15296,---it increase 81,include 1 config irq.
>   global_reserved = 150,
>   systembits_inalloc = 3,
>   total_allocated = 550,------it just decrease 3.
>   online_maps = 80,
>   maps = 0x2ff20,
>   scratch_map = {481036337152, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
>  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
>  0, 0, 0, 0},
>   system_map = {1125904739729407, 0, 1, 18446726481523507200, 0, 0, 0,
>  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
>  0, 0, 0, 0, 0}
> }
> 
> We test the new kernel also,it occur the same result.
> [Fri Sep 23 04:51:42 2022] genirq: Flags mismatch irq 0. 00000080 (virtio608) vs. 00015a00 (timer)
> [Fri Sep 23 04:51:42 2022] CPU: 0 PID: 5749 Comm: kworker/0:0 Kdump: loaded Tainted: G        W  OE      6.0.0-rc6+ #5
> [Fri Sep 23 04:51:42 2022] Hardware name: Inspur NF5280M5/YZMB-00882-10E, BIOS 4.1.19 06/16/2021
> [Fri Sep 23 04:51:42 2022] Workqueue: events work_for_cpu_fn
> [Fri Sep 23 04:51:42 2022] Call Trace:
> [Fri Sep 23 04:51:42 2022]  <TASK>
> [Fri Sep 23 04:51:42 2022]  dump_stack_lvl+0x33/0x46
> [Fri Sep 23 04:51:42 2022]  __setup_irq+0x705/0x770
> [Fri Sep 23 04:51:42 2022]  request_threaded_irq+0x109/0x170
> [Fri Sep 23 04:51:42 2022]  vp_find_vqs+0xc4/0x190
> [Fri Sep 23 04:51:42 2022]  init_vqs+0x348/0x580 [virtio_net]
> [Fri Sep 23 04:51:42 2022]  virtnet_probe+0x54d/0xa80 [virtio_net]
> [Fri Sep 23 04:51:42 2022]  virtio_dev_probe+0x19c/0x240
> [Fri Sep 23 04:51:42 2022]  really_probe+0x106/0x3e0
> [Fri Sep 23 04:51:42 2022]  ? pm_runtime_barrier+0x4f/0xa0
> [Fri Sep 23 04:51:42 2022]  __driver_probe_device+0x79/0x170
> [Fri Sep 23 04:51:42 2022]  driver_probe_device+0x1f/0xa0
> [Fri Sep 23 04:51:42 2022]  __device_attach_driver+0x85/0x110
> [Fri Sep 23 04:51:42 2022]  ? driver_allows_async_probing+0x60/0x60
> [Fri Sep 23 04:51:42 2022]  ? driver_allows_async_probing+0x60/0x60
> [Fri Sep 23 04:51:42 2022]  bus_for_each_drv+0x67/0xb0
> [Fri Sep 23 04:51:42 2022]  __device_attach+0xe9/0x1b0
> [Fri Sep 23 04:51:42 2022]  bus_probe_device+0x87/0xa0
> [Fri Sep 23 04:51:42 2022]  device_add+0x59f/0x950
> [Fri Sep 23 04:51:42 2022]  ? dev_set_name+0x4e/0x70
> [Fri Sep 23 04:51:42 2022]  register_virtio_device+0xac/0xf0
> [Fri Sep 23 04:51:42 2022]  virtio_pci_probe+0x101/0x170
> [Fri Sep 23 04:51:42 2022]  local_pci_probe+0x42/0xa0
> [Fri Sep 23 04:51:42 2022]  work_for_cpu_fn+0x13/0x20
> [Fri Sep 23 04:51:42 2022]  process_one_work+0x1c2/0x3d0
> [Fri Sep 23 04:51:42 2022]  ? process_one_work+0x3d0/0x3d0
> [Fri Sep 23 04:51:42 2022]  worker_thread+0x1b9/0x360
> [Fri Sep 23 04:51:42 2022]  ? process_one_work+0x3d0/0x3d0
> [Fri Sep 23 04:51:42 2022]  kthread+0xe6/0x110
> [Fri Sep 23 04:51:42 2022]  ? kthread_complete_and_exit+0x20/0x20
> [Fri Sep 23 04:51:42 2022]  ret_from_fork+0x1f/0x30
> [Fri Sep 23 04:51:42 2022]  </TASK>
> [Fri Sep 23 04:51:43 2022] virtio_net: probe of virtio608 failed with error -16
> 
> Fixes: ad71473d9c43 ("virtio_blk: use virtio IRQ affinity")
> Signed-off-by: Angus Chen <angus.chen@jaguarmicro.com>
> Tested-by: Liming Wu <liming.wu@jaguarmicro.com>
> ---
>  drivers/block/virtio_blk.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
> index a8bcf3f664af..075de30a9bb4 100644
> --- a/drivers/block/virtio_blk.c
> +++ b/drivers/block/virtio_blk.c
> @@ -513,7 +513,6 @@ static int init_vq(struct virtio_blk *vblk)
>  	struct virtqueue **vqs;
>  	unsigned short num_vqs;
>  	struct virtio_device *vdev = vblk->vdev;
> -	struct irq_affinity desc = { 0, };
>  
>  	err = virtio_cread_feature(vdev, VIRTIO_BLK_F_MQ,
>  				   struct virtio_blk_config, num_queues,
> @@ -548,7 +547,7 @@ static int init_vq(struct virtio_blk *vblk)
>  	}
>  
>  	/* Discover virtqueues and write information to configuration.  */
> -	err = virtio_find_vqs(vdev, num_vqs, vqs, callbacks, names, &desc);
> +	err = virtio_find_vqs(vdev, num_vqs, vqs, callbacks, names, NULL);
>  	if (err)
>  		goto out;

This patch isn't good since blk-mq's queue mapping depends on managed
irq affinity, and this way breaks queue mapping.


Thanks,
Ming

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
