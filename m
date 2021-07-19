Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA213CEE03
	for <lists.virtualization@lfdr.de>; Mon, 19 Jul 2021 23:04:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92A2040437;
	Mon, 19 Jul 2021 21:04:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YqNDwbs598he; Mon, 19 Jul 2021 21:04:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 04B1440421;
	Mon, 19 Jul 2021 21:04:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 84421C000E;
	Mon, 19 Jul 2021 21:04:20 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7DD79C000E
 for <virtualization@lists.linux-foundation.org>;
 Mon, 19 Jul 2021 21:04:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 692D9402AA
 for <virtualization@lists.linux-foundation.org>;
 Mon, 19 Jul 2021 21:04:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EkQ14YAjcLq6
 for <virtualization@lists.linux-foundation.org>;
 Mon, 19 Jul 2021 21:04:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8685240155
 for <virtualization@lists.linux-foundation.org>;
 Mon, 19 Jul 2021 21:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626728656;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mDzv4r/nKmHoEY/y/S31BYFYyCyd3ydFbHliB67gI10=;
 b=ZypLFW8xkdb+aFF0+TYJSwLYYxoRilXOWlapqh1Q0ab+HWjaMvE0qNEOCF513jq3mnmqTP
 Xf4u2FDuMC+aK3ODd32jdxf25UYJNFcPF83xDHDsZLdNQc/A71nuN6orvpzXWMyG0jYPOB
 Bq1S03cjjNY2iDIPeK2DVGMW8wGjzSU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-590-Lt425qk5P-W4_BxnE0IKdQ-1; Mon, 19 Jul 2021 17:04:15 -0400
X-MC-Unique: Lt425qk5P-W4_BxnE0IKdQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A49EA100C610;
 Mon, 19 Jul 2021 21:04:13 +0000 (UTC)
Received: from fuller.cnet (ovpn-112-6.gru2.redhat.com [10.97.112.6])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 79F4A2706E;
 Mon, 19 Jul 2021 21:04:01 +0000 (UTC)
Received: by fuller.cnet (Postfix, from userid 1000)
 id E87DB4172ED4; Mon, 19 Jul 2021 18:03:55 -0300 (-03)
Date: Mon, 19 Jul 2021 18:03:55 -0300
From: Marcelo Tosatti <mtosatti@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [RFC 1/3] cpuidle: add poll_source API
Message-ID: <20210719210355.GA46373@fuller.cnet>
References: <20210713161906.457857-1-stefanha@redhat.com>
 <20210713161906.457857-2-stefanha@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210713161906.457857-2-stefanha@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Cc: Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@infradead.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 Ming Lei <ming.lei@redhat.com>, linux-block@vger.kernel.org,
 linux-pm@vger.kernel.org, virtualization@lists.linux-foundation.org
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

Hi Stefan,

On Tue, Jul 13, 2021 at 05:19:04PM +0100, Stefan Hajnoczi wrote:
> Introduce an API for adding cpuidle poll callbacks:
> 
>   struct poll_source_ops {
>       void (*start)(struct poll_source *src);
>       void (*stop)(struct poll_source *src);
>       void (*poll)(struct poll_source *src);
>   };
> 
>   int poll_source_register(struct poll_source *src);
>   int poll_source_unregister(struct poll_source *src);
> 
> When cpuidle enters the poll state it invokes ->start() and then invokes
> ->poll() repeatedly from the busy wait loop. Finally ->stop() is invoked
> when the busy wait loop finishes.
> 
> The ->poll() function should check for activity and cause
> TIF_NEED_RESCHED to be set in order to stop the busy wait loop.
> 
> This API is intended to be used by drivers that can cheaply poll for
> events. Participating in cpuidle polling allows them to avoid interrupt
> latencies during periods where the CPU is going to poll anyway.
> 
> Note that each poll_source is bound to a particular CPU. The API is
> mainly intended to by used by drivers that have multiple queues with irq
> affinity.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  drivers/cpuidle/Makefile      |  1 +
>  include/linux/poll_source.h   | 53 +++++++++++++++++++
>  drivers/cpuidle/poll_source.c | 99 +++++++++++++++++++++++++++++++++++
>  drivers/cpuidle/poll_state.c  |  6 +++
>  4 files changed, 159 insertions(+)
>  create mode 100644 include/linux/poll_source.h
>  create mode 100644 drivers/cpuidle/poll_source.c
> 
> diff --git a/drivers/cpuidle/Makefile b/drivers/cpuidle/Makefile
> index 26bbc5e74123..994f72d6fe95 100644
> --- a/drivers/cpuidle/Makefile
> +++ b/drivers/cpuidle/Makefile
> @@ -7,6 +7,7 @@ obj-y += cpuidle.o driver.o governor.o sysfs.o governors/
>  obj-$(CONFIG_ARCH_NEEDS_CPU_IDLE_COUPLED) += coupled.o
>  obj-$(CONFIG_DT_IDLE_STATES)		  += dt_idle_states.o
>  obj-$(CONFIG_ARCH_HAS_CPU_RELAX)	  += poll_state.o
> +obj-$(CONFIG_ARCH_HAS_CPU_RELAX)	  += poll_source.o
>  obj-$(CONFIG_HALTPOLL_CPUIDLE)		  += cpuidle-haltpoll.o
>  
>  ##################################################################################
> diff --git a/include/linux/poll_source.h b/include/linux/poll_source.h
> new file mode 100644
> index 000000000000..ccfb424e170b
> --- /dev/null
> +++ b/include/linux/poll_source.h
> @@ -0,0 +1,53 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * poll_source.h - cpuidle busy waiting API
> + */
> +#ifndef __LINUX_POLLSOURCE_H__
> +#define __LINUX_POLLSOURCE_H__
> +
> +#include <linux/list.h>
> +
> +struct poll_source;
> +
> +struct poll_source_ops {
> +	void (*start)(struct poll_source *src);
> +	void (*stop)(struct poll_source *src);
> +	void (*poll)(struct poll_source *src);
> +};
> +
> +struct poll_source {
> +	const struct poll_source_ops *ops;
> +	struct list_head node;
> +	int cpu;
> +};
> +
> +/**
> + * poll_source_register - Add a poll_source for a CPU
> + */
> +#if defined(CONFIG_CPU_IDLE) && defined(CONFIG_ARCH_HAS_CPU_RELAX)
> +int poll_source_register(struct poll_source *src);
> +#else
> +static inline int poll_source_register(struct poll_source *src)
> +{
> +	return 0;
> +}
> +#endif
> +
> +/**
> + * poll_source_unregister - Remove a previously registered poll_source
> + */
> +#if defined(CONFIG_CPU_IDLE) && defined(CONFIG_ARCH_HAS_CPU_RELAX)
> +int poll_source_unregister(struct poll_source *src);
> +#else
> +static inline int poll_source_unregister(struct poll_source *src)
> +{
> +	return 0;
> +}
> +#endif
> +
> +/* Used by the cpuidle driver */
> +void poll_source_start(void);
> +void poll_source_run_once(void);
> +void poll_source_stop(void);
> +
> +#endif /* __LINUX_POLLSOURCE_H__ */
> diff --git a/drivers/cpuidle/poll_source.c b/drivers/cpuidle/poll_source.c
> new file mode 100644
> index 000000000000..46100e5a71e4
> --- /dev/null
> +++ b/drivers/cpuidle/poll_source.c
> @@ -0,0 +1,99 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * poll_source.c - cpuidle busy waiting API
> + */
> +
> +#include <linux/lockdep.h>
> +#include <linux/percpu.h>
> +#include <linux/poll_source.h>
> +
> +/* The per-cpu list of registered poll sources */
> +DEFINE_PER_CPU(struct list_head, poll_source_list);
> +
> +/* Called from idle task with TIF_POLLING_NRFLAG set and irqs enabled */
> +void poll_source_start(void)
> +{
> +	struct poll_source *src;
> +
> +	list_for_each_entry(src, this_cpu_ptr(&poll_source_list), node)
> +		src->ops->start(src);
> +}
> +
> +/* Called from idle task with TIF_POLLING_NRFLAG set and irqs enabled */
> +void poll_source_run_once(void)
> +{
> +	struct poll_source *src;
> +
> +	list_for_each_entry(src, this_cpu_ptr(&poll_source_list), node)
> +		src->ops->poll(src);
> +}
> +
> +/* Called from idle task with TIF_POLLING_NRFLAG set and irqs enabled */
> +void poll_source_stop(void)
> +{
> +	struct poll_source *src;
> +
> +	list_for_each_entry(src, this_cpu_ptr(&poll_source_list), node)
> +		src->ops->stop(src);
> +}
> +
> +static void poll_source_register_this_cpu(void *opaque)
> +{
> +	struct poll_source *src = opaque;
> +
> +	lockdep_assert_irqs_disabled();
> +
> +	list_add_tail(&src->node, this_cpu_ptr(&poll_source_list));
> +}
> +
> +int poll_source_register(struct poll_source *src)
> +{
> +	if (!list_empty(&src->node))
> +		return -EBUSY;
> +
> +	/*
> +	 * There is no race with src->cpu iterating over poll_source_list
> +	 * because smp_call_function_single() just sets TIF_NEED_RESCHED

Hum... what about 

CPU-0				CPU-1

poll_source_start		poll_source_register IPI'ing CPU-0

Perhaps a llist can be used?

>               while (!need_resched()) {
> +                     poll_source_run_once();

Probably want to use static_key's for ->start, ->stop and ->poll?

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
