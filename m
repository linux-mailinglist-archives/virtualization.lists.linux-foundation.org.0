Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A57217EED
	for <lists.virtualization@lfdr.de>; Wed,  8 Jul 2020 07:11:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0B80D88959;
	Wed,  8 Jul 2020 05:11:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gG+DdBXV6X67; Wed,  8 Jul 2020 05:11:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 25DB6878DD;
	Wed,  8 Jul 2020 05:11:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0820AC016F;
	Wed,  8 Jul 2020 05:11:02 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F007BC016F
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Jul 2020 05:10:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id D604A876E3
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Jul 2020 05:10:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 25tB5jwlPYfv
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Jul 2020 05:10:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 88DA7876D4
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Jul 2020 05:10:58 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id l6so667585pjq.1
 for <virtualization@lists.linux-foundation.org>;
 Tue, 07 Jul 2020 22:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=NBE822KLqldc4RgjTMLNTL7g5oeVKxCy90pB/bhnbqA=;
 b=M8TEn2dPCMOvBZET4JnaMDMy0lYBY2dVPXjJw8C+E1TwnoBBTuk66pgPu2fJqXKVx1
 B5vvUPxm8LxCIC+/4HpDyj9eQK+FH+k8I9aySXAuKaiX/IyWQBl6c9oSucY0pJSrHdhk
 kmKB9L6ekk6XeywFS7Hoy/JAxeOTezXXqTtHJtI9+cpy4/BmerCtU+RNLW1bt+52PMrU
 Pk0YR8Vd5fowCPr/XR1VDl6eRw8K/yg3l2NMayfyGThwcRjmydMPd/jZW4d43k68o1N9
 VVe106DV3DoJXbOl4exlvOx0GiUCrvhWLD74gWkyw6keF+43d7HBt78+En6/6Yio7WIE
 LqLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=NBE822KLqldc4RgjTMLNTL7g5oeVKxCy90pB/bhnbqA=;
 b=Hi1Ay2eUhvna8M7K3pOMfKySeNtqlcjLRDtHQz7Yn2sLL7zAkPhqpo5Divaq8VO4rH
 mPqSayFCPGUYXGcIpzSO9mmHHcniaq3vQ3z5xA3DDS+B3gNJXMiWx8FsBjNnKJzjxqK5
 YI0gfNuoOylF0rH229QJzvHXUg2i6zhfaLjt0+BfupJ3n5RcHAW1hjMEJP0pjMUCv4+I
 XeJlI68I3U9y28VFJeHfPEQidQdYqBrH9Cz39JqxevV7IfAMEti+uN4/SACbqSu1zvpa
 WHj8wV9I84r2MH+YNBtUGFkg09HkaG8ilWtWbFSziKyKmrdoa2JUGzvyX2T3jLx3Yszs
 m3FQ==
X-Gm-Message-State: AOAM532qt09KusbhljpQENF0ZFKuy7KLpgk2B6npUMmIqyWUrqn9jGUF
 d1s5XhB8c0Dc+O2R8wqOo5A=
X-Google-Smtp-Source: ABdhPJy7irHmoUu0ynDnJY978dkucESYFNMabuBQ/Z2GkOluE+v9BuscHayaBiw3xLfuRm15lUcw4A==
X-Received: by 2002:a17:902:b114:: with SMTP id
 q20mr23771251plr.266.1594185058097; 
 Tue, 07 Jul 2020 22:10:58 -0700 (PDT)
Received: from localhost (61-68-186-125.tpgi.com.au. [61.68.186.125])
 by smtp.gmail.com with ESMTPSA id m20sm25080630pfk.52.2020.07.07.22.10.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 22:10:57 -0700 (PDT)
Date: Wed, 08 Jul 2020 15:10:52 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 0/6] powerpc: queued spinlocks and rwlocks
To: linuxppc-dev@lists.ozlabs.org, Waiman Long <longman@redhat.com>
References: <20200706043540.1563616-1-npiggin@gmail.com>
 <24f75d2c-60cd-2766-4aab-1a3b1c80646e@redhat.com>
 <1594101082.hfq9x5yact.astroid@bobo.none>
 <de3ead58-7f81-8ebd-754d-244f6be24af4@redhat.com>
In-Reply-To: <de3ead58-7f81-8ebd-754d-244f6be24af4@redhat.com>
MIME-Version: 1.0
Message-Id: <1594184204.ncuq7vstsz.astroid@bobo.none>
Cc: linux-arch@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Boqun Feng <boqun.feng@gmail.com>, linux-kernel@vger.kernel.org,
 kvm-ppc@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Ingo Molnar <mingo@redhat.com>, Anton Blanchard <anton@ozlabs.org>,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

Excerpts from Waiman Long's message of July 8, 2020 1:33 pm:
> On 7/7/20 1:57 AM, Nicholas Piggin wrote:
>> Yes, powerpc could certainly get more performance out of the slow
>> paths, and then there are a few parameters to tune.
>>
>> We don't have a good alternate patching for function calls yet, but
>> that would be something to do for native vs pv.
>>
>> And then there seem to be one or two tunable parameters we could
>> experiment with.
>>
>> The paravirt locks may need a bit more tuning. Some simple testing
>> under KVM shows we might be a bit slower in some cases. Whether this
>> is fairness or something else I'm not sure. The current simple pv
>> spinlock code can do a directed yield to the lock holder CPU, whereas
>> the pv qspl here just does a general yield. I think we might actually
>> be able to change that to also support directed yield. Though I'm
>> not sure if this is actually the cause of the slowdown yet.
> 
> Regarding the paravirt lock, I have taken a further look into the 
> current PPC spinlock code. There is an equivalent of pv_wait() but no 
> pv_kick(). Maybe PPC doesn't really need that.

So powerpc has two types of wait, either undirected "all processors" or 
directed to a specific processor which has been preempted by the 
hypervisor.

The simple spinlock code does a directed wait, because it knows the CPU 
which is holding the lock. In this case, there is a sequence that is 
used to ensure we don't wait if the condition has become true, and the
target CPU does not need to kick the waiter it will happen automatically
(see splpar_spin_yield). This is preferable because we only wait as 
needed and don't require the kick operation.

The pv spinlock code I did uses the undirected wait, because we don't
know the CPU number which we are waiting on. This is undesirable because 
it's higher overhead and the wait is not so accurate.

I think perhaps we could change things so we wait on the correct CPU 
when queued, which might be good enough (we could also put the lock
owner CPU in the spinlock word, if we add another format).

> Attached are two 
> additional qspinlock patches that adds a CONFIG_PARAVIRT_QSPINLOCKS_LITE 
> option to not require pv_kick(). There is also a fixup patch to be 
> applied after your patchset.
> 
> I don't have access to a PPC LPAR with shared processor at the moment, 
> so I can't test the performance of the paravirt code. Would you mind 
> adding my patches and do some performance test on your end to see if it 
> gives better result?

Great, I'll do some tests. Any suggestions for what to try?

Thanks,
Nick
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
