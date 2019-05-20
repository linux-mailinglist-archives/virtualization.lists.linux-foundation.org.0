Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 1457523D1A
	for <lists.virtualization@lfdr.de>; Mon, 20 May 2019 18:20:11 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 4D754E59;
	Mon, 20 May 2019 16:20:07 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 9A5B4E36
	for <virtualization@lists.linux-foundation.org>;
	Mon, 20 May 2019 16:20:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 5B7C07FB
	for <virtualization@lists.linux-foundation.org>;
	Mon, 20 May 2019 16:20:04 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id e24so24698110edq.6
	for <virtualization@lists.linux-foundation.org>;
	Mon, 20 May 2019 09:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
	h=sender:date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=KSrzh3dt8vGRx1GLhd3yv0hcGYGGYgdj29jMwPdTPyo=;
	b=URPJu+icVm70ZncnIRWS9+vniz3rmUxjhmCwu7W4MToCzqBEsXtubl3Bkgm1tWc8Qn
	rD+hD5qQa6/zkUufit+dx40NQ3qvOXEAjKblpo4qIKcZAW7908Bjosr0KXZrSk57DjUP
	lcbmOIH4D8XzwkF/Gc8lgDqP/5VTAZXgci07c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
	:references:mime-version:content-disposition:in-reply-to:user-agent;
	bh=KSrzh3dt8vGRx1GLhd3yv0hcGYGGYgdj29jMwPdTPyo=;
	b=q1aJmEWHYm+FnGrEaleSZU+sUTAEboBL1CnmEOGCXEh3oyLgn6mJlIj70Pi8jZ7C+/
	UCc10owItRsp3IHEVZZL1fHmvFLcIS3XrAQRAAkJUqOc9KNQwkHLMA2hQ2bkUtfQfg/o
	o1bfOQ9nApYHEWVgaYtzeCzoC0e74al2jJACiD32TOxgyC5nB/oQsWkDgo7iqmb7Paz1
	jpS4mE3kxQjTRY3L3mYDmcI0nY5+kEdWK+Ea93IRHgNgz7N/KQXeahFltlWunkpUSIGU
	kpotmvap3JIpUX36fqymnvLBE059Fq/zz8YcmwBqX2vT7Ujqcj6UOUgppTygaAopRxeA
	s1qw==
X-Gm-Message-State: APjAAAVXeXpU50+xt2/M1hVsnhKOZqxU559T0DPTuY64cKQmO/D+7iEI
	6Rn2P6cSRzcMZlEHXJaSeSDfCQ==
X-Google-Smtp-Source: APXvYqwDpv00gFBm+Hge7QqAwV+moPF5WpEDAYQBH3Hgbz1pe4YNkJBMJ/G1cSK7PcP2uZiexwAPQA==
X-Received: by 2002:a50:a3b5:: with SMTP id s50mr77005198edb.149.1558369202967;
	Mon, 20 May 2019 09:20:02 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
	by smtp.gmail.com with ESMTPSA id h9sm4951992edb.80.2019.05.20.09.20.01
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 20 May 2019 09:20:01 -0700 (PDT)
Date: Mon, 20 May 2019 18:19:59 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 0/2] Add BO reservation to GEM VRAM
	pin/unpin/push_to_system
Message-ID: <20190520161959.GC21222@phenom.ffwll.local>
References: <20190516162746.11636-1-tzimmermann@suse.de>
	<20190517111703.j3qtk74awnnebupe@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190517111703.j3qtk74awnnebupe@sirius.home.kraxel.org>
X-Operating-System: Linux phenom 4.14.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: noralf@tronnes.org, Thomas Zimmermann <tzimmermann@suse.de>,
	airlied@linux.ie, puck.chen@hisilicon.com, dri-devel@lists.freedesktop.org,
	virtualization@lists.linux-foundation.org,
	z.liuxinliang@hisilicon.com, hdegoede@redhat.com,
	kong.kongxinwei@hisilicon.com, ray.huang@amd.com,
	daniel@ffwll.ch, zourongrong@gmail.com, sam@ravnborg.org,
	christian.koenig@amd.com
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

On Fri, May 17, 2019 at 01:17:03PM +0200, Gerd Hoffmann wrote:
>   Hi,
> 
> > It turns out that the bochs and vbox drivers automatically reserved and
> > unreserved the BO from within their pin and unpin functions. The other
> > drivers; ast, hibmc and mgag200; performed reservation explicitly. With the
> > GEM VRAM conversion, automatic BO reservation within pin and unpin functions
> > accidentally got lost. So for bochs and vbox, ttm_bo_validate() worked on
> > unlocked BOs.
> > 
> > This patch set fixes the problem by adding automatic reservation to the
> > implementation of drm_gem_vram_{pin,unpin,push_to_system}() to fix bochs
> > and vbox. It removes explicit BO reservation around the pin, unpin and
> > push-to-system calls in the ast, hibmc and mgag200 drivers.
> > 
> > The only exception is the cursor handling of mgag200. In this case, the
> > mgag200 driver now calls drm_gem_vram_{pin,unpin}_reserved(), which works
> > with reserved BOs. The respective code should be refactored in a future
> > patch to work with the regular pin and unpin functions.
> 
> Looks good, pushed to drm-misc-next.

I have a bit of design review (replied to patch 1), would be great if
either of you could address that as a follow up.

Thanks, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
