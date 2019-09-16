Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 823EEB32FE
	for <lists.virtualization@lfdr.de>; Mon, 16 Sep 2019 03:35:54 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 5BFC0CDB;
	Mon, 16 Sep 2019 01:35:47 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 08F50CCB
	for <virtualization@lists.linux-foundation.org>;
	Mon, 16 Sep 2019 01:35:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 8E88E70D
	for <virtualization@lists.linux-foundation.org>;
	Mon, 16 Sep 2019 01:35:45 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Sep 2019 18:35:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,492,1559545200"; d="scan'208";a="190934141"
Received: from unknown (HELO [10.239.13.7]) ([10.239.13.7])
	by orsmga006.jf.intel.com with ESMTP; 15 Sep 2019 18:35:32 -0700
Message-ID: <5D7EE856.2080602@intel.com>
Date: Mon, 16 Sep 2019 09:41:42 +0800
From: Wei Wang <wei.w.wang@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Tyler Sanderson <tysand@google.com>, 
	virtualization@lists.linux-foundation.org, mst@redhat.com
Subject: Re: VIRTIO_BALLOON_F_FREE_PAGE_HINT
References: <CAJuQAmpQmNN1EJHm4RinZnBven9Bx4GGqd-8Mt+L=3Z-3pd+zg@mail.gmail.com>
In-Reply-To: <CAJuQAmpQmNN1EJHm4RinZnBven9Bx4GGqd-8Mt+L=3Z-3pd+zg@mail.gmail.com>
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
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

On 09/14/2019 02:36 AM, Tyler Sanderson wrote:
> Hello, I'm curious about the intent of VIRTIO_BALLOON_F_FREE_PAGE_HINT 
> (commit 
> <https://github.com/torvalds/linux/commit/86a559787e6f5cf662c081363f64a20cad654195#diff-fd202acf694d9eba19c8c64da3e480c9>). 
>
>
> My understanding is that this mechanism works similarly to the 
> existing inflate/deflate queues. Pages are allocated by the guest and 
> then reported on VQ_FREE_PAGE.
>
> Question: Is there a limit to how many pages will be allocated? What 
> controls the amount of memory pressure applied?

No control for the limit currently. The implementation reports all the 
guest free pages to host.
The main usage for this feature so far is to have guest skip sending 
those guest free pages
(the more, the better) during live migration.


>
> In my experience with virtio balloon there are problems with the 
> mechanisms that are supposed to deflate the balloon in response to 
> memory pressure (e.g. OOM notifier).

What problem did you see? We've also changed balloon to use memory shrinker,
did you see the problem with shrinker as well?

>
> It seems an ideal balloon interface would allow the guest to round 
> robin through free guest physical pages, allowing the host to unback 
> them, but never having more than a few pages allocated to the balloon 
> at any one time. For example:
> 1. Guest allocates 1 page and notifies balloon device of this page's 
> address.
> 2. Host debacks the received page.
> 3. Guest frees the page.
> 4. Repeat at #1, but ensure that different pages are allocated each time.

Probably you need a mechanism to "ensure" different pages to be allocated.
The current implementation (having balloon hold the allocated pages) could
be thought of as one mechanism (it is simple).

>
> This way the "balloon size" is never more than a few pages and does 
> not create memory pressure. However the difficulty is in ensuring each 
> set of sent pages is disjoint from previously sent pages. Is there a 
> mechanism to round-robin allocations through all of guest physical 
> memory? Does VIRTIO_BALLOON_F_FREE_PAGE_HINT enable this?
>

AFAIK, no such round-robin allocation so far. This may need the page 
allocation to have states recording
the allocation history.

Best,
Wei
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
