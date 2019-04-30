Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 04484F2B9
	for <lists.virtualization@lfdr.de>; Tue, 30 Apr 2019 11:24:11 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id A073DF09;
	Tue, 30 Apr 2019 09:24:05 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id DFC30EF8
	for <virtualization@lists.linux-foundation.org>;
	Tue, 30 Apr 2019 09:23:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 4C91D71C
	for <virtualization@lists.linux-foundation.org>;
	Tue, 30 Apr 2019 09:23:35 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by asavdk4.altibox.net (Postfix) with ESMTPS id 47B1D8048B;
	Tue, 30 Apr 2019 11:23:29 +0200 (CEST)
Date: Tue, 30 Apr 2019 11:23:27 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 01/19] drm: Add |struct drm_gem_vram_object| and helpers
Message-ID: <20190430092327.GA13757@ravnborg.org>
References: <20190429144341.12615-1-tzimmermann@suse.de>
	<20190429144341.12615-2-tzimmermann@suse.de>
	<20190429195855.GA6610@ravnborg.org>
	<1d14ef87-e1cd-4f4a-3632-bc045a1981c6@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1d14ef87-e1cd-4f4a-3632-bc045a1981c6@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
	a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
	a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
	a=4dPDjfAGX_YviR3WrIMA:9 a=CjuIK1q_8ugA:10
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: airlied@linux.ie, puck.chen@hisilicon.com, Jerry.Zhang@amd.com,
	dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
	z.liuxinliang@hisilicon.com, hdegoede@redhat.com,
	kong.kongxinwei@hisilicon.com, ray.huang@amd.com,
	zourongrong@gmail.com, christian.koenig@amd.com
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

Hi Thomas.

> >> +
> >> +/**
> >> + * Returns the container of type &struct drm_gem_vram_object
> >> + * for field bo.
> >> + * @bo:		the VRAM buffer object
> >> + * Returns:	The containing GEM VRAM object
> >> + */
> >> +static inline struct drm_gem_vram_object* drm_gem_vram_of_bo(
> >> +	struct ttm_buffer_object *bo)
> >> +{
> >> +	return container_of(bo, struct drm_gem_vram_object, bo);
> >> +}
> > Indent funny. USe same indent as used in other parts of file for
> > function arguments.
> 
> If I put the argument next to the function's name, it will exceed the
> 80-character limit. From the coding-style document, I could not see what
> to do in this case. One solution would move the return type to a
> separate line before the function name. I've not seen that anywhere in
> the source code, so moving the argument onto a separate line and
> indenting by one tab appears to be the next best solution. Please let me
> know if there's if there's a preferred style for cases like this one.

Readability has IMO higher priority than some limit of 80 chars.
And it hurts readability (at least my OCD) when style changes
as you do with indent here. So my personal preference is to fix
indent and accect longer lines.

But you ask for a preferred style - which I do not think we have in this
case. So it boils down to what you prefer.

Enough bikeshedding, thanks for the quick response.

	Sam
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
