Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 0804B22B33B
	for <lists.virtualization@lfdr.de>; Thu, 23 Jul 2020 18:12:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 70AA5884E6;
	Thu, 23 Jul 2020 16:12:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e+y-YH1ViRn3; Thu, 23 Jul 2020 16:12:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id C2FD4884F0;
	Thu, 23 Jul 2020 16:12:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9ABB0C016F;
	Thu, 23 Jul 2020 16:12:31 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5144CC004C
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Jul 2020 16:12:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 28F7A203EB
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Jul 2020 16:12:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aKM4KGg0i5wW
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Jul 2020 16:12:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by silver.osuosl.org (Postfix) with ESMTPS id 2BFC720371
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Jul 2020 16:12:28 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id x72so3234302pfc.6
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Jul 2020 09:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=VfbbwGv4m75EPfOW0baUXWN1YgZZBJIPGp1WqmJP8lg=;
 b=qY7x/OH9vNFSKZgAYfY6d0dn2o0FMZq+yslW+XFUxSS1ssfzwjJfnfDLJJz84VlOz6
 FPD5cVIIybdkZMWJ4OOnUqDLrl4fF4X24m/j769nnmiJsLn6LBjp37/nChKDD9EUZljz
 6dZoJG7phYQEZ8iU2fgjOjmHJHaygLKU4nNZb+JttbZn+9JZeXJy6B0yia9MH0Tp0cV+
 w6t52FrabMZwKTBfKVKaQx3eXb0AiAUV3lb7M+RIqfDaaYjI/UyhqwoowTCW0syaa86J
 Q+OoKNzCb2/DOBgNqaJXQKaNHd3UPmPnXrUgxodi/nq0w+y9beA/xQhR7vfQXQwUomi3
 0Wfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=VfbbwGv4m75EPfOW0baUXWN1YgZZBJIPGp1WqmJP8lg=;
 b=FwZ0IV1E/L/pw5NNT7JH5/O0QcZjovZdFV9ikM/rhXxLr5sFqmg4b2R+3hAX+hsYSy
 1l2tFlIb3rMkf/gBv8s2clKw68IQD7oHb97ZwBA++JBnjH/YgQ364tRgpLDCf20tIUHu
 hMlk6BJUHPvU7xpstRHNkbwjst92DK7GS6Xo/qXBK9LXZsCdlz9QAF2yVg2Mi5b94Njl
 chyZQXbTUdB0Mo/qL4GvBPj+WZEY9wY5ORHLgGb37uj6zApUo00Hm17NYtSLDzbBREiB
 LZf9x1977v3QCI6MA+jgPRhjuTCiWxO0MTAB/aFZHwuCdleM3LfV4ow4P5vXrSRDe76R
 gzNA==
X-Gm-Message-State: AOAM5334pj/32R3X6M5kPS+XbSo4gOAqrvBdUOE90fZrr+AUCzTwdkbZ
 WhSDfDyqxuPgMM20qXB47cA=
X-Google-Smtp-Source: ABdhPJwIS9sYrpZx7WWejQg+HhPLCX9upAMrSJWiKfOQ5V/wrdWIq5BPjwMO92bm7X0aGfua7RM/kg==
X-Received: by 2002:a62:768d:: with SMTP id r135mr5113582pfc.198.1595520747713; 
 Thu, 23 Jul 2020 09:12:27 -0700 (PDT)
Received: from localhost (110-174-173-27.tpgi.com.au. [110.174.173.27])
 by smtp.gmail.com with ESMTPSA id np5sm3527975pjb.43.2020.07.23.09.12.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jul 2020 09:12:27 -0700 (PDT)
Date: Fri, 24 Jul 2020 02:12:21 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 0/6] powerpc: queued spinlocks and rwlocks
To: Waiman Long <longman@redhat.com>, Peter Zijlstra <peterz@infradead.org>
References: <20200706043540.1563616-1-npiggin@gmail.com>
 <24f75d2c-60cd-2766-4aab-1a3b1c80646e@redhat.com>
 <1594101082.hfq9x5yact.astroid@bobo.none>
 <20200708084106.GE597537@hirez.programming.kicks-ass.net>
 <1595327263.lk78cqolxm.astroid@bobo.none>
 <eaabf501-80fe-dd15-c03c-f75ce4f75877@redhat.com>
 <1595510571.u39qfc8d1o.astroid@bobo.none>
 <af825bce-ecf3-66e4-ad63-a844dbd2e775@redhat.com>
In-Reply-To: <af825bce-ecf3-66e4-ad63-a844dbd2e775@redhat.com>
MIME-Version: 1.0
Message-Id: <1595520724.nzha5zvbid.astroid@bobo.none>
Cc: linux-arch@vger.kernel.org, Will Deacon <will@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, linux-kernel@vger.kernel.org,
 kvm-ppc@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Ingo Molnar <mingo@redhat.com>, Anton Blanchard <anton@ozlabs.org>,
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

Excerpts from Waiman Long's message of July 24, 2020 12:29 am:
> On 7/23/20 9:30 AM, Nicholas Piggin wrote:
>>> I would prefer to extract out the pending bit handling code out into a
>>> separate helper function which can be overridden by the arch code
>>> instead of breaking the slowpath into 2 pieces.
>> You mean have the arch provide a queued_spin_lock_slowpath_pending
>> function that the slow path calls?
>>
>> I would actually prefer the pending handling can be made inline in
>> the queued_spin_lock function, especially with out-of-line locks it
>> makes sense to put it there.
>>
>> We could ifdef out queued_spin_lock_slowpath_queue if it's not used,
>> then __queued_spin_lock_slowpath_queue would be inlined into the
>> caller so there would be no split?
> 
> The pending code is an optimization for lightly contended locks. That is 
> why I think it is appropriate to extract it into a helper function and 
> mark it as such.
> 
> You can certainly put the code in the arch's spin_lock code, you just 
> has to override the generic pending code by a null function.

I see what you mean. I guess that would work fine.

Thanks,
Nick
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
