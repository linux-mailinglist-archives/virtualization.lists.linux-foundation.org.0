Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 4667D124376
	for <lists.virtualization@lfdr.de>; Wed, 18 Dec 2019 10:40:49 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A919C86BA8;
	Wed, 18 Dec 2019 09:40:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VAgePSYxFhfJ; Wed, 18 Dec 2019 09:40:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4B95386BA5;
	Wed, 18 Dec 2019 09:40:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 239E5C077D;
	Wed, 18 Dec 2019 09:40:47 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 78B68C077D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Dec 2019 09:40:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 61B1B86BA4
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Dec 2019 09:40:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H0GDcmBBEmKI
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Dec 2019 09:40:44 +0000 (UTC)
X-Greylist: delayed 00:21:31 by SQLgrey-1.7.6
Received: from deadmen.hmeau.com (helcar.hmeau.com [216.24.177.18])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 1BCDC86BA3
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Dec 2019 09:40:44 +0000 (UTC)
Received: from gondobar.mordor.me.apana.org.au ([192.168.128.4] helo=gondobar)
 by deadmen.hmeau.com with esmtps (Exim 4.89 #2 (Debian))
 id 1ihVU7-0005vy-3b; Wed, 18 Dec 2019 17:19:11 +0800
Received: from herbert by gondobar with local (Exim 4.89)
 (envelope-from <herbert@gondor.apana.org.au>)
 id 1ihVU3-00028K-0i; Wed, 18 Dec 2019 17:19:07 +0800
Date: Wed, 18 Dec 2019 17:19:07 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Will Deacon <will@kernel.org>
Subject: Re: read_barrier_depends() usage in vhost.c
Message-ID: <20191218091906.cmzgqnwyekak5dzv@gondor.apana.org.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191016233602.i2afxb5mb465laq6@willie-the-truck>
X-Newsgroups: apana.lists.os.linux.kernel,apana.lists.os.linux.virtualization
Organization: Core
User-Agent: NeoMutt/20170113 (1.7.2)
Cc: paulmck@kernel.org, mst@redhat.com, peterz@infradead.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 stern@rowland.harvard.edu
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

Will Deacon <will@kernel.org> wrote:
>
>> --->8
>> 
>> // drivers/vhost/vhost.c
>> static int get_indirect(struct vhost_virtqueue *vq,
>>                       struct iovec iov[], unsigned int iov_size,
>>                       unsigned int *out_num, unsigned int *in_num,
>>                       struct vhost_log *log, unsigned int *log_num,
>>                       struct vring_desc *indirect)
>> {
>>       [...]
>> 
>>       /* We will use the result as an address to read from, so most
>>        * architectures only need a compiler barrier here. */
>>       read_barrier_depends();
>> 
>> --->8
>> 
>> Unfortunately, although the barrier is commented (hurrah!), it's not
>> particularly enlightening about the accesses making up the dependency
>> chain, and I don't understand the supposed need for a compiler barrier
>> either (read_barrier_depends() doesn't generally provide this).
>> 
>> Does anybody know which accesses are being ordered here? Usually you'd need
>> a READ_ONCE()/rcu_dereference() beginning the chain, but I haven't managed
>> to find one...

I think what it's trying to separate is using indirect->addr as a
base and then reading from that through copy_from_iter.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
