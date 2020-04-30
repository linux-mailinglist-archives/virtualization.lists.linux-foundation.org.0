Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB221C0099
	for <lists.virtualization@lfdr.de>; Thu, 30 Apr 2020 17:41:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4033F86D79;
	Thu, 30 Apr 2020 15:41:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0DTMSsNixjXl; Thu, 30 Apr 2020 15:41:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4908F86D6A;
	Thu, 30 Apr 2020 15:41:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1CF90C016F;
	Thu, 30 Apr 2020 15:41:30 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AD783C016F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Apr 2020 15:41:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 9278B87F92
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Apr 2020 15:41:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AxPIes4bujMQ
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Apr 2020 15:41:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from out03.mta.xmission.com (out03.mta.xmission.com [166.70.13.233])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 9D44287F8C
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Apr 2020 15:41:25 +0000 (UTC)
Received: from in02.mta.xmission.com ([166.70.13.52])
 by out03.mta.xmission.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.90_1)
 (envelope-from <ebiederm@xmission.com>)
 id 1jUBJT-0008Qi-7v; Thu, 30 Apr 2020 09:41:23 -0600
Received: from ip68-227-160-95.om.om.cox.net ([68.227.160.95]
 helo=x220.xmission.com) by in02.mta.xmission.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.87)
 (envelope-from <ebiederm@xmission.com>)
 id 1jUBJS-0002Fp-2k; Thu, 30 Apr 2020 09:41:22 -0600
From: ebiederm@xmission.com (Eric W. Biederman)
To: David Hildenbrand <david@redhat.com>
References: <20200430102908.10107-1-david@redhat.com>
 <20200430102908.10107-3-david@redhat.com>
Date: Thu, 30 Apr 2020 10:38:04 -0500
In-Reply-To: <20200430102908.10107-3-david@redhat.com> (David Hildenbrand's
 message of "Thu, 30 Apr 2020 12:29:07 +0200")
Message-ID: <87pnbp2dcz.fsf@x220.int.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-XM-SPF: eid=1jUBJS-0002Fp-2k; ; ; mid=<87pnbp2dcz.fsf@x220.int.ebiederm.org>;
 ; ; hst=in02.mta.xmission.com; ; ; ip=68.227.160.95; ; ;
 frm=ebiederm@xmission.com; ; ; spf=neutral
X-XM-AID: U2FsdGVkX18EJxut0ZMAzA6GiTlXjw55Di06eL/sNkE=
X-SA-Exim-Connect-IP: 68.227.160.95
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-Spam-DCC: XMission; sa07 1397; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: *;David Hildenbrand <david@redhat.com>
X-Spam-Relay-Country: 
X-Spam-Timing: total 643 ms - load_scoreonly_sql: 0.04 (0.0%),
 signal_user_changed: 11 (1.7%), b_tie_ro: 10 (1.5%), parse: 1.37
 (0.2%), extract_message_metadata: 29 (4.4%), get_uri_detail_list: 4.7
 (0.7%), tests_pri_-1000: 50 (7.8%), tests_pri_-950: 1.81 (0.3%),
 tests_pri_-900: 1.57 (0.2%), tests_pri_-90: 188 (29.3%), check_bayes:
 186 (28.9%), b_tokenize: 11 (1.7%), b_tok_get_all: 91 (14.2%),
 b_comp_prob: 3.8 (0.6%), b_tok_touch_all: 76 (11.8%), b_finish: 0.97
 (0.2%), tests_pri_0: 346 (53.9%), check_dkim_signature: 0.82 (0.1%),
 check_dkim_adsp: 2.4 (0.4%), poll_dns_idle: 0.54 (0.1%), tests_pri_10:
 2.3 (0.4%), tests_pri_500: 7 (1.1%), rewrite_mail: 0.00 (0.0%)
Subject: Re: [PATCH v2 2/3] mm/memory_hotplug: Introduce MHP_NO_FIRMWARE_MEMMAP
X-SA-Exim-Version: 4.2.1 (built Thu, 05 May 2016 13:38:54 -0600)
X-SA-Exim-Scanned: Yes (on in02.mta.xmission.com)
Cc: virtio-dev@lists.oasis-open.org, linux-hyperv@vger.kernel.org,
 Michal Hocko <mhocko@suse.com>, Baoquan He <bhe@redhat.com>,
 linux-mm@kvack.org, Wei Yang <richard.weiyang@gmail.com>,
 linux-s390@vger.kernel.org, linux-nvdimm@lists.01.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-acpi@vger.kernel.org, "Michael S . Tsirkin" <mst@redhat.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>, xen-devel@lists.xenproject.org,
 Andrew Morton <akpm@linux-foundation.org>, Michal Hocko <mhocko@kernel.org>,
 linuxppc-dev@lists.ozlabs.org
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

David Hildenbrand <david@redhat.com> writes:

> Some devices/drivers that add memory via add_memory() and friends (e.g.,
> dax/kmem, but also virtio-mem in the future) don't want to create entries
> in /sys/firmware/memmap/ - primarily to hinder kexec from adding this
> memory to the boot memmap of the kexec kernel.
>
> In fact, such memory is never exposed via the firmware memmap as System
> RAM (e.g., e820), so exposing this memory via /sys/firmware/memmap/ is
> wrong:
>  "kexec needs the raw firmware-provided memory map to setup the
>   parameter segment of the kernel that should be booted with
>   kexec. Also, the raw memory map is useful for debugging. For
>   that reason, /sys/firmware/memmap is an interface that provides
>   the raw memory map to userspace." [1]
>
> We don't have to worry about firmware_map_remove() on the removal path.
> If there is no entry, it will simply return with -EINVAL.
>
> [1]
> https://www.kernel.org/doc/Documentation/ABI/testing/sysfs-firmware-memmap


You know what this justification is rubbish, and I have previously
explained why it is rubbish.

Nacked-by: "Eric W. Biederman" <ebiederm@xmission.com>

This needs to be based on weather the added memory is ultimately normal
ram or is something special.

At least when we are talking memory resources.  Keeping it out of the
firmware map that is fine.

If the hotplugged memory is the result of plugging a stick of ram
into the kernel and can and should used be like any other memory
it should be treated like any normal memory.

If the hotplugged memory is something special it should be treated as
something special.

Justifying behavior by documentation that does not consider memory
hotplug is bad thinking.








> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Michal Hocko <mhocko@suse.com>
> Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
> Cc: Wei Yang <richard.weiyang@gmail.com>
> Cc: Baoquan He <bhe@redhat.com>
> Cc: Eric Biederman <ebiederm@xmission.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  include/linux/memory_hotplug.h | 8 ++++++++
>  mm/memory_hotplug.c            | 3 ++-
>  2 files changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/include/linux/memory_hotplug.h b/include/linux/memory_hotplug.h
> index 0151fb935c09..4ca418a731eb 100644
> --- a/include/linux/memory_hotplug.h
> +++ b/include/linux/memory_hotplug.h
> @@ -68,6 +68,14 @@ struct mhp_params {
>  	pgprot_t pgprot;
>  };
>  
> +/* Flags used for add_memory() and friends. */
> +
> +/*
> + * Don't create entries in /sys/firmware/memmap/. The memory is detected and
> + * added via a device driver, not via the initial (firmware) memmap.
> + */
> +#define MHP_NO_FIRMWARE_MEMMAP		1
> +
>  /*
>   * Zone resizing functions
>   *
> diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
> index c01be92693e3..e94ede9cad00 100644
> --- a/mm/memory_hotplug.c
> +++ b/mm/memory_hotplug.c
> @@ -1062,7 +1062,8 @@ int __ref add_memory_resource(int nid, struct resource *res,
>  	BUG_ON(ret);
>  
>  	/* create new memmap entry */
> -	firmware_map_add_hotplug(start, start + size, "System RAM");
> +	if (!(flags & MHP_NO_FIRMWARE_MEMMAP))
> +		firmware_map_add_hotplug(start, start + size, "System RAM");
>  
>  	/* device_online() will take the lock when calling online_pages() */
>  	mem_hotplug_done();
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
