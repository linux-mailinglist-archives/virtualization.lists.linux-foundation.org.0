Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD36CAE32
	for <lists.virtualization@lfdr.de>; Thu,  3 Oct 2019 20:32:00 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 260A112A5;
	Thu,  3 Oct 2019 18:31:54 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 2E75310BD
	for <virtualization@lists.linux-foundation.org>;
	Thu,  3 Oct 2019 18:31:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 8D1C4D3
	for <virtualization@lists.linux-foundation.org>;
	Thu,  3 Oct 2019 18:31:52 +0000 (UTC)
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
	[209.85.160.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BF5607FDCA
	for <virtualization@lists.linux-foundation.org>;
	Thu,  3 Oct 2019 18:31:51 +0000 (UTC)
Received: by mail-qt1-f198.google.com with SMTP id z21so3737081qtq.21
	for <virtualization@lists.linux-foundation.org>;
	Thu, 03 Oct 2019 11:31:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to;
	bh=d0HiH6tiOQHl/25OUuo+EKBoABU3SKKBTLsxWaMW8mI=;
	b=FoxQQO8hS3eF7EzuyZNmlxMr30HrDQ8NcYmwdSvvgY5AIqsMDHdDDI+m/8Fs3OD2D1
	K5GIsfUIbfOjY4JJYLYCg+Pt0nrBCHgZ6+Kp2KsDb8WRqSEPavaPXuW3Up4oGZW/P07F
	4eUe/6/NfazZ2iRhEBFMcXY0AqIUt48yesGDkNUrJE6ihfn/tg7fXopmBa7Mt9tf/Jev
	vfHuf7R6Jqo1RTSzl+Y2SBeKKJ7CZSA1RJj/jsKQ9qHURsF0p6g1AYS5u8hmK/vFWCiJ
	4Eph/TmxpTmAgxXAI2qZR0D1CqqX1vjGwe//Nl/oyTf+LxpTM/J+UT1TpluuMOH4Vg9o
	4MOw==
X-Gm-Message-State: APjAAAUcwBmxwmWhcq9SwoPNFlKwZ8YcnCk+WBt1pSXR/zVjO0xdiprP
	L/C1iDe9oqxQzCjPnZv6mVNjktrhOjn3JK5fY8+lK5CF2YkE/+WYFaFHhK8mtb4hJPvRysxv8kN
	lsO8+ncNAC+HcaUiXAbXtAB3LhFwHNezAoh9H+EcExA==
X-Received: by 2002:aed:2da3:: with SMTP id i32mr11682178qtd.299.1570127509616;
	Thu, 03 Oct 2019 11:31:49 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyUmidbD9b3FbN0lSK/EB3CvSF1AXzoX9igaSDDR/AtYxq7GqVMg7nESj9i15go34t1uwZB5g==
X-Received: by 2002:aed:2da3:: with SMTP id i32mr11682145qtd.299.1570127509339;
	Thu, 03 Oct 2019 11:31:49 -0700 (PDT)
Received: from redhat.com (bzq-79-176-10-77.red.bezeqint.net. [79.176.10.77])
	by smtp.gmail.com with ESMTPSA id
	t32sm2459286qtb.64.2019.10.03.11.31.47
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 03 Oct 2019 11:31:48 -0700 (PDT)
Date: Thu, 3 Oct 2019 14:31:44 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Tyler Sanderson <tysand@google.com>
Subject: Re: VIRTIO_BALLOON_F_FREE_PAGE_HINT
Message-ID: <20191003142854-mutt-send-email-mst@kernel.org>
References: <CAJuQAmpQmNN1EJHm4RinZnBven9Bx4GGqd-8Mt+L=3Z-3pd+zg@mail.gmail.com>
	<5D7EE856.2080602@intel.com>
	<09257686-90df-5c31-c35f-9d16fc77fee1@redhat.com>
	<CAJuQAmpQV26kb9vTyoW-Q7PsD0SOfX+otkiQZAks1L6k7rgdig@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJuQAmpQV26kb9vTyoW-Q7PsD0SOfX+otkiQZAks1L6k7rgdig@mail.gmail.com>
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: virtualization@lists.linux-foundation.org
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

On Thu, Oct 03, 2019 at 11:27:46AM -0700, Tyler Sanderson wrote:
> Sorry for the slow reply, I did some verification on my end. See responses
> inline.
> =

> On Mon, Sep 16, 2019 at 12:26 AM David Hildenbrand <david@redhat.com> wro=
te:
> =

>     On 16.09.19 03:41, Wei Wang wrote:
>     > On 09/14/2019 02:36 AM, Tyler Sanderson wrote:
>     >> Hello, I'm curious about the intent of VIRTIO_BALLOON_F_FREE_PAGE_=
HINT
>     >> (commit
>     >> <https://github.com/torvalds/linux/commit/
>     86a559787e6f5cf662c081363f64a20cad654195#
>     diff-fd202acf694d9eba19c8c64da3e480c9>).
>     >>
>     >>
>     >> My understanding is that this mechanism works similarly to the
>     >> existing inflate/deflate queues. Pages are allocated by the guest =
and
>     >> then reported on VQ_FREE_PAGE.
>     >>
>     >> Question: Is there a limit to how many pages will be allocated? Wh=
at
>     >> controls the amount of memory pressure applied?
>     >
>     > No control for the limit currently. The implementation reports all =
the
>     > guest free pages to host.
>     > The main usage for this feature so far is to have guest skip sending
>     > those guest free pages
>     > (the more, the better) during live migration.
> =

> How does this differ from the regular inflate/deflate queue?
> Also, couldn't you simply skip sending pages that do not have host pages
> backing them (assuming pages added to the balloon are unbacked to reclaim=
 the
> memory)?

Yes but putting most guest memory into the balloon would
slow the guest down significantly.


> =

>     >
>     >
>     >>
>     >> In my experience with virtio balloon there are problems with the
>     >> mechanisms that are supposed to deflate the balloon in response to
>     >> memory pressure (e.g. OOM notifier).
>     >
>     > What problem did you see? We've also changed balloon to use memory
>     shrinker,
>     > did you see the problem with shrinker as well?
> =

> Yes, I've observed problems both before and after the shrinker change (al=
though
> different problems).
> Before the shrinker change, the overcommit accounting=A0feature gets in t=
he way
> and prevents allocations, even when the balloon could be deflated. The OOM
> notifier is never invoked so the balloon driver's hook into the OOM=A0not=
ifier is
> useless.
> After the shrinker change the overcommit accounting problem is fixed, but=
 I
> have still found that forcibly deflating the balloon under memory pressur=
e is
> slow enough that random allocations can still fail (is there a timeout for
> allocations?).
> For example, I've seen:
> tysand@vm ~ $ fallocate -l 5G d/foo=A0 =A0 // d is tmpfs mount. This comm=
and causes
> balloon to require deflation.
> tysand@vm grep Mem /proc/meminfo
> MemTotal: =A0 =A0 =A0 =A08172852 kB
> MemFree: =A0 =A0 =A0 =A0 =A0138932 kB
> MemAvailable: =A0 =A0 =A083428 kB
> tysand@vm ~ $ grep Mem /proc/meminfo
> free(): invalid pointer
> -bash: wait_for: No record of process 5415
> free(): invalid pointer
> =

> Or similarly, I've seen SSH terminate with:
> tysand@vm:~$ grep Mem /proc/meminfo
> *** stack smashing detected ***: <unknown> terminated
> =

> Presumably the stack smashing and "free(): invalid pointer" are caused by
> malloc returning null in those programs and the programs not handling it
> correctly.
> =

> Notably I don't see the fallocate command fail. Usually only other proces=
ses.
> =

> =

>     >
>     >>
>     >> It seems an ideal balloon interface would allow the guest to round
>     >> robin through free guest physical pages, allowing the host to unba=
ck
>     >> them, but never having more than a few pages allocated to the ball=
oon
>     >> at any one time. For example:
>     >> 1. Guest allocates 1 page and notifies balloon device of this page=
's
>     >> address.
>     >> 2. Host debacks the received page.
>     >> 3. Guest frees the page.
>     >> 4. Repeat at #1, but ensure that different pages are allocated each
>     time.
>     >
>     > Probably you need a mechanism to "ensure" different pages to be
>     allocated.
>     > The current implementation (having balloon hold the allocated pages)
>     could
>     > be thought of as one mechanism (it is simple).
>     >
>     >>
>     >> This way the "balloon size" is never more than a few pages and does
>     >> not create memory pressure. However the difficulty is in ensuring =
each
>     >> set of sent pages is disjoint from previously sent pages. Is there=
 a
>     >> mechanism to round-robin allocations through all of guest physical
>     >> memory? Does VIRTIO_BALLOON_F_FREE_PAGE_HINT enable this?
> =

>     There are use cases where you really want memory pressure (page cache=
 is
>     the prime example). Anyhow, I think the use case you want the
>     "round-robin allocations" for is better tackled by "free page reporti=
ng"
>     (used to be called "free page hinting") currently discussed on various
>     lists.
> =

>     "allowing the host to unback them, but never having more than a few
>     pages allocated to the balloon at any one time." is similar to what
>     "free page reporting" does. We decided to only report bigger pages
>     (avoid splitting up THP in the hypervisor, overhead) and only
>     temporarily pull out a fixed amount of pages (16) from the page
>     allocator to avoid false-OOM. Guaranteeing forward progress (similar =
to
>     what you describe) is one important key concept.
> =

> =

> I'm really excited to see this being pursued! It looks like things are ac=
tively
> moving forward.
> =

> =

> =

>     --
> =

>     Thanks,
> =

>     David / dhildenb
> =

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
