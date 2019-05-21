Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE8724CD5
	for <lists.virtualization@lfdr.de>; Tue, 21 May 2019 12:36:03 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 62FE2AE7;
	Tue, 21 May 2019 10:35:58 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 05E15AAE
	for <virtualization@lists.linux-foundation.org>;
	Tue, 21 May 2019 10:35:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id A3B6DE3
	for <virtualization@lists.linux-foundation.org>;
	Tue, 21 May 2019 10:35:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 74491F74A3;
	Tue, 21 May 2019 10:35:52 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-74.ams2.redhat.com
	[10.36.117.74])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 601EB27CAD;
	Tue, 21 May 2019 10:35:47 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 62D0111AB8; Tue, 21 May 2019 12:35:46 +0200 (CEST)
Date: Tue, 21 May 2019 12:35:46 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 1/2] drm: Add drm_gem_vram_{pin/unpin}_reserved() and
	convert mgag200
Message-ID: <20190521103546.ehrrboraeoe2e6fh@sirius.home.kraxel.org>
References: <20190516162746.11636-1-tzimmermann@suse.de>
	<20190516162746.11636-2-tzimmermann@suse.de>
	<20190520161900.GB21222@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190520161900.GB21222@phenom.ffwll.local>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Tue, 21 May 2019 10:35:52 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: noralf@tronnes.org, airlied@linux.ie, puck.chen@hisilicon.com,
	dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
	z.liuxinliang@hisilicon.com, hdegoede@redhat.com,
	kong.kongxinwei@hisilicon.com, ray.huang@amd.com,
	Thomas Zimmermann <tzimmermann@suse.de>, zourongrong@gmail.com,
	sam@ravnborg.org, christian.koenig@amd.com
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

  Hi,

> I think would be good to have a lockdep_assert_held here for the ww_mutex.
> 
> Also general thing: _reserved is kinda ttm lingo, for dma-buf reservations
> we call the structure tracking the fences+lock the "reservation", but the
> naming scheme used is _lock/_unlock.
> 
> I think would be good to be consistent with that, and use _locked here.
> Especially for a very simplified vram helper like this one I expect that's
> going to lead to less wtf moments by driver writers :-)
> 
> Maybe we should also do a large-scale s/reserve/lock/ within ttm, to align
> more with what we now have in dma-buf.

Given that mgag200 is the only user I think the best way forward is to
improve the mgag200 cursor handling so we can just drop the _reserved
variants ...

When looking at mga_crtc_cursor_set() I suspect the easierst way to do
that would be to simply pin the cursor bo's at driver_load time, then we
don't have to bother with pinning in mga_crtc_cursor_set() at all.

Thomas, as you have test hardware, can you look into this?

thanks,
  Gerd

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
