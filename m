Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 95EFBCC3BB
	for <lists.virtualization@lfdr.de>; Fri,  4 Oct 2019 21:46:06 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 611CFC03;
	Fri,  4 Oct 2019 19:45:59 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id E17A7AC8
	for <virtualization@lists.linux-foundation.org>;
	Fri,  4 Oct 2019 19:45:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 738BF189
	for <virtualization@lists.linux-foundation.org>;
	Fri,  4 Oct 2019 19:45:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id 95809AC2E;
	Fri,  4 Oct 2019 19:45:55 +0000 (UTC)
Date: Fri, 4 Oct 2019 12:44:46 -0700
From: Davidlohr Bueso <dave@stgolabs.net>
To: Michel Lespinasse <walken@google.com>
Subject: Re: [PATCH 07/11] vhost: convert vhost_umem_interval_tree to half
	closed intervals
Message-ID: <20191004194446.tomd55ll4nlkelb6@linux-p48b>
Mail-Followup-To: Michel Lespinasse <walken@google.com>,
	akpm@linux-foundation.org, peterz@infradead.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org,
	Michael@google.com, Jason Wang <jasowang@redhat.com>,
	virtualization@lists.linux-foundation.org,
	Davidlohr Bueso <dbueso@suse.de>
References: <20191003201858.11666-1-dave@stgolabs.net>
	<20191003201858.11666-8-dave@stgolabs.net>
	<20191004121021.GA4541@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191004121021.GA4541@google.com>
User-Agent: NeoMutt/20180716
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Michael@google.com, peterz@infradead.org, Davidlohr Bueso <dbueso@suse.de>,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
	akpm@linux-foundation.org, linux-rdma@vger.kernel.org
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Linux virtualization <virtualization.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>,
	<mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>,
	<mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

On Fri, 04 Oct 2019, Michel Lespinasse wrote:

>On Thu, Oct 03, 2019 at 01:18:54PM -0700, Davidlohr Bueso wrote:
>> @@ -1320,15 +1320,14 @@ static bool iotlb_access_ok(struct vhost_virtqueue *vq,
>>  {
>>  	const struct vhost_umem_node *node;
>>  	struct vhost_umem *umem = vq->iotlb;
>> -	u64 s = 0, size, orig_addr = addr, last = addr + len - 1;
>> +	u64 s = 0, size, orig_addr = addr, last = addr + len;
>
>maybe "end" or "end_addr" instead of "last".
>
>> diff --git a/drivers/vhost/vhost.h b/drivers/vhost/vhost.h
>> index e9ed2722b633..bb36cb9ed5ec 100644
>> --- a/drivers/vhost/vhost.h
>> +++ b/drivers/vhost/vhost.h
>> @@ -53,13 +53,13 @@ struct vhost_log {
>>  };
>>
>>  #define START(node) ((node)->start)
>> -#define LAST(node) ((node)->last)
>> +#define END(node) ((node)->end)
>>
>>  struct vhost_umem_node {
>>  	struct rb_node rb;
>>  	struct list_head link;
>>  	__u64 start;
>> -	__u64 last;
>> +	__u64 end;
>>  	__u64 size;
>>  	__u64 userspace_addr;
>>  	__u32 perm;
>
>Preferably also rename __subtree_last to __subtree_end

Yes, this was was another one that I had in mind renaming, but
didn't want to grow the series -- all custom interval trees
name _last for the subtree iirc. Like my previous reply, I'd
rather leave this stuff for a followup series.

Thanks,
Davidlohr
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
