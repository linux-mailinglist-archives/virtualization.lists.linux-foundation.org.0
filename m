Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E1E22D410
	for <lists.virtualization@lfdr.de>; Sat, 25 Jul 2020 05:03:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4FF9F87106;
	Sat, 25 Jul 2020 03:03:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XEGg9iRCfdX0; Sat, 25 Jul 2020 03:03:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id AD3868714A;
	Sat, 25 Jul 2020 03:03:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9C217C004C;
	Sat, 25 Jul 2020 03:03:10 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 59246C004C
 for <virtualization@lists.linux-foundation.org>;
 Sat, 25 Jul 2020 03:03:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 41E8D87128
 for <virtualization@lists.linux-foundation.org>;
 Sat, 25 Jul 2020 03:03:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 94Dgt3H7Cnnh
 for <virtualization@lists.linux-foundation.org>;
 Sat, 25 Jul 2020 03:03:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 59AFD8711A
 for <virtualization@lists.linux-foundation.org>;
 Sat, 25 Jul 2020 03:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595646186;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dJKlmgtXl7uNqK+gi01GLPol8dXOhIFF+vRj8dKFHJ4=;
 b=Anfbl2kcsBmd0PI36qol9zAkRgk0jUE4SYT3TPGKkKjzvAS3che2+YFxVTPSqRXDyfgpzm
 LmpNe/cBem1mtkTk9js6lFbJ4UVjgW3QeWTr2joXPbTaN1ezEPrLtj+xi4sTGzyCy+lZ2W
 jk5KGjDzM1hkF1Z/u+KA3PY92MHdlsI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-388-taJbuqtoOr-9IUyajzXA8A-1; Fri, 24 Jul 2020 23:03:02 -0400
X-MC-Unique: taJbuqtoOr-9IUyajzXA8A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AA6B958;
 Sat, 25 Jul 2020 03:03:00 +0000 (UTC)
Received: from llong.remote.csb (ovpn-117-203.rdu2.redhat.com [10.10.117.203])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B17D18FA2A;
 Sat, 25 Jul 2020 03:02:58 +0000 (UTC)
Subject: Re: [PATCH v3 5/6] powerpc/pseries: implement paravirt qspinlocks for
 SPLPAR
From: Waiman Long <longman@redhat.com>
To: Will Deacon <will@kernel.org>, peterz@infradead.org
References: <20200706043540.1563616-1-npiggin@gmail.com>
 <20200706043540.1563616-6-npiggin@gmail.com>
 <874kqhvu1v.fsf@mpe.ellerman.id.au>
 <8265d782-4e50-a9b2-a908-0cb588ffa09c@redhat.com>
 <20200723140011.GR5523@worktop.programming.kicks-ass.net>
 <845de183-56f5-2958-3159-faa131d46401@redhat.com>
 <20200723184759.GS119549@hirez.programming.kicks-ass.net>
 <20200724081647.GA16642@willie-the-truck>
 <8532332b-85dd-661b-cf72-81a8ceb70747@redhat.com>
Organization: Red Hat
Message-ID: <ccf0c6a6-b7c3-8909-cc8f-0c5e7434c372@redhat.com>
Date: Fri, 24 Jul 2020 23:02:58 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <8532332b-85dd-661b-cf72-81a8ceb70747@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Cc: linux-arch@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 Boqun Feng <boqun.feng@gmail.com>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, virtualization@lists.linux-foundation.org,
 Ingo Molnar <mingo@redhat.com>, kvm-ppc@vger.kernel.org,
 Anton Blanchard <anton@ozlabs.org>, linuxppc-dev@lists.ozlabs.org
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

On 7/24/20 3:10 PM, Waiman Long wrote:
> On 7/24/20 4:16 AM, Will Deacon wrote:
>> On Thu, Jul 23, 2020 at 08:47:59PM +0200, peterz@infradead.org wrote:
>>> On Thu, Jul 23, 2020 at 02:32:36PM -0400, Waiman Long wrote:
>>>> BTW, do you have any comment on my v2 lock holder cpu info 
>>>> qspinlock patch?
>>>> I will have to update the patch to fix the reported 0-day test 
>>>> problem, but
>>>> I want to collect other feedback before sending out v3.
>>> I want to say I hate it all, it adds instructions to a path we spend an
>>> aweful lot of time optimizing without really getting anything back for
>>> it.
>>>
>>> Will, how do you feel about it?
>> I can see it potentially being useful for debugging, but I hate the
>> limitation to 256 CPUs. Even arm64 is hitting that now.
>
> After thinking more about that, I think we can use all the remaining 
> bits in the 16-bit locked_pending. Reserving 1 bit for locked and 1 
> bit for pending, there are 14 bits left. So as long as NR_CPUS < 16k 
> (requirement for 16-bit locked_pending), we can put all possible cpu 
> numbers into the lock. We can also just use smp_processor_id() without 
> additional percpu data. 

Sorry, that doesn't work. The extra bits in the pending byte won't get 
cleared on unlock. That will have noticeable performance impact. 
Clearing the pending byte on unlock will cause other performance 
problem. So I guess we will have to limit the cpu number in the locked byte.

Regards,
Longman

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
