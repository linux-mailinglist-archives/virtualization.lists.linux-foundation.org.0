Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A5FCCCC9
	for <lists.virtualization@lfdr.de>; Sat,  5 Oct 2019 23:03:27 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id D7F32A80;
	Sat,  5 Oct 2019 21:03:19 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id B7F3F3EE
	for <virtualization@lists.linux-foundation.org>;
	Sat,  5 Oct 2019 21:03:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id AB5055E4
	for <virtualization@lists.linux-foundation.org>;
	Sat,  5 Oct 2019 21:03:17 +0000 (UTC)
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
	[209.85.222.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E66DE8AE40
	for <virtualization@lists.linux-foundation.org>;
	Sat,  5 Oct 2019 21:03:16 +0000 (UTC)
Received: by mail-qk1-f199.google.com with SMTP id z128so10551305qke.8
	for <virtualization@lists.linux-foundation.org>;
	Sat, 05 Oct 2019 14:03:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to;
	bh=DvhqDQz9pWxG7KXzbTPmwfuGqSdbefKRwFzkj54rgoI=;
	b=PX6JstpJezO6pLVXHozboT9H2BM5xeLoUEz/ChUOmWFinZ9AdQO1GCpXwj1vXcgjVZ
	yyxgc/ziqRqqZBXvm7N+CqFr5nwZOUz9FrdkSLkddwUKvM1dlMlEzBrrwMpIT3ddMkcx
	rY3Ebs9coJbEDmX3p/m+3bXc85HP7d/sL1yYCKSi0QX7swYbh7Oqo803Z3lbT66sSjZH
	m232nvKwzHEbsoorZ1HpDorDpm4mM/qaJhq8ANiyRidpH9KgKiZm6RitRpxtZVyY36ZB
	e8p/fCUsDwp3WB0I0WG4b32SLerXp0t7+/LWootct2zmDBKKST6SF0OvMJS+4IykJNnx
	j4QA==
X-Gm-Message-State: APjAAAU4r9qzFzvIHyf5hBfRHYXOquZHKIv3i4pt6xYEAAnAjYb2RLo7
	nY2sIWoWdJeG/mkWYiiMlkHqSb3BEHjo0pgsangyxEOQisfIByGtJc00j+m1gq3OjOIoYLbywnK
	uyqfQZTYUtxD2uPxeZLB9RFG36YyWZzsMww6cnp81cQ==
X-Received: by 2002:ac8:3267:: with SMTP id y36mr23307170qta.375.1570309396209;
	Sat, 05 Oct 2019 14:03:16 -0700 (PDT)
X-Google-Smtp-Source: APXvYqypjUN8MCESgBZwPW+AOx4m3ZVKJ5xEpPbF+izwghm3N22r1zQtgUmeDkg/K2GZvz8mO5bpvg==
X-Received: by 2002:ac8:3267:: with SMTP id y36mr23307156qta.375.1570309396012;
	Sat, 05 Oct 2019 14:03:16 -0700 (PDT)
Received: from redhat.com (bzq-79-176-10-77.red.bezeqint.net. [79.176.10.77])
	by smtp.gmail.com with ESMTPSA id
	92sm4746451qte.30.2019.10.05.14.03.13
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 05 Oct 2019 14:03:15 -0700 (PDT)
Date: Sat, 5 Oct 2019 17:03:11 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Tyler Sanderson <tysand@google.com>
Subject: Re: VIRTIO_BALLOON_F_FREE_PAGE_HINT
Message-ID: <20191005170200-mutt-send-email-mst@kernel.org>
References: <CAJuQAmpQmNN1EJHm4RinZnBven9Bx4GGqd-8Mt+L=3Z-3pd+zg@mail.gmail.com>
	<5D7EE856.2080602@intel.com>
	<09257686-90df-5c31-c35f-9d16fc77fee1@redhat.com>
	<CAJuQAmpQV26kb9vTyoW-Q7PsD0SOfX+otkiQZAks1L6k7rgdig@mail.gmail.com>
	<20191003142854-mutt-send-email-mst@kernel.org>
	<CAJuQAmrCiPsofYpDvm8=i32d9c9yCmKpJRBSRFkeubP_2=XKtw@mail.gmail.com>
	<0df87f00-5102-973b-3a7a-735e44f4ac3f@redhat.com>
	<20191004043446-mutt-send-email-mst@kernel.org>
	<30c6feba-7037-b52f-3ef4-4a5c50be0aff@redhat.com>
	<CAJuQAmpwQ4guGtHTTWC60EAYBuJ264d6CgWmWEHSnb8-CRtWBw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJuQAmpwQ4guGtHTTWC60EAYBuJ264d6CgWmWEHSnb8-CRtWBw@mail.gmail.com>
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

On Fri, Oct 04, 2019 at 12:03:43PM -0700, Tyler Sanderson wrote:
> I think DEFLATE_ON_OOM makes sense conceptually, it's just that the
> implementation doesn't play well with the rest of memory management under
> memory pressure.
> It could probably be fixed with enough effort, but IMO free page hinting =
gets
> 90% of the benefit without poking the dark corners of memory management a=
nd so
> is a net win.
> =

> The obvious place where free page hinting falls short (as David pointed o=
ut
> above) is that it can't pressure the page cache.
> Would it be possible=A0to add a mechanism that explicitly causes page cac=
he to
> shrink without requiring the system to be under memory pressure?

Which API would you call to shrink it?


> On Fri, Oct 4, 2019 at 1:56 AM David Hildenbrand <david@redhat.com> wrote:
> =

>     On 04.10.19 10:35, Michael S. Tsirkin wrote:
>     > On Fri, Oct 04, 2019 at 10:06:03AM +0200, David Hildenbrand wrote:
>     >> On 04.10.19 01:15, Tyler Sanderson wrote:
>     >>> I was mistaken, the problem with overcommit accounting is not fix=
ed by
>     >>> the change to shrinker interface.
>     >>> This means that large allocations are stopped even if they could
>     succeed
>     >>> by deflating the balloon.
>     >>
>     >> Please note that some people use the balloon for actual memory unp=
lug -
>     >> so initiating to deflate the balloon under any circumstances is
>     >> undesired. It's different with "VIRTIO_BALLOON_F_DEFLATE_ON_OOM" b=
eing
>     >> set - however that is barely the case (at least in the setups I kn=
ow :)
>     ).
>     >>
>     >> So yes, free page reporting is a different thing, because it reall=
y is
>     >> used to "hint" and not to "agree to unplug" in any scenario.
>     >>
>     >> --
>     >>
>     >> Thanks,
>     >>
>     >
>     >
>     > VIRTIO_BALLOON_F_DEFLATE_ON_OOM isn't really well thought through
>     > at the spec level either. For example, when will we inflate again?
>     > Current code does this at the next interrupt, which requires
>     > host to somehow know it's time to inflate.
>     >
> =

>     The host has access to memory stats of the guest, so it could come up
>     with some heuristics - but I do agree that is not well thought throug=
h -
>     one reason why it is barely used :)
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
