Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id C78DB762F42
	for <lists.virtualization@lfdr.de>; Wed, 26 Jul 2023 10:09:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E72ED8203A;
	Wed, 26 Jul 2023 08:08:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E72ED8203A
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fromorbit-com.20221208.gappssmtp.com header.i=@fromorbit-com.20221208.gappssmtp.com header.a=rsa-sha256 header.s=20221208 header.b=3FtP6nyx
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zh78M9UCxG_0; Wed, 26 Jul 2023 08:08:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 3514A8169B;
	Wed, 26 Jul 2023 08:08:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3514A8169B
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8257CC0DD4;
	Wed, 26 Jul 2023 08:08:57 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 38AD0C0032
 for <virtualization@lists.linux-foundation.org>;
 Wed, 26 Jul 2023 08:08:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F030860F7D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 26 Jul 2023 08:08:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F030860F7D
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=fromorbit-com.20221208.gappssmtp.com
 header.i=@fromorbit-com.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=3FtP6nyx
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FJoZVZEQURvv
 for <virtualization@lists.linux-foundation.org>;
 Wed, 26 Jul 2023 08:08:54 +0000 (UTC)
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7C46160BCE
 for <virtualization@lists.linux-foundation.org>;
 Wed, 26 Jul 2023 08:08:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C46160BCE
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-686b879f605so725874b3a.1
 for <virtualization@lists.linux-foundation.org>;
 Wed, 26 Jul 2023 01:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fromorbit-com.20221208.gappssmtp.com; s=20221208; t=1690358934; x=1690963734;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=rPtpzUEslahCE2fhb6v9FLtKmqwh/pul7nSSkK8nPUc=;
 b=3FtP6nyx+rPcvJcblHl1Mu2LvC6NkDi8xEgEFylBPkAlQaYADspiGMJ27o0GgAuj9z
 McDVZgCUGviszUiy5R0bXahfbrRAfjxnAxmHNnPbaM1LXdSCHnASLGDwytdN0by6FDcI
 RpceDu/PcRlhyfyf4mYkuokxgwLuCVwRBZl0phBMBuXEmpOfHBU9f5yCZoh2dEO+7TTN
 DCOxQvb0O++5gEaT2a05V97Ei89pJv+cbAW7+SqulKGKTdXaXFuVtxE2YrWoJBaFXRhx
 fYB72/J5kZ33VcSsegtqBeEJQacLBG5vKC0M6tbbiCEw9x2oLmMOMSwg9ysSaFAgqAI5
 sgYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690358934; x=1690963734;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rPtpzUEslahCE2fhb6v9FLtKmqwh/pul7nSSkK8nPUc=;
 b=HyZCYlxr/v4GDX1C4SqecJ4aC3Nl05gAE8fcphnp+T9hCllks5GSrqSPGhg+6C6Gxe
 6i7uES0oTLzhoQII76ZFrwlTE2XAUgk9kF4QmhdryIgAXL1ipOWA4usAA4mtOLFtGNVz
 H5IDEjrMoq7kUwFdsoe2+OklxuEJA6V9JH4G9JWjrFSxsHQOzMSi0d755niV2WPbY9XK
 htN+HFEPyNC62F3X8NgmYq+F1E8u+Ak5D6WdJbnGCYQPVQ6vU9CJ525RqJUP57mWOyKc
 V6m9+i5TCQ7Xy7VibM/OZ5TmFZ68rVH/sHWdfxdIO+vsX/pbmO0RA/b/OwSKMRyavMqZ
 B8pA==
X-Gm-Message-State: ABy/qLbLpukqrC+cHR93rnqSXQwOErzt6fiVN/2isXnnUHRdxVCcZGax
 WgIN6NFwmFlz/i2CHAu0+Roqrw==
X-Google-Smtp-Source: APBJJlGxMb49Gcu6ThVo/6V+1HjCftCctRIBl06nDIbsd9lTZYFUn832db0oPfgPkp12tATT7U4xCA==
X-Received: by 2002:a05:6a20:1058:b0:138:dbff:f52b with SMTP id
 gt24-20020a056a20105800b00138dbfff52bmr934336pzc.22.1690358933657; 
 Wed, 26 Jul 2023 01:08:53 -0700 (PDT)
Received: from dread.disaster.area (pa49-186-119-116.pa.vic.optusnet.com.au.
 [49.186.119.116]) by smtp.gmail.com with ESMTPSA id
 w2-20020a170902e88200b001a24cded097sm12426907plg.236.2023.07.26.01.08.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jul 2023 01:08:53 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.96)
 (envelope-from <david@fromorbit.com>) id 1qOZZi-00Afxb-0y;
 Wed, 26 Jul 2023 18:08:50 +1000
Date: Wed, 26 Jul 2023 18:08:50 +1000
To: Qi Zheng <zhengqi.arch@bytedance.com>
Subject: Re: [PATCH v2 44/47] mm: shrinker: make global slab shrink lockless
Message-ID: <ZMDUkoIXUlTkCSYL@dread.disaster.area>
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
 <20230724094354.90817-45-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230724094354.90817-45-zhengqi.arch@bytedance.com>
Cc: kvm@vger.kernel.org, djwong@kernel.org, roman.gushchin@linux.dev,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linux-mm@kvack.org, dm-devel@redhat.com, linux-mtd@lists.infradead.org,
 cel@kernel.org, x86@kernel.org, steven.price@arm.com, cluster-devel@redhat.com,
 xen-devel@lists.xenproject.org, linux-ext4@vger.kernel.org, paulmck@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-nfs@vger.kernel.org, rcu@vger.kernel.org,
 linux-bcache@vger.kernel.org, yujie.liu@intel.com, vbabka@suse.cz,
 linux-raid@vger.kernel.org, brauner@kernel.org, tytso@mit.edu,
 gregkh@linuxfoundation.org, muchun.song@linux.dev,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, senozhatsky@chromium.org, netdev@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org, tkhai@ya.ru
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
From: Dave Chinner via Virtualization
 <virtualization@lists.linux-foundation.org>
Reply-To: Dave Chinner <david@fromorbit.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Mon, Jul 24, 2023 at 05:43:51PM +0800, Qi Zheng wrote:
> The shrinker_rwsem is a global read-write lock in shrinkers subsystem,
> which protects most operations such as slab shrink, registration and
> unregistration of shrinkers, etc. This can easily cause problems in the
> following cases.
> 
> 1) When the memory pressure is high and there are many filesystems
>    mounted or unmounted at the same time, slab shrink will be affected
>    (down_read_trylock() failed).
> 
>    Such as the real workload mentioned by Kirill Tkhai:
> 
>    ```
>    One of the real workloads from my experience is start
>    of an overcommitted node containing many starting
>    containers after node crash (or many resuming containers
>    after reboot for kernel update). In these cases memory
>    pressure is huge, and the node goes round in long reclaim.
>    ```
> 
> 2) If a shrinker is blocked (such as the case mentioned
>    in [1]) and a writer comes in (such as mount a fs),
>    then this writer will be blocked and cause all
>    subsequent shrinker-related operations to be blocked.
> 
> Even if there is no competitor when shrinking slab, there may still be a
> problem. The down_read_trylock() may become a perf hotspot with frequent
> calls to shrink_slab(). Because of the poor multicore scalability of
> atomic operations, this can lead to a significant drop in IPC
> (instructions per cycle).
> 
> We used to implement the lockless slab shrink with SRCU [2], but then
> kernel test robot reported -88.8% regression in
> stress-ng.ramfs.ops_per_sec test case [3], so we reverted it [4].
> 
> This commit uses the refcount+RCU method [5] proposed by Dave Chinner
> to re-implement the lockless global slab shrink. The memcg slab shrink is
> handled in the subsequent patch.
> 
> For now, all shrinker instances are converted to dynamically allocated and
> will be freed by kfree_rcu(). So we can use rcu_read_{lock,unlock}() to
> ensure that the shrinker instance is valid.
> 
> And the shrinker instance will not be run again after unregistration. So
> the structure that records the pointer of shrinker instance can be safely
> freed without waiting for the RCU read-side critical section.
> 
> In this way, while we implement the lockless slab shrink, we don't need to
> be blocked in unregister_shrinker().
> 
> The following are the test results:
> 
> stress-ng --timeout 60 --times --verify --metrics-brief --ramfs 9 &
> 
> 1) Before applying this patchset:
> 
> setting to a 60 second run per stressor
> dispatching hogs: 9 ramfs
> stressor       bogo ops real time  usr time  sys time   bogo ops/s     bogo ops/s
>                           (secs)    (secs)    (secs)   (real time) (usr+sys time)
> ramfs            735238     60.00     12.37    363.70     12253.05        1955.08
> for a 60.01s run time:
>    1440.27s available CPU time
>      12.36s user time   (  0.86%)
>     363.70s system time ( 25.25%)
>     376.06s total time  ( 26.11%)
> load average: 10.79 4.47 1.69
> passed: 9: ramfs (9)
> failed: 0
> skipped: 0
> successful run completed in 60.01s (1 min, 0.01 secs)
> 
> 2) After applying this patchset:
> 
> setting to a 60 second run per stressor
> dispatching hogs: 9 ramfs
> stressor       bogo ops real time  usr time  sys time   bogo ops/s     bogo ops/s
>                           (secs)    (secs)    (secs)   (real time) (usr+sys time)
> ramfs            746677     60.00     12.22    367.75     12443.70        1965.13
> for a 60.01s run time:
>    1440.26s available CPU time
>      12.21s user time   (  0.85%)
>     367.75s system time ( 25.53%)
>     379.96s total time  ( 26.38%)
> load average: 8.37 2.48 0.86
> passed: 9: ramfs (9)
> failed: 0
> skipped: 0
> successful run completed in 60.01s (1 min, 0.01 secs)
> 
> We can see that the ops/s has hardly changed.
> 
> [1]. https://lore.kernel.org/lkml/20191129214541.3110-1-ptikhomirov@virtuozzo.com/
> [2]. https://lore.kernel.org/lkml/20230313112819.38938-1-zhengqi.arch@bytedance.com/
> [3]. https://lore.kernel.org/lkml/202305230837.db2c233f-yujie.liu@intel.com/
> [4]. https://lore.kernel.org/all/20230609081518.3039120-1-qi.zheng@linux.dev/
> [5]. https://lore.kernel.org/lkml/ZIJhou1d55d4H1s0@dread.disaster.area/
> 
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> ---
>  include/linux/shrinker.h | 19 +++++++---
>  mm/shrinker.c            | 75 ++++++++++++++++++++++++++--------------
>  mm/shrinker_debug.c      | 52 +++++++++++++++++++++-------
>  3 files changed, 104 insertions(+), 42 deletions(-)
> 
> diff --git a/include/linux/shrinker.h b/include/linux/shrinker.h
> index 36977a70bebb..335da93cccee 100644
> --- a/include/linux/shrinker.h
> +++ b/include/linux/shrinker.h
> @@ -4,6 +4,7 @@
>  
>  #include <linux/atomic.h>
>  #include <linux/types.h>
> +#include <linux/refcount.h>
>  
>  #define SHRINKER_UNIT_BITS	BITS_PER_LONG
>  
> @@ -86,6 +87,10 @@ struct shrinker {
>  	long batch;	/* reclaim batch size, 0 = default */
>  	int seeks;	/* seeks to recreate an obj */
>  	unsigned flags;
> +	bool registered;
> +
> +	refcount_t refcount;
> +	struct rcu_head rcu;
>  
>  	void *private_data;
>  
> @@ -106,14 +111,13 @@ struct shrinker {
>  #define DEFAULT_SEEKS 2 /* A good number if you don't know better. */
>  
>  /* Flags */
> -#define SHRINKER_REGISTERED	(1 << 0)
> -#define SHRINKER_NUMA_AWARE	(1 << 1)
> -#define SHRINKER_MEMCG_AWARE	(1 << 2)
> +#define SHRINKER_NUMA_AWARE	(1 << 0)
> +#define SHRINKER_MEMCG_AWARE	(1 << 1)
>  /*
>   * It just makes sense when the shrinker is also MEMCG_AWARE for now,
>   * non-MEMCG_AWARE shrinker should not have this flag set.
>   */
> -#define SHRINKER_NONSLAB	(1 << 3)
> +#define SHRINKER_NONSLAB	(1 << 2)
>  
>  unsigned long shrink_slab(gfp_t gfp_mask, int nid, struct mem_cgroup *memcg,
>  			  int priority);
> @@ -122,6 +126,13 @@ void shrinker_free_non_registered(struct shrinker *shrinker);
>  void shrinker_register(struct shrinker *shrinker);
>  void shrinker_unregister(struct shrinker *shrinker);
>  
> +static inline bool shrinker_try_get(struct shrinker *shrinker)
> +{
> +	return READ_ONCE(shrinker->registered) &&
> +	       refcount_inc_not_zero(&shrinker->refcount);
> +}

Why do we care about shrinker->registered here? If we don't set
the refcount to 1 until we have fully initialised everything, then
the shrinker code can key entirely off the reference count and
none of the lookup code needs to care about whether the shrinker is
registered or not.

> +void shrinker_put(struct shrinker *shrinker);
> +
>  #ifdef CONFIG_SHRINKER_DEBUG
>  extern int shrinker_debugfs_add(struct shrinker *shrinker);
>  extern struct dentry *shrinker_debugfs_detach(struct shrinker *shrinker,
> diff --git a/mm/shrinker.c b/mm/shrinker.c
> index 8a1fe844f1a4..8e3334749552 100644
> --- a/mm/shrinker.c
> +++ b/mm/shrinker.c
> @@ -2,10 +2,13 @@
>  #include <linux/memcontrol.h>
>  #include <linux/rwsem.h>
>  #include <linux/shrinker.h>
> +#include <linux/rculist.h>
> +#include <linux/spinlock.h>
>  #include <trace/events/vmscan.h>
>  
>  LIST_HEAD(shrinker_list);
>  DECLARE_RWSEM(shrinker_rwsem);
> +DEFINE_SPINLOCK(shrinker_lock);
>  
>  #ifdef CONFIG_MEMCG
>  static int shrinker_nr_max;
> @@ -450,6 +453,18 @@ static unsigned long do_shrink_slab(struct shrink_control *shrinkctl,
>  	return freed;
>  }
>  
> +void shrinker_put(struct shrinker *shrinker)
> +{
> +	if (refcount_dec_and_test(&shrinker->refcount)) {
> +		spin_lock(&shrinker_lock);
> +		list_del_rcu(&shrinker->list);
> +		spin_unlock(&shrinker_lock);
> +
> +		kfree(shrinker->nr_deferred);
> +		kfree_rcu(shrinker, rcu);
> +	}
> +}

Urk, no.

We want the shrinker_free() code to block waiting for the shrinker
reference count to go to zero, because the shrinkers can reference
structures that are associated with the path that is freeing the
shrinker.

i.e. we do not want to free the superblock of a filesystem whilst
the shrinker is still running, but the way you've done this is that
the shrinker can run whilst the structure that contains it has been
torn down.

This should use a completion, then it is always safe under
rcu_read_lock().  This also gets rid of the shrinker_lock spin lock,
which only exists because we can't take a blocking lock under
rcu_read_lock(). i.e:


void shrinker_put(struct shrinker *shrinker)
{
	if (refcount_dec_and_test(&shrinker->refcount))
		complete(&shrinker->done);
}

void shrinker_free()
{
	.....
	refcount_dec(&shrinker->refcount);
	wait_for_completion(&shrinker->done);
	/*
	 * lookups on the shrinker will now all fail as refcount has
	 * fallen to zero. We can now remove it from the lists and
	 * free it.
	 */
	down_write(shrinker_rwsem);
	list_del_rcu(&shrinker->list);
	up_write(&shrinker_rwsem);
	call_rcu(shrinker->rcu_head, shrinker_free_rcu_cb);
}

....

> @@ -686,11 +711,14 @@ EXPORT_SYMBOL(shrinker_free_non_registered);
>  
>  void shrinker_register(struct shrinker *shrinker)
>  {
> -	down_write(&shrinker_rwsem);
> -	list_add_tail(&shrinker->list, &shrinker_list);
> -	shrinker->flags |= SHRINKER_REGISTERED;
> +	refcount_set(&shrinker->refcount, 1);
> +
> +	spin_lock(&shrinker_lock);
> +	list_add_tail_rcu(&shrinker->list, &shrinker_list);
> +	spin_unlock(&shrinker_lock);
> +
>  	shrinker_debugfs_add(shrinker);
> -	up_write(&shrinker_rwsem);
> +	WRITE_ONCE(shrinker->registered, true);
>  }
>  EXPORT_SYMBOL(shrinker_register);

This just looks wrong - you are trying to use WRITE_ONCE() as a
release barrier to indicate that the shrinker is now set up fully.
That's not necessary - the refcount is an atomic and along with the
rcu locks they should provides all the barriers we need. i.e.

void shrinker_register(struct shrinker *shrinker)
{
	down_write(&shrinker_rwsem);
	list_add_tail_rcu(&shrinker->list, &shrinker_list);
	shrinker->flags |= SHRINKER_REGISTERED;
	shrinker_debugfs_add(shrinker);
	up_write(&shrinker_rwsem);

	/*
	 * now the shrinker is fully set up, take the first
	 * reference to it to indicate that lookup operations are
	 * now allowed to use it via shrinker_try_get().
	 */
	refcount_set(&shrinker->refcount, 1);
}

> diff --git a/mm/shrinker_debug.c b/mm/shrinker_debug.c
> index f1becfd45853..c5573066adbf 100644
> --- a/mm/shrinker_debug.c
> +++ b/mm/shrinker_debug.c
> @@ -5,6 +5,7 @@
>  #include <linux/seq_file.h>
>  #include <linux/shrinker.h>
>  #include <linux/memcontrol.h>
> +#include <linux/rculist.h>
>  
>  /* defined in vmscan.c */
>  extern struct rw_semaphore shrinker_rwsem;
> @@ -161,17 +162,21 @@ int shrinker_debugfs_add(struct shrinker *shrinker)
>  {
>  	struct dentry *entry;
>  	char buf[128];
> -	int id;
> -
> -	lockdep_assert_held(&shrinker_rwsem);
> +	int id, ret = 0;
>  
>  	/* debugfs isn't initialized yet, add debugfs entries later. */
>  	if (!shrinker_debugfs_root)
>  		return 0;
>  
> +	down_write(&shrinker_rwsem);
> +	if (shrinker->debugfs_entry)
> +		goto fail;
> +
>  	id = ida_alloc(&shrinker_debugfs_ida, GFP_KERNEL);
> -	if (id < 0)
> -		return id;
> +	if (id < 0) {
> +		ret = id;
> +		goto fail;
> +	}
>  	shrinker->debugfs_id = id;
>  
>  	snprintf(buf, sizeof(buf), "%s-%d", shrinker->name, id);
> @@ -180,7 +185,8 @@ int shrinker_debugfs_add(struct shrinker *shrinker)
>  	entry = debugfs_create_dir(buf, shrinker_debugfs_root);
>  	if (IS_ERR(entry)) {
>  		ida_free(&shrinker_debugfs_ida, id);
> -		return PTR_ERR(entry);
> +		ret = PTR_ERR(entry);
> +		goto fail;
>  	}
>  	shrinker->debugfs_entry = entry;
>  
> @@ -188,7 +194,10 @@ int shrinker_debugfs_add(struct shrinker *shrinker)
>  			    &shrinker_debugfs_count_fops);
>  	debugfs_create_file("scan", 0220, entry, shrinker,
>  			    &shrinker_debugfs_scan_fops);
> -	return 0;
> +
> +fail:
> +	up_write(&shrinker_rwsem);
> +	return ret;
>  }
>  
>  int shrinker_debugfs_rename(struct shrinker *shrinker, const char *fmt, ...)
> @@ -243,6 +252,11 @@ struct dentry *shrinker_debugfs_detach(struct shrinker *shrinker,
>  	shrinker->name = NULL;
>  
>  	*debugfs_id = entry ? shrinker->debugfs_id : -1;
> +	/*
> +	 * Ensure that shrinker->registered has been set to false before
> +	 * shrinker->debugfs_entry is set to NULL.
> +	 */
> +	smp_wmb();
>  	shrinker->debugfs_entry = NULL;
>  
>  	return entry;
> @@ -266,14 +280,26 @@ static int __init shrinker_debugfs_init(void)
>  	shrinker_debugfs_root = dentry;
>  
>  	/* Create debugfs entries for shrinkers registered at boot */
> -	down_write(&shrinker_rwsem);
> -	list_for_each_entry(shrinker, &shrinker_list, list)
> +	rcu_read_lock();
> +	list_for_each_entry_rcu(shrinker, &shrinker_list, list) {
> +		if (!shrinker_try_get(shrinker))
> +			continue;
> +		rcu_read_unlock();
> +
>  		if (!shrinker->debugfs_entry) {
> -			ret = shrinker_debugfs_add(shrinker);
> -			if (ret)
> -				break;
> +			/* Paired with smp_wmb() in shrinker_debugfs_detach() */
> +			smp_rmb();
> +			if (READ_ONCE(shrinker->registered))
> +				ret = shrinker_debugfs_add(shrinker);
>  		}
> -	up_write(&shrinker_rwsem);
> +
> +		rcu_read_lock();
> +		shrinker_put(shrinker);
> +
> +		if (ret)
> +			break;
> +	}
> +	rcu_read_unlock();
>  
>  	return ret;
>  }

And all this churn and complexity can go away because the
shrinker_rwsem is still used to protect shrinker_register()
entirely....

-Dave.
-- 
Dave Chinner
david@fromorbit.com
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
