Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 1901622B5B9
	for <lists.virtualization@lfdr.de>; Thu, 23 Jul 2020 20:32:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C048486EB3;
	Thu, 23 Jul 2020 18:32:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0ZAAQeykG1EA; Thu, 23 Jul 2020 18:32:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 58A2486EA8;
	Thu, 23 Jul 2020 18:32:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2F087C004C;
	Thu, 23 Jul 2020 18:32:50 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A3384C004C
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Jul 2020 18:32:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 91AE7888C3
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Jul 2020 18:32:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2EI+agqG9Y3z
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Jul 2020 18:32:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 8544F888BD
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Jul 2020 18:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595529165;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sKozQ0KnMZ6/jFMcku3oZ38jLyvLbmaFhh4u3SNBWFc=;
 b=NwHy445dwDhWgN0bPLgyIj+OopsP/JsSnlx1eFsJ85xais64554m5Vn1lsPqgF5lXVIX+w
 TjtmbHE7/x0Du9iYjn2F0GsAndVnD8yqN8s2CvovvNwkEdOfh2PidzyBfrPYk3f4CzAu3d
 Sjckw28IO76Jrbv4HprKJS9wCJttDb8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-147-a7YRzGORP6i5sZOBhCiJ6Q-1; Thu, 23 Jul 2020 14:32:40 -0400
X-MC-Unique: a7YRzGORP6i5sZOBhCiJ6Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A8A501005510;
 Thu, 23 Jul 2020 18:32:38 +0000 (UTC)
Received: from llong.remote.csb (ovpn-119-128.rdu2.redhat.com [10.10.119.128])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 209FA19D7E;
 Thu, 23 Jul 2020 18:32:37 +0000 (UTC)
Subject: Re: [PATCH v3 5/6] powerpc/pseries: implement paravirt qspinlocks for
 SPLPAR
To: Peter Zijlstra <peterz@infradead.org>
References: <20200706043540.1563616-1-npiggin@gmail.com>
 <20200706043540.1563616-6-npiggin@gmail.com>
 <874kqhvu1v.fsf@mpe.ellerman.id.au>
 <8265d782-4e50-a9b2-a908-0cb588ffa09c@redhat.com>
 <20200723140011.GR5523@worktop.programming.kicks-ass.net>
From: Waiman Long <longman@redhat.com>
Organization: Red Hat
Message-ID: <845de183-56f5-2958-3159-faa131d46401@redhat.com>
Date: Thu, 23 Jul 2020 14:32:36 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200723140011.GR5523@worktop.programming.kicks-ass.net>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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

On 7/23/20 10:00 AM, Peter Zijlstra wrote:
> On Thu, Jul 09, 2020 at 12:06:13PM -0400, Waiman Long wrote:
>> We don't really need to do a pv_spinlocks_init() if pv_kick() isn't
>> supported.
> Waiman, if you cannot explain how not having kick is a sane thing, what
> are you saying here?
>
The current PPC paravirt spinlock code doesn't do any cpu kick. It does 
an equivalence of pv_wait by yielding the cpu to the lock holder only. 
The pv_spinlocks_init() is for setting up the hash table for doing 
pv_kick. If we don't need to do pv_kick, we don't need the hash table.

I am not saying that pv_kick is not needed for the PPC environment. I 
was just trying to adapt the pvqspinlock code to such an environment 
first. Further investigation on how to implement some kind of pv_kick 
will be something that we may want to do as a follow on.

BTW, do you have any comment on my v2 lock holder cpu info qspinlock 
patch? I will have to update the patch to fix the reported 0-day test 
problem, but I want to collect other feedback before sending out v3.

Cheers,
Longman

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
