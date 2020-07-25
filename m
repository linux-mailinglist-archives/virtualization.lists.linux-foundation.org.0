Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D3522D8F9
	for <lists.virtualization@lfdr.de>; Sat, 25 Jul 2020 19:36:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 0A81A2011B;
	Sat, 25 Jul 2020 17:36:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pkgll7GCe4DZ; Sat, 25 Jul 2020 17:36:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id E1D512044E;
	Sat, 25 Jul 2020 17:36:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AABB4C004C;
	Sat, 25 Jul 2020 17:36:41 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 65BD1C004C
 for <virtualization@lists.linux-foundation.org>;
 Sat, 25 Jul 2020 17:36:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 6131C86D08
 for <virtualization@lists.linux-foundation.org>;
 Sat, 25 Jul 2020 17:36:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cgv77xGG86Fz
 for <virtualization@lists.linux-foundation.org>;
 Sat, 25 Jul 2020 17:36:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 3AC5986C53
 for <virtualization@lists.linux-foundation.org>;
 Sat, 25 Jul 2020 17:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595698598;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B89z7bSsPBlDl23wp5UaTzRFVbTHuOzryOgcGYTtGpc=;
 b=CXm8k7P2HvCxE9ebdDM9iILbeHNhJusvX2ESWVm68eZU7TgGSlhsbXRe7R/Mb4kcXG48fo
 kTJIQWJObO/dNp6EAbDaS+rgpYSzxQW+k+cFLCnmpl/dl/SnUuspQ1T0nCwxZjrCjj/04I
 qiSBaqNuIhbJxfyFe+o8EZDiM8NAlxM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-490-BmOl6uFZMzCjad-UsEKw1g-1; Sat, 25 Jul 2020 13:36:33 -0400
X-MC-Unique: BmOl6uFZMzCjad-UsEKw1g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D649E18C63C0;
 Sat, 25 Jul 2020 17:36:31 +0000 (UTC)
Received: from llong.remote.csb (ovpn-112-134.rdu2.redhat.com [10.10.112.134])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 462B15FC30;
 Sat, 25 Jul 2020 17:36:30 +0000 (UTC)
Subject: Re: [PATCH v3 5/6] powerpc/pseries: implement paravirt qspinlocks for
 SPLPAR
To: Peter Zijlstra <peterz@infradead.org>
References: <20200706043540.1563616-1-npiggin@gmail.com>
 <20200706043540.1563616-6-npiggin@gmail.com>
 <874kqhvu1v.fsf@mpe.ellerman.id.au>
 <8265d782-4e50-a9b2-a908-0cb588ffa09c@redhat.com>
 <20200723140011.GR5523@worktop.programming.kicks-ass.net>
 <845de183-56f5-2958-3159-faa131d46401@redhat.com>
 <20200723184759.GS119549@hirez.programming.kicks-ass.net>
 <20200724081647.GA16642@willie-the-truck>
 <8532332b-85dd-661b-cf72-81a8ceb70747@redhat.com>
 <20200725172630.GF10769@hirez.programming.kicks-ass.net>
From: Waiman Long <longman@redhat.com>
Organization: Red Hat
Message-ID: <4db0cff6-dabb-2f1b-df66-33ce2082088b@redhat.com>
Date: Sat, 25 Jul 2020 13:36:29 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200725172630.GF10769@hirez.programming.kicks-ass.net>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: linux-arch@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 Boqun Feng <boqun.feng@gmail.com>, virtualization@lists.linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>,
 linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 kvm-ppc@vger.kernel.org, Anton Blanchard <anton@ozlabs.org>,
 Will Deacon <will@kernel.org>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On 7/25/20 1:26 PM, Peter Zijlstra wrote:
> On Fri, Jul 24, 2020 at 03:10:59PM -0400, Waiman Long wrote:
>> On 7/24/20 4:16 AM, Will Deacon wrote:
>>> On Thu, Jul 23, 2020 at 08:47:59PM +0200, peterz@infradead.org wrote:
>>>> On Thu, Jul 23, 2020 at 02:32:36PM -0400, Waiman Long wrote:
>>>>> BTW, do you have any comment on my v2 lock holder cpu info qspinlock patch?
>>>>> I will have to update the patch to fix the reported 0-day test problem, but
>>>>> I want to collect other feedback before sending out v3.
>>>> I want to say I hate it all, it adds instructions to a path we spend an
>>>> aweful lot of time optimizing without really getting anything back for
>>>> it.
>>>>
>>>> Will, how do you feel about it?
>>> I can see it potentially being useful for debugging, but I hate the
>>> limitation to 256 CPUs. Even arm64 is hitting that now.
>> After thinking more about that, I think we can use all the remaining bits in
>> the 16-bit locked_pending. Reserving 1 bit for locked and 1 bit for pending,
>> there are 14 bits left. So as long as NR_CPUS < 16k (requirement for 16-bit
>> locked_pending), we can put all possible cpu numbers into the lock. We can
>> also just use smp_processor_id() without additional percpu data.
> That sounds horrific, wouldn't that destroy the whole point of using a
> byte for pending?
You are right. I realized that later on and had sent a follow-up mail to 
correct that.
>>> Also, you're talking ~1% gains here. I think our collective time would
>>> be better spent off reviewing the CNA series and trying to make it more
>>> deterministic.
>> I thought you guys are not interested in CNA. I do want to get CNA merged,
>> if possible. Let review the current version again and see if there are ways
>> we can further improve it.
> It's not a lack of interrest. We were struggling with the fairness
> issues and the complexity of the thing. I forgot the current state of
> matters, but at one point UNLOCK was O(n) in waiters, which is, of
> course, 'unfortunate'.
>
> I'll have to look up whatever notes remain, but the basic idea of
> keeping remote nodes on a secondary list is obviously breaking all sorts
> of fairness. After that they pile on a bunch of hacks to fix the worst
> of them, but it feels exactly like that, a bunch of hacks.
>
> One of the things I suppose we ought to do is see if some of the ideas
> of phase-fair locks can be applied to this.
That could be a possible solution to ensure better fairness.
>
> That coupled with a chronic lack of time for anything :-(
>
That is always true and I feel this way too:-)

Cheers,
Longman

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
